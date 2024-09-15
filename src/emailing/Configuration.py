class Configuration:
    @staticmethod
    def get():
        return {
            'expediteur'     : 'renaudbourdeau@gmail.com',
            'login'          : 'renaudbourdeau@gmail.com',
            'password'       : 'PASSSSSWORD',
            'smtp'           : 'smtp.gmail.com',
            'port'           : 587,
            'subject'        : 'Développeur Frontend & Backend à la Recherche de Nouveaux Défis',
            'path'           : {
                'data'          : './data/export.json',
                'log'           : './log/activity.log',
                'view'          : [
                    './emailing/templates/index.md',
                    './emailing/templates/index.html'
                ]
            }
        }
