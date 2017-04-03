# -*- coding: utf-8 -*-
import scrapy
import re
import pdb
from vpap.items import *

def clean_spaces(s):
  return re.sub(r'\s+', ' ', s).strip() if s else s

class VpapSpider(scrapy.Spider):
  name = "Vpap"
  #start_urls = ['http://www.vpap.org/elections/house/candidates/general/']
  start_urls = ['http://www.vpap.org/offices/house-of-delegates-46/elections/?year_and_type=2017regular',
  'http://www.vpap.org/offices/house-of-delegates-42/elections/?year_and_type=2017regular']

  # def parse(self, response):
  #   for href in response.css('a.btn-block::attr(href)'):
  #     url = response.urljoin(href.extract())
  #     yield scrapy.Request(url, callback=self.parse_district)

  def parse(self, response):
    for value in response.css('select#year_and_type option::attr(value)'):
      year_and_type = value.extract()
      url = re.sub(r'year_and_type=.+', 'year_and_type=' + year_and_type, response.url)
      if year_and_type != '2017regular':
        yield scrapy.Request(url, callback=self.parse)

    for candidate_row in response.css('.panel-default table tr'):
      name_and_party = clean_spaces(candidate_row.css('td::text').extract_first())

      if name_and_party:
        p = re.compile('(.+?), (.+?)(\*?) \(([^()]+?)\)(.*)')
        m = p.match(name_and_party)
        if m:
          item = VpapDistrictCandidateItem()
          item['firstName'] = m.group(2)
          item['lastName'] = m.group(1)
          item['party'] = m.group(4)
          item['wasIncumbent'] = m.group(3) == '*'
          item['withdrew'] = m.group(5).find('Withdrew') >= 0 or m.group(5).find('Sought Other Office') >= 0

          dollars = candidate_row.css('td.right a::text').extract_first()
          item['dollars'] = int(re.sub(r'[$,]','', dollars))

          pUrl = re.compile('.*house-of-delegates-(\d+).*year_and_type=(\d+)(.*)')
          mUrl = pUrl.match(response.url)
          if mUrl:
            item['district'] = mUrl.group(1)
            item['year'] = mUrl.group(2)
            item['electionType'] = mUrl.group(3)

          outcome = clean_spaces(''.join(candidate_row.css('td.right + td.right::text').extract()))
          if outcome:
            p2 = re.compile('([\d,]+).*\((Winner - )?([\d\.]+)%\).*')
            m2 = p2.match(outcome)
            if m2:
              item['numVotes'] = int(m2.group(1).replace(',', ''))
              item['wasWinner'] = m2.group(2) == 'Winner - '
              item['percentage'] = float(m2.group(3))
          yield item

  def parse_district_profile(self, response):
    district_name = response.css('div#prime-container h3::text').extract_first()
    yield {
      'Name': district_name,
      'Url': response.url
    }
