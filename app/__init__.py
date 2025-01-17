import importlib
import logging
from logging.handlers import RotatingFileHandler
from pathlib import Path
import humps
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from app.core.config import config
from app.core.libs.autoload import Autoload


db = SQLAlchemy()
logger = logging.getLogger()


def create_app():
    app = Flask(
        __name__,
        static_folder=config.STATIC,
        template_folder=config.TEMPLATES
    )
    app.config.from_object(config)
    config.init_app(app)

    # logging
    logger.setLevel(logging.INFO)
    formatter = logging.Formatter('%(asctime)s :: %(levelname)s :: %(message)s')
    file_handler = RotatingFileHandler(str(config.BASEDIR.parent / 'log' / 'system.log'), 'a', 1000000, 1)
    file_handler.setLevel(logging.DEBUG)
    file_handler.setFormatter(formatter)
    logger.addHandler(file_handler)
    stream_handler = logging.StreamHandler()
    stream_handler.setLevel(logging.DEBUG)
    logger.addHandler(stream_handler)
    print(config.BASEDIR)

    migrate = Migrate()

    db.init_app(app)
    migrate.init_app(app, db)

    Autoload.import_models()
    migrate.init_app(app, db, directory=config.BASEDIR / config.MIGRATIONS)

    Autoload.import_views(app)
    Autoload.import_errors(app)

    # from app.auth import views as auth_views
    # app.register_blueprint(auth_views.bp, url_prefix='/auth')

    return app
