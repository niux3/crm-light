import os
from dotenv import load_dotenv
from app.core.config.base_config import BaseConfig


load_dotenv()

class TestingConfig(BaseConfig):
    TESTING = os.getenv('TESTING')
    SQLALCHEMY_DATABASE_URI = os.getenv('DATABASE_URL')
