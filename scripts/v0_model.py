import sqlalchemy
import psycopg2
import pandas as pd
import numpy as np
import argparse
import sys
from patsy import dmatrices
from sklearn import metrics
from sklearn.preprocessing import Imputer
from sklearn.linear_model import LogisticRegression
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import cross_val_score
from sklearn.model_selection import ShuffleSplit
from sklearn.model_selection import train_test_split

# TODO: we shouldn't have to silence this warning
pd.options.mode.chained_assignment = None


def build_con_string(user, password, host, database):
    ''' generate connection string
    '''
    return 'postgresql://%s:%s@%s/%s' % (user, password, host, database)


def base_info(start_year, end_year, con_str):
    query = '''
        select
          distinct
          e.state,
          e.year,
          e.id as election_id,
          der.district_id
        from elections e
        join election_types et
          on e.election_type_id = et.id
        join district_election_results der
          on e.id = der.election_id
        where
          et.name like 'state %%%% house'
          and e.year >= %d
          and e.year <= %d''' % (start_year, end_year)
    return pd.read_sql(query, con=con_str)

def party_results(party_name, con_str):
    if party_name == 'R':
        name = 'republican'
    elif party_name == 'D':
        name = 'democratic'
    else:
        name = None

    query = '''
        select
            der.election_id,
            d.district_number as district_name,
            der.district_id,
            max(der.votes) as votes_%s,
            max(ce.dollars) as dollars_%s
        from district_election_results der
        join districts d
          on der.district_id = d.id
        join candidates_elections ce
          on der.candidate_id = ce.candidate_id
          and der.election_id = ce.election_id
        join parties p
          on ce.party_id = p.id
        where
          der.withdrew = False
          and p.name = '%s'
        group by 1, 2, 3
    ''' % (party_name, party_name, name)
    return pd.read_sql(query, con_str)

def current_spend(party_name, con_str):
    if party_name == 'R':
        name = 'republican'
    elif party_name == 'D':
        name = 'democratic'
    else:
        name = None

    query = '''
        select
            d.district_number as district_name,
            der.district_id,
            max(ce.dollars) as dollars_%s
        from district_election_results der
        join districts d
          on der.district_id = d.id
        join elections e
          on e.id = der.election_id
        join candidates_elections ce
          on der.candidate_id = ce.candidate_id
          and der.election_id = ce.election_id
        join parties p
          on ce.party_id = p.id
        where
          e.year = 2017
          and e.election_type_id = 2
          and p.name = '%s'
        group by 1, 2
    ''' % (party_name, name)
    return pd.read_sql(query, con_str)

def party_incumbent(party_name, con_str):
    if party_name == 'R':
        name = 'republican'
    elif party_name == 'D':
        name = 'democratic'
    else:
        name = None

    query = '''
    with candidate_results as (
        select
           e.id as election_id,
           der.district_id,
           der.candidate_id,
           der.won,
           e.year
        from elections e
        join election_types et
          on e.election_type_id = et.id
        join district_election_results der
          on e.id = der.election_id
        join candidates_elections ce
          on der.candidate_id = ce.candidate_id
          and der.election_id = ce.election_id
        join parties p
          on ce.party_id = p.id
        where
          et.name like 'state%%%%house'
          and der.votes > 0
          and p.name = '%s'
    )
        select
            c1.election_id,
            c1.district_id,
            count(c2.year) as incumbents_%s
        from candidate_results c1
        left join candidate_results c2
          on c1.district_id = c2.district_id
             and c1.candidate_id = c2.candidate_id
             and c2.won = 't'
             and c2.year < c1.year
        group by 1, 2
    ''' % (name, party_name)
    return pd.read_sql(query ,con_str)

