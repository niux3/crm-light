import wtforms
from flask_wtf import FlaskForm
from flask_wtf.file import FileAllowed, FileRequired
from app.marketing.models import Campaign

def valide_extension(form, field):
    print(dir(field))
    print(field._value())


class EmailImportForm(FlaskForm):
    campaign_id = wtforms.SelectField(
        'Campagne', 
        validators=[ wtforms.validators.DataRequired() ], 
        choices=lambda: [("", "choisir une campagne")] + [(row.id, row.name) for row in Campaign.query.all()]
    )
    template_html = wtforms.FileField(label="Importer template html", validators=[
        FileRequired(),
        FileAllowed(['html'], 'fichier html seulement')
    ])
    template_text = wtforms.FileField(label="Importer template text", validators=[
        FileRequired(),
        FileAllowed(['md', 'txt'], 'text or markdown seulement')
    ])
