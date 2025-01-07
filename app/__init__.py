import importlib
from pathlib import Path
import humps
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from app.core.config import config
from app.core.libs.autoload import Autoload

db = SQLAlchemy()


def create_app():
    app = Flask(
        __name__,
        static_folder=config.STATIC,
        template_folder=config.TEMPLATES
    )
    app.config.from_object(config)
    config.init_app(app)
    migrate = Migrate()

    db.init_app(app)
    migrate.init_app(app, db)

    Autoload.import_models()
    migrate.init_app(app, db, directory=config.BASEDIR / config.MIGRATIONS)

    Autoload.import_views(app)
    Autoload.import_errors(app)
    # from app.core.errors import page_not_found, internal_server_error
    # app.register_error_handler(404, page_not_found)
    # app.register_error_handler(500, internal_server_error)

    # from app.auth import views as auth_views
    # app.register_blueprint(auth_views.bp, url_prefix='/auth')

    return app
