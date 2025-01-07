from flask import Blueprint, jsonify
from app.core.libs.base_views import BaseView
from app.companies.models import Employee, Civility
from app.companies.forms import EmployeeForm


prefix_bp = 'employee'
bp = Blueprint(prefix_bp, __name__, url_prefix='/salaries')


@bp.route('/index.html')
def index():
    fields = {
        'Prénom et Nom' : 'fullname',
        'Fonction' : 'function',
        'Email': 'email',
        'Société': 'company',
    }
    return BaseView.index(Employee, prefix_bp, fields, "un salarié")

@bp.route('/ajouter.html', methods=['GET', 'POST'])
def add():
    return BaseView.add(EmployeeForm, Employee, prefix_bp)

@bp.route('/<int:id>-supprimer.html')
def destroy(id):
    return BaseView.destroy(id, Employee, prefix_bp)

@bp.route('/<int:id>-<string:slug>-editer.html', methods=['GET', 'POST'])
def edit(id, slug):
    to_slug = lambda form: f'{form.firstname.data} {form.lastname.data}' if form.firstname.data != '' else form.lastname.data
    return BaseView.edit(id, slug, Employee, EmployeeForm, prefix_bp, to_slug)
