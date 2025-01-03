from flask import Blueprint
from app.companies.models import Civility
from app.companies.forms import CivilityForm
from app.companies.views.base_views import BaseView


prefix_bp = 'civility'
bp = Blueprint(prefix_bp, __name__, url_prefix='/civilites')


@bp.route('/index.html')
def index():
    fields = {
        'Nom' : 'name',
    }
    return BaseView.index(Civility, prefix_bp, fields, "une civilité")

@bp.route('/ajouter.html', methods=['GET', 'POST'])
def add():
    return BaseView.add(CivilityForm, Civility, prefix_bp)

@bp.route('/<int:id>-supprimer.html')
def destroy(id):
    return BaseView.destroy(id, Civility, prefix_bp)

@bp.route('/<int:id>-<string:slug>-editer.html', methods=['GET', 'POST'])
def edit(id, slug):
    return BaseView.edit(id, slug, Civility, CivilityForm, prefix_bp)
