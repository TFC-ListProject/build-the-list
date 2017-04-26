# -*- coding: utf-8 -*-

import psycopg2
from wikipedia.items import *

class WikipediaPipeline(object):
  def __init__(self):
    self.connection = psycopg2.connect(
      host='localhost',
      database='wikipedia_spider',
      user='scrapy',
      password='Scr@py!'
    )
    self.cursor = self.connection.cursor()

  def process_item(self, item, spider):
    try:
      if type(item) is WikipediaMunicipalityItem:
        self.cursor.execute("""
          INSERT INTO municipality_district
          (state, municipality, district)
          VALUES(%s, %s, %s)""",
          (item.get('state'), item.get('municipality'), item.get('district'))
        )
      self.connection.commit()

    except psycopg2.DatabaseError, e:
      print "Error: %s" % e

    return item
