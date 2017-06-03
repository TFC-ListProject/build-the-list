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
from sklearn.model_selection import cross_val_score
from sklearn.model_selection import ShuffleSplit

# TODO: we shouldn't have to silence this warning
pd.options.mode.chained_assignment = None

def build_con_string(user, pw, host, database):
    return 'postgresql://%s:%s@%s/%s' % (user, pw, host, database)


def base_info(year, con_str):
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
          and e.year = %d''' % (year)
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
    election_set = pd.concat([base_info(2015, con_str),
                              base_info(2013, con_str),
                              base_info(2011, con_str)])
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
    df['normalized_dollars_d'] = df['dollars_d'] / df['total_votes']
    df['normalized_dollars_r'] = df['dollars_r'] / df['total_votes']
    df['normalized_dollar_difference'] = df['normalized_dollars_d'] - df['normalized_dollars_r']
    df['normalized_dollar_ratio'] = df['normalized_dollars_d'] / df['normalized_dollars_r']
    max_ratio = df.normalized_dollar_ratio[df.normalized_dollar_ratio < np.inf].max()
    df.normalized_dollar_ratio[df.normalized_dollar_ratio == np.inf] = max_ratio

    # add normalized census variables
    df['normalized_white'] = df['race_one_white_e'] / df['total_population_e']
    df['normalized_black'] = df['race_one_black_e'] / df['total_population_e']

    # add target
    df['dem_won'] = df['votes_d'] > df['votes_r']

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

    feature_columns = [
        'state',
        'incumbents_d',
        'incumbents_r',
        'uncontested_d',
        'uncontested_r',
        'total_votes',
        'normalized_dollar_ratio',
        'prior_demvote_president',
        'prior_demvote_senate',
        'votes_r_prior1',
        'votes_d_prior1',
        'dem_won_prior1',
        'total_population_e',
        'normalized_white',
        'normalized_black'
    ]
    target_column = 'dem_won'

    return df_with_prior, feature_columns, target_column

def run_model(df, feature_columns, target_column):

    df = df[feature_columns + [target_column]]


    formula = '%s ~ %s' % (target_column, ' + '.join(feature_columns))
    print()
    print('model formula to run')
    print(formula)

    y, X = dmatrices(formula, df, return_type="dataframe")
    y = y['dem_won[True]']

    print()
    print('data points: %d' % len(y))
    print('mean outcome: %.4f' % y.mean())
    print('accuracy of always predicting a loss')
    print(metrics.accuracy_score(y, [0] * len(y)))

    print()
    print('logistic regression:')
    logreg = LogisticRegression(C=1e5)
    logreg.fit(X, y)
    probs = logreg.predict_proba(X)
    predictions = logreg.predict(X)

    print('coeffs:')
    print(pd.DataFrame(list(zip(X.columns, np.transpose(logreg.coef_)))))
    print('accuracy')
    print(metrics.accuracy_score(y, predictions))
    print('AUC')
    print(metrics.roc_auc_score(y, probs[:, 1]))

    # run simple cross validation
    print()
    print('results of cross validation')
    cv = ShuffleSplit(n_splits=10, test_size=0.2, random_state=0)
    scores = cross_val_score(LogisticRegression(), X, y, scoring='accuracy', cv=cv)
    print(scores)
    print(scores.mean())


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
    #        --user techforcampaigns \
    #        --password PASS

    con_str = build_con_string(args.user, args.password, args.host, args.database)

    df, feature_columns, target_column = generate_features(con_str)
    run_model(df, feature_columns, target_column)
