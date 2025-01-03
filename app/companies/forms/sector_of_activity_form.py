import wtforms
from flask_wtf import FlaskForm


class SectorOfActivityForm(FlaskForm):
    name = wtforms.StringField('Nom', validators=[
        wtforms.validators.DataRequired()
    ])
