import os

class DefaultConfig(object):
    DB_HOST = ''
    DB_NAME = ''
    DB_PASSWORD = ''
    DB_PORT = 5432
    DB_USERNAME = ''
    DEBUG = False
    SQLALCHEMY_ECHO = False
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    TESTING = False

class DevelopmentConfig(DefaultConfig):
    APP_ENV = 'development'
    DB_HOST = 'localhost'
    DB_NAME = 'buildthelist_development'
    DB_PASSWORD = ''
    DB_PORT = 5432
    DB_USERNAME = 'techforcampaigns'
    DEBUG = True
    SQLALCHEMY_ECHO = True

class ProductionConfig(DefaultConfig):
    APP_ENV = 'production'
    DB_HOST = 'techforcampaigns.czp6qfvbka3n.us-west-2.rds.amazonaws.com'
    DB_NAME = 'buildthelist_production'
    DB_PASSWORD = os.getenv('DB_PASSWORD')
    DB_PORT = 5432
    DB_USERNAME = 'techforcampaigns'
    DEBUG = False
