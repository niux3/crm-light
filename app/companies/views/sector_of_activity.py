from flask import Blueprint
from app.companies.models import SectorOfActivity
from app.companies.forms import SectorOfActivityForm
from app.core.views.base_views import BaseView


prefix_bp = 'sector_activity'
bp = Blueprint(prefix_bp, __name__, url_prefix='/secteurs-d-activite')


@bp.route('/index.html')
def index():
    fields = {
        'Nom' : 'name',
    }
    return BaseView.index(SectorOfActivity, prefix_bp, fields, "un secteur d'activité")

@bp.route('/ajouter.html', methods=['GET', 'POST'])
def add():
    return BaseView.add(SectorOfActivityForm, SectorOfActivity, prefix_bp)

@bp.route('/<int:id>-supprimer.html')
def destroy(id):
    return BaseView.destroy(id, SectorOfActivity, prefix_bp)

@bp.route('/<int:id>-<string:slug>-editer.html', methods=['GET', 'POST'])
def edit(id, slug):
    return BaseView.edit(id, slug, SectorOfActivity, SectorOfActivityForm, prefix_bp)
