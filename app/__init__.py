from pathlib import Path
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from app.core.config import config

db = SQLAlchemy()


def create_app():
    app = Flask(
        __name__,
        static_folder='core/static',
        template_folder='core/templates'
    )
    app.config.from_object(config)
    config.init_app(app)
    migrate = Migrate()

    db.init_app(app)
    migrate.init_app(app, db)

    from app.companies.models import (
        Company,
        Function,
        Civility,
        Employee,
        SectorOfActivity
    )
    from app.marketing.models import (
        Campaign
    )
    migrate.init_app(app, db, directory=config.BASEDIR /'app'/ 'core' /'migrations')

    # from app.errors import views as errors_views
    # app.register_blueprint(errors_views.bp)

    from app.pages import views as pages_views
    from app.marketing import views as marketing_views
    from app.companies.views import (
        company_bp,
        function_bp,
        civility_bp,
        sector_of_activity_bp,
        employee_bp
    )
    app.register_blueprint(company_bp)
    app.register_blueprint(function_bp)
    app.register_blueprint(civility_bp)
    app.register_blueprint(sector_of_activity_bp)
    app.register_blueprint(employee_bp)
    app.register_blueprint(pages_views.bp)
    app.register_blueprint(marketing_views.bp)

    # from app.auth import views as auth_views
    # app.register_blueprint(auth_views.bp, url_prefix='/auth')

    return app
