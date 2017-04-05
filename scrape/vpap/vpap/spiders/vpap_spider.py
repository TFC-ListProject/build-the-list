# -*- coding: utf-8 -*-
import scrapy
import re
import pdb
from vpap.items import *

def clean_spaces(s):
  return re.sub(r'\s+', ' ', s).strip() if s else s

def parse_int(s):
  return int(re.sub(r'[$,]', '', s))

class VpapSpider(scrapy.Spider):
  name = "Vpap"
  start_urls = ['http://www.vpap.org/elections/house/candidates/general/']
  #start_urls = ['http://www.vpap.org/offices/house-of-delegates-46/elections/?year_and_type=2017regular']

  def parse(self, response):
    # enqueue the current election page for all 100 house districts
    for href in response.css('a.btn-block::attr(href)'):
      url = response.urljoin(href.extract())
      yield scrapy.Request(url, callback=self.parse_district_election)

  def parse_district_election(self, response):
    # enqueue the URLS for house elections in this district from past years
    for value in response.css('select#year_and_type option::attr(value)'):
      year_and_type = value.extract()
      url = re.sub(r'year_and_type=.+', 'year_and_type=' + year_and_type, response.url)
      if year_and_type != '2017regular':
        yield scrapy.Request(url, callback=self.parse_district_election)

    # enqueue the 2016 US President results for this district
    president_url = re.sub(r'elections.*', 'election-results-map/?election=8666', response.url)
    yield scrapy.Request(president_url, callback=self.parse_statewide_election)

    # parse the results on this page
    pUrl = re.compile('.*house-of-delegates-(\d+).*year_and_type=(\d+)(.*)')
    mUrl = pUrl.match(response.url)
    district = mUrl.group(1)
    year = mUrl.group(2)
    electionType = mUrl.group(3)

    for candidate_row in response.css('.panel-default table tr'):
      name_and_party = clean_spaces(candidate_row.css('td::text').extract_first())

      if name_and_party:
        p = re.compile('(.+?), (.+?)(\*?) \(([^()]+?)\)(.*)')
        m = p.match(name_and_party)
        if m:
          item = VpapDistrictCandidateItem()
          item['district'] = district
          item['year'] = year
          item['electionType'] = electionType
          item['firstName'] = m.group(2)
          item['lastName'] = m.group(1)
          item['party'] = m.group(4)
          item['wasIncumbent'] = m.group(3) == '*'
          item['withdrew'] = (
            m.group(5).find('Withdrew') >= 0 or
            m.group(5).find('Sought Other') >= 0 or
            m.group(5).find('Did not') >= 0
          )

          dollars = candidate_row.css('td.right a::text').extract_first()
          item['dollars'] = parse_int(dollars)

          outcome = clean_spaces(''.join(candidate_row.css('td.right + td.right::text').extract()))
          if outcome:
            p2 = re.compile('([\d,]+).*\((Winner - )?([\d\.]+)%\).*')
            m2 = p2.match(outcome)
            if m2:
              item['numVotes'] = parse_int(m2.group(1))
              item['wasWinner'] = m2.group(2) == 'Winner - '
              item['percentage'] = float(m2.group(3))
          yield item

  def parse_statewide_election(self, response):
    # enqueue other statewide elections
    selector = response.css('#election')
    for election in selector.xpath('.//option'):
      if election.xpath('text()').extract_first().find('House of Delegates') >= 0:
        continue
      election_id = election.xpath('@value').extract_first()
      newUrl = re.sub(r'election=.+', 'election=' + election_id, response.url)
      yield scrapy.Request(newUrl, callback=self.parse_statewide_election)

    # parse the results on this page
    election_name = clean_spaces(
      selector.xpath('.//option[@selected="selected"]/text()').extract_first()
    )
    election_id = selector.xpath('.//option[@selected="selected"]/@value').extract_first()
    pUrl = re.compile('.*house-of-delegates-(\d+)/.*')
    mUrl = pUrl.match(response.url)
    district = mUrl.group(1)

    for candidate_row in response.css('table.table.top-buffer').xpath('.//tr').extract():
      html = clean_spaces(candidate_row)
      p = re.compile('.*</div> (.*?) \((.*?)\).*<td class="right">(.*?)<.*<strong>(.*?)%<.*')
      m = p.match(html)
      if m:
        item = VpapDistrictVoteHistoryForOtherElection()
        item['district'] = district
        item['electionName'] = election_name
        item['vpapElectionId'] = election_id
        item['candidateName'] = m.group(1)
        item['candidateParty'] = m.group(2)
        item['numVotes'] = parse_int(m.group(3))
        item['percentage'] = float(m.group(4))
        yield item
