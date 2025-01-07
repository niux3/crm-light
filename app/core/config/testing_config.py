import os
from app.core.config.base_config import BaseConfig


class TestingConfig(BaseConfig):
    TESTING = os.getenv('TESTING')
    SQLALCHEMY_DATABASE_URI = os.getenv('DATABASE_URL')
