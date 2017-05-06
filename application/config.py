import os

class DefaultConfig(object):
    DATABASE_FILE = 'application/database.json'
    DB_PASSWORD = ''
    DEBUG = False
    SQLALCHEMY_ECHO = False
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    TESTING = False

class DevelopmentConfig(DefaultConfig):
    APP_ENV = 'development'
    DATABASE_FILE = 'application/database.json'
    DB_PASSWORD = ''
    DEBUG = True
    SQLALCHEMY_ECHO = True

class ProductionConfig(DefaultConfig):
    APP_ENV = 'production'
    DATABASE_FILE = '/tmp/beanstalk-database.json'
    DB_PASSWORD = os.getenv('DB_PASSWORD')
    DEBUG = False
