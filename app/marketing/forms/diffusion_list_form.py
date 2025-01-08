import wtforms
from flask_wtf import FlaskForm
from app.companies.models import Company, Employee


# todo : doit être vraiment amélioré ! Mettre en place une chaine de responsabilité !! Il ya des filtres et le tableau de translation
def get_data():
    translation = {
        'name': 'nom entreprise',
        'phone': 'téléphone',
        'len_employees': "nombre d'employés",
        'firstname': "prénom",
        'lastname': "nom",
        'address': "adresse",
        'fullname': "nom entreprise",
        'function': "fonction",
        'sector_activity': "secteur d'activité",

    }
    data_company = [(row, row if not row in translation.keys() else translation[row]) for row in Company.__dict__.keys() if not row.startswith('_') and all(not row.startswith(r) for r in ['created', 'updated', 'description', 'id'])]
    data_employee = [(row, row if not row in translation.keys() else translation[row]) for row in Employee.__dict__.keys() if not row.startswith('_') and all(r not in row for r in ['created', 'updated', 'description', 'id'])]
    output = [("", "choisir un item")]
    return output + data_company + data_employee

# todo : doit être vraiment amélioré ! dégueu comme implémnentation
def get_compare():
    rows = [
        "Est égal à",
        "N'est pas égal à",
        "Est égal à (Ne respecte pas la casse)",
        "N'est pas égal à (Ne respecte pas la casse)",
        "Contient",
        "Ne contient pas",
        "Contient (Ne respecte pas la casse)",
        "Ne contient pas (Ne respecte pas la casse)",
        "Commence par",
        "Ne commence pas par",
        "Commence par (Ne respecte pas la casse)",
        "Ne commence pas par (Ne respecte pas la casse)",
        "Se termine par",
        "Ne se termine pas par",
        "Se termine par (Ne respecte pas la casse)",
        "Ne se termine pas par (Ne respecte pas la casse)",
        "Est vide",
    ]
    output = [("", "choisir un item")]
    return output + [(i, r) for i, r in enumerate(rows)]


class DiffusionListForm(FlaskForm):
    name = wtforms.StringField('Nom', validators=[
        wtforms.validators.DataRequired()
    ])
    data = wtforms.SelectField('Données', choices=get_data)
    compare = wtforms.SelectField('Compare', choices=get_compare)

