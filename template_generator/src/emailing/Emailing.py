import smtplib, random, logging
from logging.handlers import RotatingFileHandler
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from .Model import Model
from .View import View
from .Configuration import Configuration

class Emailing:
    @staticmethod
    def run():
        config = Configuration.get()

        logger = logging.getLogger()
        logger.setLevel(logging.DEBUG)
        formatter = logging.Formatter('%(asctime)s :: %(levelname)s :: %(message)s')
        file_handler = RotatingFileHandler(config['path']['log'], 'a', 1000000, 1)
        file_handler.setLevel(logging.DEBUG)
        file_handler.setFormatter(formatter)
        logger.addHandler(file_handler)
        stream_handler = logging.StreamHandler()
        stream_handler.setLevel(logging.DEBUG)
        logger.addHandler(stream_handler)

        model = Model()
        users = model.get(config['path']['data'])

        server = smtplib.SMTP(config['smtp'], config['port'])
        server.ehlo()
        server.starttls()
        server.login(config['login'], config['password'])

        for row in users:
            msg = MIMEMultipart('alternative')
            msg['Subject'] = config['subject']
            msg['From'] = config['expediteur']
            msg['To'] = row['email']

            querystring = [
                f'civility={row["civility"]}',
                f'firstname={row["firstname"]}',
                f'lastname={row["lastname"]}',
            ]
            data = {
                'user' : row, 
                'contact' : f'{row["civility"]} {row["lastname"]}',
                'params' : '&'.join(querystring)
            }
            for index, value in enumerate(config['path']['view']):
                tpl = View.get(value)
                tpl_rendered = tpl.render(data)
                msg.attach(MIMEText(tpl_rendered, 'plain' if index == 0 else 'html'))

            server.sendmail(config['expediteur'], row['email'], msg.as_string().encode('utf-8'))

            ouputLog = "{c} {f} {l} ({e}) envoyé !"
            export_output_log = ouputLog.format(c = row['civility'], f = row['firstname'], l = row['lastname'], e = row['email'])
            # print(export_output_log)
            logger.info(export_output_log)

        server.quit()
