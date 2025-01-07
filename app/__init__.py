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

    # from app.errors import views as errors_views
    # app.register_blueprint(errors_views.bp)

    from app.pages import views as pages_views
    from app.marketing.views import (
        campaign_bp,
        diffusion_list_bp
    )
    from app.companies.views import (
        company_bp,
        function_bp,
        civility_bp,
        sector_of_activity_bp,
        employee_bp,
        import_data_bp
    )
    app.register_blueprint(company_bp)
    app.register_blueprint(function_bp)
    app.register_blueprint(civility_bp)
    app.register_blueprint(sector_of_activity_bp)
    app.register_blueprint(employee_bp)
    app.register_blueprint(pages_views.bp)
    app.register_blueprint(campaign_bp)
    app.register_blueprint(import_data_bp)
    app.register_blueprint(diffusion_list_bp)

    # from app.auth import views as auth_views
    # app.register_blueprint(auth_views.bp, url_prefix='/auth')

    return app
