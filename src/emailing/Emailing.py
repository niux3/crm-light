import smtplib, random
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from .Model import Model
from .View import View
from .Configuration import Configuration

class Emailing:
    @staticmethod
    def run():
        config = Configuration.get()
        model = Model()
        users = model.get(config['path']['data'])
        citations = model.get(config['path']['citations'])

        server = smtplib.SMTP(config['smtp'], config['port'])
        server.ehlo()
        server.starttls()
        server.login(config['login'], config['password'])

        for row in users:
            msg = MIMEMultipart('alternative')
            msg['Subject'] = config['subject']
            msg['From'] = config['expediteur']
            msg['To'] = row['email']

            data = {'user' : row, 'citation' : random.choice(citations)}
            for index, value in enumerate(config['path']['view']):
                tpl = View.get(value)
                msg.attach(MIMEText(tpl.render(data), 'plain' if index == 0 else 'html'))

            server.sendmail(config['expediteur'], row['email'], msg.as_string().encode('utf-8'))
        server.quit()
