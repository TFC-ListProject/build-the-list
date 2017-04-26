# -*- coding: utf-8 -*-

import scrapy

class WikipediaMunicipalityItem(scrapy.Item):
  state = scrapy.Field()
  municipality = scrapy.Field()
  district = scrapy.Field()
