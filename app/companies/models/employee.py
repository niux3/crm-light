from app import db
from app.companies.models import Company
from app.companies.models.function import Function
from datetime import datetime
from slugify import slugify


class Employee(db.Model):
    __tablename__ = 'companies_employees'
    id = db.Column(db.Integer, primary_key=True)
    firstname = db.Column(db.String, nullable=True)
    lastname = db.Column(db.String)
    slug = db.Column(db.String, unique=True)
    email = db.Column(db.String, nullable=True)
    blacklist = db.Column(db.Boolean, default=False)
    date_blacklist = db.Column(db.DateTime, nullable=True)
    description_blacklist = db.Column(db.Text, nullable=True)
    website = db.Column(db.String, nullable=True)
    mobile = db.Column(db.String, nullable=True)
    phone = db.Column(db.String, nullable=True)
    description = db.Column(db.Text, nullable=True)
    created = db.Column(db.DateTime, default=datetime.now)
    updated = db.Column(db.DateTime, default=datetime.now, onupdate=datetime.now)
    
    company_id = db.Column(db.Integer, db.ForeignKey('companies_companies.id', onupdate='CASCADE', ondelete='CASCADE'))
    civility_id = db.Column(db.Integer, db.ForeignKey('companies_civilities.id', onupdate='CASCADE', ondelete='CASCADE'))
    function_id = db.Column(db.Integer, db.ForeignKey('companies_functions.id', onupdate='CASCADE', ondelete='CASCADE'))
    sector_activity_id = db.Column(db.Integer, db.ForeignKey('companies_sector_of_activities.id', onupdate='CASCADE', ondelete='CASCADE'))

    def __init__(self, *args, **kwargs):
        super(Employee, self).__init__(*args, **kwargs)
        self.generate_slug()

    def __repr__(self):
        return '<%s id="%r" slug=%r>' % (__class__.__name__, self.id, self.slug)

    @property
    def fullname(self):
        return f'{self.firstname} {self.lastname}' if self.firstname != '' else self.lastname

    @property
    def company(self):
        return Company.query.get(self.company_id).name

    @property
    def function(self):
        return Function.query.get(self.function_id).name

    def generate_slug(self):
        self.slug = ''
        if self.firstname and self.lastname:
            output = f'{self.firstname} {self.lastname}' if self.firstname != '' else self.lastname
            self.slug = slugify(output)
