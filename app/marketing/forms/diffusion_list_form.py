import wtforms
from flask_wtf import FlaskForm
from app.marketing.libs import (
    get_compare,
    get_data,
    get_accepted,
    get_date,
    get_custom_date
)


class DiffusionListForm(FlaskForm):
    name = wtforms.StringField('Nom', validators=[
        wtforms.validators.DataRequired()
    ])
    accepted = wtforms.RadioField("La fiche est acceptée si", choices=get_accepted, validators=[
        wtforms.validators.DataRequired()
    ])
    data = wtforms.SelectField('Données', choices=get_data, validators=[
        wtforms.validators.DataRequired()
    ])
    compare = wtforms.SelectField('Compare', choices=get_compare, validators=[
        wtforms.validators.DataRequired()
    ])
    value = wtforms.StringField("Valeur", validators=[
        wtforms.validators.DataRequired()
    ])
    date = wtforms.SelectField("Type de date", choices=get_date)
    custom = wtforms.SelectField("Personnalisation", choices=get_custom_date)
    begin = wtforms.StringField('De')
    end = wtforms.StringField('À')