def acs_data(kind, con_str):
    query = '''
        select
          d.id as district_id,
          d.district_number,
          d.state,
          acs.geographic_area_name_acs,
          acs.geographic_area_name,
          acs.api_year,
          acs.data_year,
          acs.state_fips,
          acs.state_legislative_district_lower_chamber,
          acs.median_household_income_e,
          acs.mean_household_income_e,
          acs.housing_total_occupied_e,
          acs.total_population_e,
          acs.total_population_male_e,
          acs.total_population_female_e,
          acs.race_total_e,
          acs.race_single_race_e,
          acs.race_twomore_race_e,
          acs.race_one_e,
          acs.race_one_white_e,
          acs.race_one_black_e,
          acs.race_one_amindian_e,
          acs.race_one_asian_e,
          acs.race_one_hawaiian_e,
          acs.race_one_other_e,
          acs.race_two_more_e,
          acs.race_two_white_black_e,
          acs.race_two_white_amindian_e,
          acs.race_two_white_asian_e,
          acs.race_two_black_amindian_e,
          acs.race_alone_or_combo_total_e,
          acs.race_alone_or_combo_white_e,
          acs.race_alone_or_combo_black_e,
          acs.race_alone_or_combo_amindian_e,
          acs.race_alone_or_combo_asian_e,
          acs.race_alone_or_combo_hawaiian_e,
          acs.race_alone_or_combo_other_e,
          acs.race_hispanic_latino_total_e,
          acs.race_hispanic_latino_total_hispanic_e,
          acs.race_hispanic_latino_total_nothispanic_e,
          acs.race_hispanic_latino_total_nothispanic_white_e,
          acs.race_hispanic_latino_total_nothispanic_black_e,
          acs.race_hispanic_latino_total_nothispanic_amindian_e,
          acs.race_hispanic_latino_total_nothispanic_asian_e,
          acs.race_hispanic_latino_total_nothispanic_hawaiian_e,
          acs.race_hispanic_latino_total_nothispanic_other_e,
          acs.race_hispanic_latino_total_nothispanic_twomore_e,
          acs.race_hispanic_latino_total_nothispanic_twomoreother_e,
          acs.race_hispanic_latino_total_nothispanic_twomorenotother_e,
          acs.educational_attainment_pop_25_plus_e,
          acs.educational_attainment_less_than_9th_grade_e,
          acs.educational_attainment_9th_to_12th_no_diploma_e,
          acs.educational_attainment_high_school_graduate_e,
          acs.educational_attainment_some_college_e,
          acs.educational_attainment_associates_e,
          acs.educational_attainment_bachelors_e,
          acs.educational_attainment_graduate_or_professional_e,
          acs.educational_attainment_pct_hs_grad_or_higher_pe,
          acs.educational_attainment_pct_bachelors_or_higher_pe,
          acs.citizen_18over_e,
          acs.citizen_18over_male_e,
          acs.citizen_18over_female_e
        from districts d
        join district_types dt
          on d.district_type_id = dt.id
        join census_%s_chamber_results acs
          on
            d.district_number = cast(acs.state_legislative_district_%s_chamber as int)
            and (
                (lower(d.state) = 'nj' and lower(acs.state) = 'new jersey')
                or
                (lower(d.state) = 'va' and lower(acs.state) = 'virginia')
            )
        where
          dt.name = 'state %s house'
    ''' % (kind, kind, kind)
    data = pd.read_sql(query, con_str)
    return data

def prior_election(kind, con_str):
    if kind == 'president':
        et_name = 'us president'
    elif kind == 'senate':
        et_name = 'us senate'
    else:
        print('bad election type')
        sys.exit(1)
    query = '''
    with candidate_results as (
        select
           e.id as election_id,
           der.district_id,
           e.year
        from elections e
        join election_types et
          on e.election_type_id = et.id
        join district_election_results der
          on e.id = der.election_id
        where
          et.name like 'state%%%%house'
    ),
    election_results as (
        select
           e.id as election_id,
           der.district_id,
           der.candidate_id,
           der.percentage as prior_demvote_%s,
           e.year
        from elections e
        join election_types et
          on e.election_type_id = et.id
        join district_election_results der
          on e.id = der.election_id
        join candidates_elections ce
          on der.candidate_id = ce.candidate_id
          and der.election_id = ce.election_id
        join parties p
          on ce.party_id = p.id
        where
          et.name = '%s'
          --- ugh, pick a side! definitely a hack
          --- counts Indys as dems, but we're only
          --- using this for senate/pres at the moment
          and (p.name = 'democratic' or p.name = 'independent')
    )
        select distinct
            c1.election_id,
            c1.district_id,
            c1.year,
            er.year as other_year,
            er.prior_demvote_%s
        from candidate_results c1
        left join election_results er
          on c1.district_id = er.district_id
        where er.year < c1.year
    ''' % (kind, et_name, kind)
    df = pd.read_sql(query, con_str)
    idx = df.groupby(['election_id', 'district_id', 'year'])['other_year'].transform(max) == df['other_year']
    df2 = df[idx]
    return df2[['election_id', 'district_id', 'prior_demvote_%s' % kind]]


