# -*- coding: utf-8 -*-
import scrapy
import re
from nj.items import *

class NjSpider(scrapy.Spider):
  name = "Nj"
  start_urls = [
    'http://www.nj.gov/state/elections/election-information-archive-2016.html',
    'http://www.nj.gov/state/elections/election-information-archive-2015.html',
    'http://www.nj.gov/state/elections/election-information-archive-2014.html',
    'http://www.nj.gov/state/elections/election-information-archive-2013.html',
    'http://www.nj.gov/state/elections/election-information-archive-2012.html',
    'http://www.nj.gov/state/elections/election-information-archive-2011.html'
  ]

  def __init__(self):
    self.init_url_pattern()
    super(NjSpider, self).__init__()

  url_pattern_strings = [
    'gen-elect-presidential-results-.*',
    'municipality-hor-district\d+',
    'municipality-special-gen-election-results-district\d+',
    'GenAssembly-gen-elect-results-\d+[a-z]{2}-ld-municipality',
    'us-senate-gen-elec-results-by-county-.*',
    'us-hor-gen-elec-results-by-district-\d+',
    'general-election-results-governor-.*',
    'general-election-results-GenAssembly-StateSenate-district\d+',
    'presidential-[a-z]+-?[a-z]+',
    'county-us-senate-[a-z]+-?[a-z]+',
    'municipality-special-hor-district\d+',
    'municipality-special-gen-assembly-district\d+',
    'gen-elect-results-.*-leg-district-municipality-\d+'
  ]

  def init_url_pattern(self):
    patterns = map(
      lambda s: '(http://www.nj.gov/state/elections/[\d]{4}-results/\d{4}-' + s + ')',
      NjSpider.url_pattern_strings
    )
    self.url_pattern = re.compile('|'.join(patterns))

  def should_save_url(self, url):
    return bool(self.url_pattern.match(url))

  def parse(self, response):
    for href in response.css('a::attr(href)'):
      url = response.urljoin(href.extract())
      if self.should_save_url(url):
        item = NjUrlItem()
        item['url'] = url
        yield item
