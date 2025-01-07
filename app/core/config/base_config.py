import os
import importlib
from pathlib import Path
import humps
from dotenv import load_dotenv


load_dotenv()

class BaseConfig:
    FLASK_APP = os.getenv('FLASK_APP')
    SECRET_KEY = os.getenv('SECRET')
    MAIL_SERVER = os.getenv('MAIL_SERVER', 'smtp.googlemail.com')
    MAIL_PORT = os.getenv('MAIL_PORT', 587)
    # MAIL_USE_TLS = os.environ.get('MAIL_USE_TLS', 'true').lower() in ['true', 'on', '1']
    MAIL_USERNAME = os.getenv('MAIL_USERNAME')
    MAIL_LOGIN = os.getenv('MAIL_LOGIN')
    MAIL_PASSWORD = os.getenv('MAIL_PASSWORD')
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    BASEDIR = Path(__file__).resolve().parent.parent.parent
    STATIC = os.getenv('STATIC')
    TEMPLATES = os.getenv('TEMPLATES')
    MIGRATIONS = os.getenv('MIGRATIONS')

    @staticmethod
    def init_app(app):
        print(f"config {os.getenv('FLASK_ENV')} loaded")

    @staticmethod
    def import_models():
        registry_models = dict()
        for file in BaseConfig.BASEDIR.glob('*/**/models'):
            if Path(str(file / '__init__.py')).is_file():
                modules_raw = [
                    f.name.rsplit('.').pop(0) 
                    for f in file.glob('*.py') 
                    if not f.name.startswith('__')
                ]
                index_app = str(file).find(str(BaseConfig.BASEDIR.name))
                namespace = str(file)[index_app:].replace('/', '.')
                registry_models = {
                        humps.pascalize(value): getattr(importlib.import_module(f'{namespace}.{value}'), humps.pascalize(value))
                        for value in modules_raw
                }
                print('>> models : ', ', '.join([humps.pascalize(v) for v in modules_raw]), 'loaded !')
            else:
                print('ko ->', file)
        return registry_models