def latest_election(kind, con_str):
    if kind == 'president':
        et_name = 'us president'
    elif kind == 'senate':
        et_name = 'us senate'
    else:
        print('bad election type')
        sys.exit(1)
    query = '''
        select
           e.year,
           e.state,
           der.district_id,
           d.district_number,
           der.candidate_id,
           max(der.percentage) as prior_demvote_%s
        from elections e
        join election_types et
          on e.election_type_id = et.id
        join district_election_results der
          on e.id = der.election_id
        join districts d
          on der.district_id = d.id
        join district_types dt
          on d.district_type_id = dt.id
        join candidates_elections ce
          on der.candidate_id = ce.candidate_id
          and der.election_id = ce.election_id
        join parties p
          on ce.party_id = p.id
        where
          et.name = '%s'
          --- ugh, pick a side! definitely a hack
          --- counts Indys as dems, but we're only
          --- using this for senate/pres at the moment
          and (p.name = 'democratic' or p.name = 'independent')
          and dt.name = 'state lower house'
        group by 1, 2, 3, 4, 5
    ''' % (kind, et_name)
    df = pd.read_sql(query, con_str)
    return df


def merge_to_elections_districts(df, new_df):
    merged = df.merge(new_df, how='left', on=['election_id', 'district_id'], suffixes=('', '_y'))
    cols_to_drop = [x for x in merged.columns if x.find('_y') > 0]
    merged = merged.drop(cols_to_drop, axis=1)
    return merged

def merge_census(df, census_df):
    merged = df.merge(census_df, how='left', on=['state', 'district_id'], suffixes=('', '_y'))
    cols_to_drop = [x for x in merged.columns if x.endswith('_y')]
    merged = merged.drop(cols_to_drop, axis=1)
    merged['aux'] = abs(merged['year'] - merged['api_year'])
    merged = merged.loc[merged.reset_index().groupby(['district_id', 'year'])['aux'].idxmin()]
    return merged


def generate_features(con_str):
    # base set of elections
    election_set = base_info(2001, 2015, con_str)
    n_races = len(election_set)

    # generate other features, each should have election_id, district_id
    r_outcomes = party_results('R', con_str)
    d_outcomes = party_results('D', con_str)
    r_incumbents = party_incumbent('R', con_str)
    d_incumbents = party_incumbent('D', con_str)
    prior_pres = prior_election('president', con_str)
    prior_senate = prior_election('senate', con_str)
    acs_lower = acs_data('lower', con_str)

    # merge in features
    df = election_set
    df = merge_to_elections_districts(df, r_outcomes)
    df = merge_to_elections_districts(df, d_outcomes)
    df = merge_to_elections_districts(df, d_incumbents)
    df = merge_to_elections_districts(df, r_incumbents)
    df = merge_to_elections_districts(df, prior_pres)
    df = merge_to_elections_districts(df, prior_senate)
    df = merge_census(df, acs_lower)

    # merge in features, make sure we didn't expand the dataset!
    assert n_races == len(df), 'too many rows were added'

    # mark uncontested races
    print('number of races: %d' % len(df))

    df = df.assign(uncontested_d = np.where(df.votes_r.isnull(), 1, 0))
    df = df.assign(uncontested_r = np.where(df.votes_d.isnull(), 1, 0))
    df['votes_d'][df.uncontested_r == 1] = 0
    df['votes_r'][df.uncontested_d == 1] = 0
    df['total_votes'] = df['votes_d'] + df['votes_r']
    df['votesp_d'] = (1.0 * df['votes_d']) / df['total_votes']
    df['votesp_r'] = (1.0 * df['votes_r']) / df['total_votes']

    # missing dollar values
    df['dollars_d'][df.uncontested_r == 1] = 0
    df['dollars_r'][df.uncontested_d == 1] = 0
    avg_d_dollars = df.dollars_d.mean()
    avg_r_dollars = df.dollars_r.mean()
    df['dollars_d'][df.dollars_d.isnull()] = avg_d_dollars
    df['dollars_r'][df.dollars_r.isnull()] = avg_r_dollars

    # missing incumbent values
    df['incumbents_d'][df['incumbents_d'].isnull()] = 0
    df['incumbents_r'][df['incumbents_r'].isnull()] = 0

    # add normalized dollar variables
    df['normalized_dollars_d'] = (1.0 * df['dollars_d']) / df['total_votes']
    df['normalized_dollars_r'] = (1.0 * df['dollars_r']) / df['total_votes']
    df['normalized_dollar_difference'] = df['normalized_dollars_d'] - df['normalized_dollars_r']
    df['normalized_dollar_ratio'] = (1.0 * df['dollars_d']) / df['dollars_r']
    max_ratio = df.normalized_dollar_ratio[df.normalized_dollar_ratio < np.inf].max()
    df.normalized_dollar_ratio[df.normalized_dollar_ratio == np.inf] = max_ratio

    # add normalized census variables
    df['normalized_white'] = df['race_one_white_e'] / df['total_population_e']
    df['normalized_black'] = df['race_one_black_e'] / df['total_population_e']
    df['turnout'] = df['total_votes'] / df['total_population_e']

    # add target
    df['dem_won'] = (df['votes_d'] > df['votes_r']).astype(int)
    df['dem_won_by_p'] = df['votes_d'] - df['votes_r']

    # join past election
    df['yearM2'] = df['year'] - 2
    df_with_prior = df.merge(
                       df,
                       how='inner',
                       left_on=['district_id', 'yearM2'],
                       right_on=['district_id', 'year'],
                       suffixes=('', '_prior1')
                    )

    print('number of races we have prior data for: %d' % len(df))

    return df_with_prior, acs_lower


