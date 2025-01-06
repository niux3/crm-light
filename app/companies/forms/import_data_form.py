import wtforms
from flask_wtf import FlaskForm


class ImportDataForm(FlaskForm):
    data = wtforms.FileField(
        'Importer des données', 
        validators=[
            wtforms.validators.DataRequired(),
            # wtforms.validators.Regexp(u'^.+\.json$')
        ],
        render_kw={"class": "show-for-sr"}
    )
