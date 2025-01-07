from flask import Blueprint
from app.core.libs.base_views import BaseView
from app.companies.models import Function
from app.companies.forms import FunctionForm


prefix_bp = 'function'
bp = Blueprint(prefix_bp, __name__, url_prefix='/fonction')


@bp.route('/index.html')
def index():
    fields = {
        'Nom' : 'name',
    }
    return BaseView.index(Function, prefix_bp, fields, "une fonction")

@bp.route('/ajouter.html', methods=['GET', 'POST'])
def add():
    return BaseView.add(FunctionForm, Function, prefix_bp)

@bp.route('/<int:id>-supprimer.html')
def destroy(id):
    return BaseView.destroy(id, Function, prefix_bp)

@bp.route('/<int:id>-<string:slug>-editer.html', methods=['GET', 'POST'])
def edit(id, slug):
    return BaseView.edit(id, slug, Function, FunctionForm, prefix_bp)
