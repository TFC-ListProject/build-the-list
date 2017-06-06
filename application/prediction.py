class Prediction:
    def __init__(self, db):
        self.db = db

    def find(self, form_data):
        sql = '''
            SELECT
              p.chance_win
            FROM predictions p
            WHERE
              state = '{state}'
              AND district_number = {district_number}
              AND dollars_spent <= {dollars_spent}
              AND turnout <= {turnout}
            ORDER BY chance_win DESC
            LIMIT 1
        '''.format(
            state=form_data.get('state'),
            district_number=form_data.get('district_number'),
            dollars_spent=form_data.get('dollars_spent'),
            turnout=form_data.get('turnout')
        )
        chance_win = self.db.engine.execute(sql).fetchone()

        return {
            'chance_win': float(chance_win[0]),
        }
