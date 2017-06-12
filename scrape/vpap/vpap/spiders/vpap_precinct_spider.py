import scrapy
import re
import pdb
from vpap.items import *

def get_start_urls():
  start_urls = []
  # for i in xrange(26, 35):
  for i in xrange(26, 3209):
    start_urls.append('http://www.vpap.org/elections/precinct/' + str(i))
  return start_urls

def clean_spaces(s):
  return re.sub(r'\s+', ' ', s).strip() if s else s

class VpapPrecinctSpider(scrapy.Spider):
  name = "VpapPrecinct"
  start_urls = get_start_urls()

  def normalize_precinct_name(self, name):
    return clean_spaces(name).replace('Precinct: ', '')

  def parse(self, response):
    p_url = re.compile('.*/(\d+)')
    m = p_url.match(response.url)
    vpap_precinct_id = int(m.group(1))

    precinct_name = self.normalize_precinct_name(response.css('div.top-buffer h3::text').extract()[0])

    for panel in response.css('div.panel-default'):
      anchors = panel.css('h4.panel-title a::text')
      if len(anchors) < 2:
        continue
      election_name = clean_spaces(panel.css('h4.panel-title a::text')[1].extract())

      district_type = None
      district_number = None

      hod_p = re.compile('(\d+) House of Delegates - District (\d+) - Regular General')
      m = hod_p.match(election_name)
      if m:
        district_type = 'state lower house'
        district_number = int(m.group(2))
      else:
        usr_p = re.compile('(\d+) US Representative - District (\d+) - Regular General')
        m = usr_p.match(election_name)
        if m:
          district_type = 'us congressional'
          district_number = int(m.group(2))

      if not m:
        continue

      year = int(m.group(1))

      for cand_div in panel.css('div.panel-body > div'):
        cand_name = cand_div.css('div::text')[1].extract()
        cand_party = re.sub('[()]', '', clean_spaces(cand_div.css('div::text')[2].extract()))
        votes_p = re.compile('(\d+) \(.*\)')
        m = votes_p.match(clean_spaces(cand_div.css('span::text').extract_first()))
        votes = int(m.group(1))

        item = VpapPrecinctVote()
        item['vpapPrecinctId'] = vpap_precinct_id
        item['precinctName'] = precinct_name
        item['districtType'] = district_type
        item['districtNumber'] = district_number
        item['year'] = year
        item['candidateName'] = cand_name
        item['candidateParty'] = cand_party
        item['votes'] = votes
        yield item
