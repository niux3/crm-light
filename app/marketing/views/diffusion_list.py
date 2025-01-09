import inspect
from pprint import pprint
from flask import Blueprint, render_template, request
from app.companies.models import Company, Employee
from app.marketing.forms.diffusion_list_form import DiffusionListForm
from app.core.libs.base_views import BaseView
from app import db


prefix_bp = 'diffusions_list'
bp = Blueprint(prefix_bp, __name__, url_prefix='/listes-de-diffusion')


@bp.route('/index.html')
def index():
    fields = {
        'Nom' : 'name',
        'Enseigne': 'enseigne',
        'Slug': 'slug',
        'Création': 'created',
        'Mise à jour': 'updated'
    }
    return BaseView.index(Company, prefix_bp, fields, 'une liste de diffusion')

@bp.route('/ajouter.html', methods=['GET', 'POST'])
def add():
    form = DiffusionListForm()
    if request.method == 'POST':
        pprint(dir(request), indent=4)
        print('*' *  80)
        pprint(request.data, indent=4)
        print('*' *  80)
        pprint(request.form, indent=4)
    ctx = {
        'form': form
    }
    return render_template('marketing/edit.html', **ctx)

@bp.route('/<int:id>-supprimer.html')
def destroy(id):
    return BaseView.destroy(id, Company, prefix_bp)

@bp.route('/<int:id>-<string:slug>-editer.html', methods=['GET', 'POST'])
def edit(id, slug):
    return BaseView.edit(id, slug, Company, CompanyForm, prefix_bp)
