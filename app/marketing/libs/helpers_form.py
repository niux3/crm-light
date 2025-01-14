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
    return output + [(i, r) for i, r in enumerate(rows, 1)]

def get_accepted():
    data = ["Toutes les conditions sont remplies", "Au moins une condition est remplie"]
    return [(i, r) for i, r in enumerate(data, 1)]

def get_date():
        return [("", "choisir un item")] + [(i, r) for i, r in enumerate(['créée', "mise à jour"], 1)]

def get_custom_date():
    output = [
        "Personnalisé",
        "Année précédente",
        "Année courante",
        "Année suivante",
        "Trimestre précédent",
        "Trimestre courant",
        "Trimestre suivant",
        "Mois précédent",
        "Mois courant",
        "Mois suivant",
        "Hier",
        "Aujourd'hui",
        "Demain",
        "Dans le futur",
        "Dans le passé",
    ]
    return [("", "choisir un item")] + [(i, r) for i, r in enumerate(output, 1)]
