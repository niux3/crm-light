import json
from flask import Blueprint, request, render_template, flash, redirect, url_for
from werkzeug.utils import secure_filename
from app.companies.forms import ImportDataForm
from app import db
from app.companies.models import (
    Company,
    Civility,
    Function,
    Employee,
    SectorOfActivity
)


prefix_bp = 'import_data'
bp = Blueprint(prefix_bp, __name__, url_prefix='/importer-donnes')


@bp.route('/json.html', methods=['GET', 'POST'])
def json_data():
    form = ImportDataForm()
    if request.method == 'POST' and form.validate_on_submit():
        f = request.files['data']
        content = str(f.read(), encoding='utf-8')
        data = json.loads(content)

        def get_data(model, condition, data_to_db):
            obj = model.query.filter(condition).first()
            if obj is None:
                obj = model(**data_to_db)
                db.session.add(obj)
                db.session.commit()
                db.session.refresh(obj)
            return obj

        for i, row in enumerate(data):
            civility = get_data(Civility, Civility.name==row['civility'], {
                'name': row['civility']
            })

            function = get_data(Function, Function.name==row['fonction'], {
                'name': row['fonction']
            })

            company = get_data(Company, Company.name==row['entreprise'], {
                'name': row['entreprise'],
                'address': row['location']
            })

            employee = get_data(Employee, Employee.email==row['email'], {
                'firstname': row['firstname'],
                'lastname': row['lastname'],
                'email': row['email'],
                'linkedin': row['profil'],
                'civility_id': civility.id,
                'function_id': function.id,
                'company_id': company.id
            })
        flash("importation avec succès", category="success")
        return redirect(url_for('companies.index'))
    ctx = {
        'form': form
    }
    return render_template('companies/edit.html', **ctx)
