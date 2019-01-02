class Configuration:
    @staticmethod
    def get():
        return {
            'expediteur'     : 'renaudbourdeau@gmail.com',
            'login'          : 'renaudbourdeau@gmail.com',
            'password'       : 'yoabyrbpterkfagt', # rot13
            'smtp'           : 'smtp.gmail.com',
            'port'           : 587,
            'subject'        : 'mes meilleurs voeux',
            'path'           : {
                'data'          : './data/recipients.json',
                'citations'     : './data/citations.json',
                'view'          : [
                    './emailing/templates/index.md',
                    './emailing/templates/index.html'
                ]
            }
        }
