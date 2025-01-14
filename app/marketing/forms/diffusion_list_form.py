import wtforms
from flask_wtf import FlaskForm
from app.marketing.models import Campaign
from app.marketing.libs import (
    get_compare,
    get_data,
    get_accepted,
    get_date,
    get_custom_date
)


class DiffusionListForm(FlaskForm):
    campaign_id = wtforms.SelectField('Campagne', validators=[
        wtforms.validators.DataRequired()
        ], choices=lambda: [("", "choisir une campagne")] + [(row.id, row.name) for row in Campaign.query.all()])
    name = wtforms.StringField('Nom', validators=[
        wtforms.validators.DataRequired()
    ])
    accepted = wtforms.RadioField("La fiche est acceptée si", choices=get_accepted, validators=[
        wtforms.validators.DataRequired()
    ])
    data_select_0 = wtforms.SelectField('Données', choices=get_data, validators=[
        wtforms.validators.DataRequired()
    ])
    compare_0 = wtforms.SelectField('Compare', choices=get_compare, validators=[
        wtforms.validators.DataRequired()
    ])
    value_0 = wtforms.StringField("Valeur", validators=[
        wtforms.validators.DataRequired()
    ])
    date_0 = wtforms.SelectField("Type de date", choices=get_date)
    custom_0 = wtforms.SelectField("Personnalisation", choices=get_custom_date)
    begin_0 = wtforms.StringField('De')
    end_0 = wtforms.StringField('À')