def build_model(df, feature_columns, target_column, classification=True):

    contested_df = df[(df['uncontested_r'] == 0) & (df['uncontested_d'] == 0)]
    formula = '%s ~ %s' % (target_column, ' + '.join(feature_columns))

    print()
    print('model formula to run')
    print(formula)

    y, X = dmatrices(formula, contested_df, return_type="dataframe")

    X_train, X_test, y_train, y_test = train_test_split(
        X, y, test_size=0.2, random_state=42)

    print()
    print('train data points: %d' % len(y_train))
    print('train mean outcome: %.4f' % y_train.mean())
    print('accuracy of always predicting a loss')
    print(metrics.accuracy_score(y_test, [0] * len(y_test)))

    print()
    print('logistic regression:')
    lrC = 1e5
    lr_model = LogisticRegression(C=lrC)
    lr_model.fit(X_train, y_train)
    lr_probs = lr_model.predict_proba(X_test)
    lr_predictions = lr_model.predict(X_test)

    n_estimators = 100
    max_depth = 5
    rf_model = RandomForestClassifier(n_estimators=n_estimators, max_depth=max_depth)
    rf_model.fit(X_train, y_train)
    rf_probs = rf_model.predict_proba(X_test)
    rf_predictions = rf_model.predict(X_test)

    print('lr coeffs:')
    print(pd.DataFrame(list(zip(X.columns, np.transpose(lr_model.coef_)))))
    print('rf importance:')
    print(pd.DataFrame(list(zip(X.columns, np.transpose(rf_model.feature_importances_)))))
    print('accuracy')
    print(metrics.accuracy_score(y_test, lr_predictions))
    print(metrics.accuracy_score(y_test, rf_predictions))
    print('AUC')
    print(metrics.roc_auc_score(y_test, lr_probs[:, 1]))
    print(metrics.roc_auc_score(y_test, rf_probs[:, 1]))

    # run simple cross validation
    print()
    cv = ShuffleSplit(n_splits=10, test_size=0.2, random_state=0)
    lr_scores = cross_val_score(LogisticRegression(C=lrC), X, y, scoring='accuracy', cv=cv)
    rf_scores = cross_val_score(RandomForestClassifier(n_estimators=n_estimators, max_depth=max_depth), X, y, scoring='accuracy', cv=cv)

    print('results of logistic cross validation')
    print(lr_scores)
    print(lr_scores.mean())

    print('results of RF cross validation')
    print(rf_scores)
    print(rf_scores.mean())

    models = {
      'logistic_regression': lr_model,
      'random_forest': rf_model,
    }

    return formula, X.columns, models


