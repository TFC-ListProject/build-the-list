# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/en/latest/topics/item-pipeline.html

import psycopg2
from vpap.items import *

class VpapPipeline(object):
  def __init__(self):
      self.connection = psycopg2.connect(
        host='localhost',
        database='vpap_spider',
        user='scrapy',
        password='Scr@py!'
      )
      self.cursor = self.connection.cursor()

  def process_item(self, item, spider):
    # check item type to decide which table to insert
    try:
      if type(item) is VpapDistrictCandidateItem:
        self.cursor.execute("""
          INSERT INTO district_house_candidates
          (district, year, electionType, firstName, lastName, party, percentage, numVotes,
           dollars, wasIncumbent, wasWinner, withdrew)
          VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""",
          (item.get('district'), item.get('year'), item.get('electionType'), item.get('firstName'),
           item.get('lastName'), item.get('party'), item.get('percentage'),  item.get('numVotes'),
           item.get('dollars'), item.get('wasIncumbent'), item.get('wasWinner'),
           item.get('withdrew')))
      elif type(item) is VpapDistrictVoteHistoryForOtherElection:
        self.cursor.execute("""
          INSERT INTO statewide_candidates
          (district, electionName, vpapElectionId, candidateName, candidateParty, numVotes,
          percentage)
          VALUES(%s, %s, %s, %s, %s, %s, %s)""",
          (item.get('district'), item.get('electionName'), item.get('vpapElectionId'),
           item.get('candidateName'), item.get('candidateParty'), item.get('numVotes'),
           item.get('percentage')))
      self.connection.commit()

    except psycopg2.DatabaseError, e:
      print "Error: %s" % e
    return item
