import sqlalchemy
import psycopg2
import pandas as pd
import numpy as np
import argparse
from patsy import dmatrices
from sklearn import metrics
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import cross_val_score
from sklearn.model_selection import ShuffleSplit


# TODO parameterize better
def build_con_string(database):
    return 'postgresql://localhost/%s' % database


def base_info(year, database):
    return pd.read_sql('''
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
          et.name = 'state house regular'
          and e.year = %d
    ''' % (year), con=build_con_string(database))

def party_results(party_name, database):
    return pd.read_sql('''
        select
            der.election_id,
            d.name as district_name,
            der.district_id,
            sum(der.votes) as votes_%s,
            sum(der.percentage) as percentage_votes_%s,
            sum(ce.dollars) as dollars_%s
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
    ''' % ((party_name, ) * 4), con=build_con_string(database))

def merge_to_elections_districts(df, new_df):
    merged = df.merge(new_df, how='left', on=['election_id', 'district_id'], suffixes=('', '_y'))
    cols_to_drop = [x for x in merged.columns if x.find('_y') > 0]
    merged = merged.drop(cols_to_drop, axis=1)
    return merged

def generate_features(database):
    # base set of elections
    election_set = pd.concat([base_info(2015, database),
                              base_info(2013, database)])
    n_races = len(election_set)

    # generate other features, each should have election_id, district_id
    r_outcomes = party_results('R', database)
    d_outcomes = party_results('D', database)

    # merge in features
    df = election_set
    df = merge_to_elections_districts(df, r_outcomes)
    df = merge_to_elections_districts(df, d_outcomes)

    # merge in features, make sure we didn't expand the dataset!
    assert n_races == len(df), 'too many rows were added'

    # add target
    df['dem_won'] = df['votes_d'] > df['votes_r']

    feature_columns = ['dollars_r', 'dollars_d']
    target_column = 'dem_won'

    # filter out NAs.. TODO may not be desirec for all columns
    print('WARNING: dropping rows with any NAs, this may or may not be intended!')
    df = df.dropna()

    return df, feature_columns, target_column

def run_model(df, feature_columns, target_column):
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
    print('simple logistic regression:')
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
                        required=True,
                        help='name of database')
    args = parser.parse_args()

    df, feature_columns, target_column = generate_features(args.database)
    run_model(df, feature_columns, target_column)
