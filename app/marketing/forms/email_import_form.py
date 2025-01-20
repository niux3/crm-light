import wtforms
from flask_wtf import FlaskForm
from app.marketing.models import Campaign


class EmailImportForm(FlaskForm):
    campaign_id = wtforms.SelectField(
        'Campagne', 
        validators=[ wtforms.validators.DataRequired() ], 
        choices=lambda: [("", "choisir une campagne")] + [(row.id, row.name) for row in Campaign.query.all()]
    )
    template_html = wtforms.FileField(label="Importer template html", validators=[wtforms.validators.DataRequired()])
    template_text = wtforms.FileField(label="Importer template text", validators=[wtforms.validators.DataRequired()])
