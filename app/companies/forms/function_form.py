import wtforms
from flask_wtf import FlaskForm


class FunctionForm(FlaskForm):
    name = wtforms.StringField('Nom', validators=[
        wtforms.validators.DataRequired()
    ])
