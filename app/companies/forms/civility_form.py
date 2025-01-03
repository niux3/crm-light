import wtforms
from flask_wtf import FlaskForm


class CivilityForm(FlaskForm):
    name = wtforms.StringField('Nom', validators=[
        wtforms.validators.DataRequired()
    ])
