# -*- coding: utf-8 -*-
import scrapy
import re
import pdb
from wikipedia.items import *

class WikipediaSpider(scrapy.Spider):
  name = "Wikipedia"
  start_urls = [
    'https://en.wikipedia.org/wiki/New_Jersey_Legislative_Districts,_2011_apportionment'
  ]

  def parse(self, response):
    for h2 in response.css('h2'):
      district = h2.xpath('.//span/text()')
      if not district:
        continue
      district = district[0].extract()
      if district.find('District') != 0:
        continue
      for municipality in h2.xpath('following-sibling::p')[1].xpath('.//a/text()').extract():
        item = WikipediaMunicipalityItem()
        item['state'] = 'NJ'
        item['municipality'] = municipality
        item['district'] = district
        yield item
