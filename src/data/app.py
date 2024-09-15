import csv
import json
from pathlib import Path
from pprint import pprint


root = Path(__file__).parent
csv_file = 'recruteurs.csv'

with open(csv_file, 'r', encoding='utf-8', newline='') as f:
    data = [{**row, 'lastname': row['lastname'].title()} for row in csv.DictReader(f) if row['email'].strip() != '']

with open(str(root / 'export.json'), 'w', encoding='utf-8') as f:
    f.write(json.dumps(data, indent=4))
