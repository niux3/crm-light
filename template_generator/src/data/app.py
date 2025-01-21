import csv
import json
from pathlib import Path
from pprint import pprint


root = Path(__file__).parent
csv_file = 'recruteurs-2.csv'
modulo = 25
count = 0
# def export_json(root, output):
    # with open(str(root / f'export-{count}.json'), 'w', encoding='utf-8') as f:
        # f.write(json.dumps(output, indent=4))


with open(csv_file, 'r', encoding='utf-8', newline='') as f:
    for i, row in enumerate(csv.DictReader(f)):
        if i == 11:
            pprint(row, indent=2)
    # data = [{**row, 'lastname': row['lastname'].title()} for row in csv.DictReader(f) if row['email'].strip() != '']


# for i, row in enumerate(data):
    # if i % modulo == 0:
        # count += 1
        # output = []
    # if i % modulo == modulo - 1:
        # export_json(root, output)
    # output.append(row)

# export_json(root, output)


# with open(str(root / 'export.json'), 'w', encoding='utf-8') as f:
    # f.write(json.dumps(data, indent=4))
