import scrapy

class VpapDistrictItem(scrapy.Item):
  name = scrapy.Field()
  url = scrapy.Field()
  representative_name = scrapy.Field()

class VpapDistrictCandidateItem(scrapy.Item):
  district = scrapy.Field()
  year = scrapy.Field()
  electionType = scrapy.Field()
  firstName = scrapy.Field()
  lastName = scrapy.Field()
  # url = scrapy.Field()
  party = scrapy.Field()
  percentage = scrapy.Field()
  numVotes = scrapy.Field()
  dollars = scrapy.Field()
  wasIncumbent = scrapy.Field()
  wasWinner = scrapy.Field()
  withdrew = scrapy.Field()

class VpapDistrictVoteHistoryForOtherElection(scrapy.Item):
  election_name = scrapy.Field()
  party = scrapy.Field()
  percentage = scrapy.Field()
