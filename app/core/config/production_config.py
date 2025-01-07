import os
from dotenv import load_dotenv
from app.core.config.base_config import BaseConfig


load_dotenv()

class ProductionConfig(BaseConfig):
    DEBUG = 0
    SQLALCHEMY_DATABASE_URI = f"{os.getenv('DB_DRIVER')}{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOST')}:{os.getenv('DB_PORT')}/{os.getenv('DB_NAME')}"
