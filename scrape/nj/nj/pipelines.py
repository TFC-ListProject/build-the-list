import psycopg2
import psycopg2.extras
import pdb
from nj.items import *

class NjPipeline(object):
  def __init__(self):
    self.connection = psycopg2.connect(
      host='localhost',
      database='nj_spider',
      user='scrapy',
      password='Scr@py!'
    )
    self.cursor = self.connection.cursor()

  def process_item(self, item, spider):
    try:
      if type(item) is NjUrlItem:
        self.cursor.execute("""
          INSERT INTO urls (url) VALUES(%s) ON CONFLICT DO NOTHING""",
          (item.get('url'),)
        )
      self.connection.commit()

    except psycopg2.DatabaseError, e:
      print "Error: %s" % e
    return item
