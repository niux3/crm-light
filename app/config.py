import os
from pathlib import Path
from dotenv import load_dotenv


load_dotenv()

class Config:
    FLASK_APP = os.getenv('FLASK_APP')
    SECRET_KEY = os.getenv('SECRET')
    MAIL_SERVER = os.getenv('MAIL_SERVER', 'smtp.googlemail.com')
    MAIL_PORT = os.getenv('MAIL_PORT', 587)
    # MAIL_USE_TLS = os.environ.get('MAIL_USE_TLS', 'true').lower() in ['true', 'on', '1']
    MAIL_USERNAME = os.getenv('MAIL_USERNAME')
    MAIL_LOGIN = os.getenv('MAIL_LOGIN')
    MAIL_PASSWORD = os.getenv('MAIL_PASSWORD')
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    BASEDIR = Path(__file__).resolve().parent.parent

    @staticmethod
    def init_app(app):
        print(f"config {os.getenv('FLASK_ENV')} loaded")


class DevelopmentConfig(Config):
    DEBUG = os.getenv('FLASK_DEBUG')
    # postgresql://scott:tiger@localhost/project
    SQLALCHEMY_DATABASE_URI = f"{os.getenv('DB_DRIVER')}{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOST')}:{os.getenv('DB_PORT')}/{os.getenv('DB_NAME')}"


class TestingConfig(Config):
    TESTING = os.getenv('TESTING')
    SQLALCHEMY_DATABASE_URI = os.getenv('DATABASE_URL')


class ProductionConfig(Config):
    DEBUG = 0
    SQLALCHEMY_DATABASE_URI = f"{os.getenv('DB_DRIVER')}{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOST')}:{os.getenv('DB_PORT')}/{os.getenv('DB_NAME')}"


config_list = {
    'development': DevelopmentConfig,
    'testing': TestingConfig,
    'production': ProductionConfig,
}
config = config_list[os.getenv('FLASK_ENV')]