def run_prediction(
        model,
        data_formatter,
        historical_data,
        census_data,
        all_president,
        all_senate,
        state,
        district_number,
        turnout,
        d_spend,
        r_spend):

    d = historical_data[(historical_data.state == state) &
                        (historical_data.district_number == district_number)]
    c = census_data[(census_data.state == state) &
                    (census_data.district_number == district_number)]

    p = all_president[(all_president.state == state) &
                  (all_president.district_number == district_number)]

    s = all_senate[(all_senate.state == state) &
                  (all_senate.district_number == district_number)]

    last_house_results = d.sort_values(by='year', ascending=False).iloc[0]
    last_census = c.sort_values(by='api_year', ascending=False).iloc[0]
    last_president = p.sort_values(by='year', ascending=False).iloc[0]
    last_senate = s.sort_values(by='year', ascending=False).iloc[0]

    # generate feature matrix
    features = pd.Series()
    features['Intercept'] = 1.0
    features['dem_won_prior1'] = last_house_results['dem_won']
    # TODO
    features['state'] = 'va'
    if last_house_results['dem_won']:
        incumbents_d = last_house_results['incumbents_d'] + 1
        incumbents_r = 0
    else:
        incumbents_d = 0
        incumbents_r = last_house_results['incumbents_r'] + 1
    features['incumbents_d'] = incumbents_d
    features['incumbents_r'] = incumbents_r
    features['uncontested_d'] = 0
    features['uncontested_r'] = 0

    if not d_spend:
        d_spend = d.dollars_d.mean()
    if not r_spend:
        r_spend = d.dollars_r.mean()
    if not r_spend:
        dollar_ratio = d.normalized_dollar_ratio.mean()
    else:
        dollar_ratio = (1.0 * d_spend) / r_spend

    features['normalized_dollar_ratio'] = dollar_ratio

    features['prior_demvote_president'] = last_president.loc['prior_demvote_president']
    features['prior_demvote_senate'] = last_senate.loc['prior_demvote_senate']

    features['votesp_r_prior1'] = last_house_results.votesp_r
    features['votesp_d_prior1'] = last_house_results.votesp_d
    features['uncontested_r_prior1'] = last_house_results.uncontested_r
    features['uncontested_d_prior1'] = last_house_results.uncontested_d
    features['total_population_e'] = last_census.total_population_e

    if not turnout:
        turnout = d.turnout.mean()
    features['turnout'] = turnout

    features['normalized_white'] = (1.0 * last_census['race_one_white_e']) / last_census['total_population_e']
    features['normalized_black'] = (1.0 * last_census['race_one_black_e']) / last_census['total_population_e']

    # this is a dummy entry that will be thrown away
    features['dem_won'] = 0

    model_features, _ = data_formatter(features)
    prediction = model.predict_proba(model_features.values.reshape(1, -1))

    classes = model.classes_
    pos_index = model.classes_.tolist().index(1)

    pos_prob = prediction[0][pos_index]

    return pos_prob


def generate_data_for_predictions(con_str):
    # Data needed for making predictions
    # TODO, we should probably run all the queries in sequence in the same place
    all_president = latest_election('president', con_str)
    all_senate = latest_election('senate', con_str)
    r_spend_df = current_spend('R', con_str)
    d_spend_df = current_spend('D', con_str)
    r_spend = {}
    d_spend = {}
    for _, row in r_spend_df.iterrows():
        if row['dollars_r'] > 0:
            r_spend[row['district_name']] = row['dollars_r']
    for _, row in d_spend_df.iterrows():
        if row['dollars_d'] > 0:
            r_spend[row['district_name']] = row['dollars_d']
    return {
      'all_president': all_president,
      'all_senate': all_senate,
      'current_r_spend': r_spend,
      'current_d_spend': d_spend,
    }


