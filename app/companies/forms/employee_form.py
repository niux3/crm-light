import wtforms
from flask_wtf import FlaskForm
from app.companies.models import (
    Civility,
	Function,
	SectorOfActivity,
	Company
)

class EmployeeForm(FlaskForm):
    civility_id = wtforms.SelectField('Civilité', validators=[
        wtforms.validators.DataRequired()
        ], choices=lambda: [("", "choisir une civilité")] + [(row.id, row.name) for row in Civility.query.all()])
    firstname = wtforms.StringField('Prénom')
    lastname = wtforms.StringField('Nom', validators=[
        wtforms.validators.DataRequired()
    ])
    function_id = wtforms.SelectField('Fonction', choices=lambda: [("", "choisir une fonction")] + [(row.id, row.name) for row in Function.query.all()])
    company_id = wtforms.SelectField('Société', choices=lambda: [("", "choisir une société")] + [(row.id, row.name) for row in Company.query.all()])
    email = wtforms.StringField()
    website = wtforms.URLField()
    linkedin = wtforms.StringField()
    description = wtforms.TextAreaField(render_kw={"class": "markdown"})
    address = wtforms.TextAreaField('adresse')
    blacklist = wtforms.BooleanField()
    # date_blacklist = wtforms.DateField('Date blacklist', render_kw={"value": "01/01/1970"})
    description_blacklist = wtforms.TextAreaField(render_kw={"class": "markdown"})
