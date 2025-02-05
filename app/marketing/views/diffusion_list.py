import inspect
import json
import re
from collections import defaultdict
from pprint import pprint
from flask import Blueprint, render_template, request, flash, url_for, redirect
from app.companies.models import Company, Employee
from app.marketing.models import DiffusionList
from app.marketing.forms.diffusion_list_form import DiffusionListForm, data_field_0, filters, date_filter
from app.core.libs.base_views import BaseView
from app import db


prefix_bp = 'diffusions_list'
bp = Blueprint(prefix_bp, __name__, url_prefix='/listes-de-diffusion')


@bp.route('/index.html')
def index():
    fields = {
        'Nom' : 'name',
        'Campagne': 'campaign',
        'Création': 'created',
        'Mise à jour': 'updated'
    }
    return BaseView.index(DiffusionList, prefix_bp, fields, 'une liste de diffusion')

@bp.route('/ajouter.html', methods=['GET', 'POST'])
def add():
    form = DiffusionListForm()
    if request.method == 'POST':
        relation_fields = ["relation"]
        pattern = re.compile(r'(?P<field>field_?(filter|value|value_from|value_to)?)_(?P<number>\d+)$')
        grouped_data = {
            "fields": defaultdict(dict),
            "relations": defaultdict(dict),
        }
        for key, value in request.form.items():
            match = pattern.match(key)
            if match:
                field = match.group("field")
                number = match.group("number")

                if field in relation_fields:
                    grouped_data["relations"][number][field] = value
                else:
                    grouped_data["fields"][number][field] = value
        output_json = {
            "fields": [grouped_data["fields"][num] for num in sorted(grouped_data["fields"].keys(), key=int)],
            "relations": [grouped_data["relations"][num] for num in sorted(grouped_data["relations"].keys(), key=int)],
            "accepted": request.form.get('accepted')
        }
        diffusions_list = DiffusionList(**{
            "name": request.form.get('name'),
            "campaign_id": int(request.form.get("campaign_id")),
            "data" : json.dumps(output_json)
        })
        db.session.add(diffusions_list)
        db.session.commit()
        db.session.refresh(diffusions_list)
        flash("L'ajout de filtre a bien été pris en compte", "success")
        return redirect(url_for('diffusions_list.index'))
    ctx = {
        'form': form,
        'data_field_0': json.dumps(data_field_0),
        'comparator': {
            'normal': json.dumps(filters),
            'date': json.dumps(date_filter)
        }
    }
    return render_template('marketing/add.html', **ctx)

@bp.route('/<int:id>-supprimer.html')
def destroy(id):
    return BaseView.destroy(id, DiffusionList, prefix_bp)

# todo
@bp.route('/<int:id>-<string:slug>-editer.html', methods=['GET', 'POST'])
def edit(id, slug):
    instance = DiffusionList.query.get_or_404(id)
    form = DiffusionListForm(obj=instance)

    if request.method == 'POST':
        print('post')
        print(json.loads(instance.data))
    ctx = {
        "form": form
    }
    return render_template('marketing/edit.html', **ctx)
