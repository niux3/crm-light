import wtforms
from flask_wtf import FlaskForm


class CompanyForm(FlaskForm):
    name = wtforms.StringField('Nom', validators=[
        wtforms.validators.DataRequired()
    ])
    enseigne = wtforms.StringField()
    email = wtforms.StringField()
    website = wtforms.URLField()
    description = wtforms.TextAreaField(render_kw={"class": "markdown"})
    # created_date = wtforms.DateField(render_kw={"value": "01/01/1970"})
    phone = wtforms.StringField('Téléphone')
    fax = wtforms.StringField()
    siren = wtforms.StringField()
    siret = wtforms.StringField()
    capital = wtforms.IntegerField(render_kw={"value": 0})
    ca_year = wtforms.IntegerField("Chiffre d'affaire", render_kw={"value": 0})
    naf = wtforms.StringField()
    blacklist = wtforms.BooleanField()
    # date_blacklist = wtforms.DateField('Date blacklist', render_kw={"value": "01/01/1970"})
    description_blacklist = wtforms.TextAreaField(render_kw={"class": "markdown"})
