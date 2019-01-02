class Configuration:
    @staticmethod
    def get():
        return {
            'expediteur'     : 'dom@dom.com',
            'login'          : 'dom@dom.com',
            'password'       : 'xxx',
            'smtp'           : 'xxx',
            'port'           : 587,
            'subject'        : 'mes meilleurs voeux',
            'path'           : {
                'data'          : './data/recipients.json',
                'citations'     : './data/citations.json',
                'log'           : './log/activity.log',
                'view'          : [
                    './emailing/templates/index.md',
                    './emailing/templates/index.html'
                ]
            }
        }
