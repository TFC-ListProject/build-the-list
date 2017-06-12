import scrapy

class VpapDistrictItem(scrapy.Item):
  name = scrapy.Field()
  url = scrapy.Field()
  representativeName = scrapy.Field()

class VpapDistrictCandidateItem(scrapy.Item):
  district = scrapy.Field()
  year = scrapy.Field()
  electionType = scrapy.Field()
  firstName = scrapy.Field()
  lastName = scrapy.Field()
  party = scrapy.Field()
  percentage = scrapy.Field()
  numVotes = scrapy.Field()
  dollars = scrapy.Field()
  wasIncumbent = scrapy.Field()
  wasWinner = scrapy.Field()
  withdrew = scrapy.Field()

class VpapDistrictVoteHistoryForOtherElection(scrapy.Item):
  district = scrapy.Field()
  electionName = scrapy.Field()
  vpapElectionId = scrapy.Field()
  candidateName = scrapy.Field()
  candidateParty = scrapy.Field()
  numVotes = scrapy.Field()
  percentage = scrapy.Field()

class VpapPrecinctVote(scrapy.Item):
  vpapPrecinctId = scrapy.Field()
  precinctName = scrapy.Field()
  districtType = scrapy.Field()
  districtNumber = scrapy.Field()
  year = scrapy.Field()
  candidateName = scrapy.Field()
  candidateParty = scrapy.Field()
  votes = scrapy.Field()