def make_predictions(prediction_data, historical_df, census_df, models, data_formatter):
    all_president = prediction_data['all_president']
    all_senate = prediction_data['all_senate']
    r_spend = prediction_data['current_r_spend']
    d_spend = prediction_data['current_d_spend']

    rf_model = models['random_forest']
    lr_model = models['logistic_regression']

    p = run_prediction(
        rf_model,
        data_formatter,
        historical_data=historical_df,
        census_data=census_df,
        all_president=all_president,
        all_senate=all_senate,
        state='va',
        district_number=32,
        turnout=None,
        d_spend = d_spend.get(32, None),
        r_spend = r_spend.get(32, None)
    )
    print 'va district 32: %.4f%%' % (p * 100)

    res = []
    run_rf = True
    for i in range(1, 101):
        if run_rf:
            rf = run_prediction(
                rf_model,
                data_formatter,
                historical_data=historical_df,
                census_data=census_df,
                all_president=all_president,
                all_senate=all_senate,
                state='va',
                district_number=i,
                turnout=None,
                d_spend = d_spend.get(i, None),
                r_spend = r_spend.get(i, None)
            )
        lr = run_prediction(
            lr_model,
            data_formatter,
            historical_data=historical_df,
            census_data=census_df,
            all_president=all_president,
            all_senate=all_senate,
            state='va',
            district_number=i,
            turnout=None,
            d_spend = d_spend.get(i, None),
            r_spend = r_spend.get(i, None)
        )
        res.append([i, rf])
        print 'va district %d: %.4f%%, %.4f%%' % (i, rf * 100, lr * 100)
        # print 'va district %d: %.4f' % (i, lr * 100)

    res.sort(key=lambda x: -x[1])

    for x in res[0:20]:
        print "district %d, score: %.4f" % (x[0], x[1])


def write_predictions(prediction_data, historical_df, census_df, model, data_formatter):
    all_president = prediction_data['all_president']
    all_senate = prediction_data['all_senate']
    r_spend = prediction_data['current_r_spend']
    d_spend = prediction_data['current_d_spend']

    results = []
    state = 'va'
    turnout_range = [x / 10.0 for x in range(1, 6)]
    spend_range = [20000, 50000, 100000, 200000, 500000, 1000000]

    n = 0

    for district in range(1, 101):
        for turnout in turnout_range:
            for d_spend in spend_range:
                res = run_prediction(
                    model,
                    data_formatter,
                    historical_data=historical_df,
                    census_data=census_df,
                    all_president=all_president,
                    all_senate=all_senate,
                    state='va',
                    district_number=district,
                    turnout=turnout,
                    d_spend=d_spend,
                    r_spend=r_spend.get(district, None)
                )
                results.append([state, district, turnout, d_spend, res])
                n += 1
                if n % 100 == 0:
                    print "%d predictions done" % n

    out_df = pd.DataFrame(results, columns=['state', 'district', 'turnout', 'spend', 'prediction'])
    out_df.to_csv('predictions.csv', index=False)

    return


def main(con_str):
    feature_columns = [
        'state',
        'incumbents_d',
        'incumbents_r',
        # 'uncontested_d',
        # 'uncontested_r',
        # 'total_votes',
        'normalized_dollar_ratio',
        'prior_demvote_president',
        'prior_demvote_senate',
        'votesp_r_prior1',
        'votesp_d_prior1',
        'uncontested_r_prior1',
        'uncontested_d_prior1',
        'dem_won_prior1',
        # 'total_population_e',
        'turnout',
        'normalized_white',
        'normalized_black'
    ]
    target_column = 'dem_won'

    df, census_df = generate_features(con_str)
    formula, training_columns, models = build_model(df, feature_columns, target_column)

    models = {
      'logistic_regression': models.get('logistic_regression', None),
      'random_forest': models.get('random_forest', None),
    }

    def data_formatter(df):
        y, X = dmatrices(formula, df, return_type="dataframe")
        X = X[training_columns]
        return X, y

    prediction_data = generate_data_for_predictions(con_str)
    make_predictions(prediction_data, df, census_df, models, data_formatter)
    # write_predictions(prediction_data, df, census_df, models['random_forest'], data_formatter)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-d',
                        '--database',
                        default='buildthelist_development',
                        help='database name')
    parser.add_argument('-u',
                        '--user',
                        required=True,
                        help='database user')
    parser.add_argument('-H',
                        '--host',
                        default='localhost',
                        help='database host')
    parser.add_argument('-p',
                        '--password',
                        default='',
                        help='database password')
    args = parser.parse_args()
    # python va_model.py \
    #       --database buildthelist_production \
    #       --host techforcampaigns.czp6qfvbka3n.us-west-2.rds.amazonaws.com \
    #       --user techforcampaigns \
    #       --password PASS

    con_str = build_con_string(args.user, args.password, args.host, args.database)

    main(con_str)
