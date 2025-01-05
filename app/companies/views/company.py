from flask import Blueprint
from app.companies.models import Company
from app.companies.forms import CompanyForm
from app.core.views.base_views import BaseView


prefix_bp = 'companies'
bp = Blueprint(prefix_bp, __name__, url_prefix='/societe')


@bp.route('/index.html')
def index():
    fields = {
        'Nom' : 'name',
        'Enseigne': 'enseigne',
        'Slug': 'slug',
        'Création': 'created',
        'mise à jour': 'updated'
    }
    return BaseView.index(Company, prefix_bp, fields, 'une société')

@bp.route('/ajouter.html', methods=['GET', 'POST'])
def add():
    return BaseView.add(CompanyForm, Company, prefix_bp)

@bp.route('/<int:id>-supprimer.html')
def destroy(id):
    return BaseView.destroy(id, Company, prefix_bp)

@bp.route('/<int:id>-<string:slug>-editer.html', methods=['GET', 'POST'])
def edit(id, slug):
    return BaseView.edit(id, slug, Company, CompanyForm, prefix_bp)
