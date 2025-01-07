import os
from app.core.config.development_config import DevelopmentConfig
from app.core.config.testing_config import TestingConfig
from app.core.config.production_config import ProductionConfig
from dotenv import load_dotenv

load_dotenv()

config_list = {
    'development': DevelopmentConfig,
    'testing': TestingConfig,
    'production': ProductionConfig,
}
config = config_list[os.getenv('FLASK_ENV')]
