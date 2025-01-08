import wtforms
from flask_wtf import FlaskForm
from app.marketing.libs import get_compare, get_data, get_accepted


class DiffusionListForm(FlaskForm):
    name = wtforms.StringField('Nom', validators=[
        wtforms.validators.DataRequired()
    ])

    accepted = wtforms.RadioField("La fiche est acceptée si", choices=get_accepted)
    data = wtforms.SelectField('Données', choices=get_data)
    compare = wtforms.SelectField('Compare', choices=get_compare)
    value = wtforms.StringField("Valeur")

