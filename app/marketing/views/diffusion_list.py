import inspect
import re
from collections import defaultdict
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
        pattern = re.compile(r'(?P<field>.+)_(?P<number>\d+)$')
        data = dict(request.form)
        accepted = 'and' if data.get('accepted') == '0' else 'or'
        grouped_data = defaultdict(dict)
        for key, value in data.items():
            match = pattern.match(key)
            if match:
                match_dict = match.groupdict()  # Récupère les groupes nommés
                number = match_dict['number']
                field = match_dict['field']
                grouped_data[number][field] = value
        # Convertit les données regroupées en liste de dictionnaires
        result = [grouped_data[number] for number in sorted(grouped_data.keys(), key=int)]
        print(result)
        print(accepted)
        print('*' * 80)
        pprint(data, indent=4)
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
