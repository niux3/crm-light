import wtforms
from flask_wtf import FlaskForm


class CampaignForm(FlaskForm):
    name = wtforms.StringField('Nom de la campagne', validators=[
        wtforms.validators.DataRequired()
    ])
