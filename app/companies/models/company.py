from datetime import datetime
from sqlalchemy.orm import relationship, backref
from app import db
from slugify import slugify


class Company(db.Model):
    __tablename__ = 'companies_companies'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, unique=True)
    enseigne = db.Column(db.String, nullable=True)
    slug = db.Column(db.String, unique=True)
    email = db.Column(db.String, nullable=True)
    blacklist = db.Column(db.Boolean, default=False)
    date_blacklist = db.Column(db.DateTime, nullable=True)
    description_blacklist = db.Column(db.Text, nullable=True)
    website = db.Column(db.String, nullable=True)
    created_date = db.Column(db.DateTime, nullable=True)
    phone = db.Column(db.String, nullable=True)
    fax = db.Column(db.String, nullable=True)
    len_employees = db.Column(db.Integer, default=1)
    siren = db.Column(db.String, nullable=True)
    siret = db.Column(db.String, nullable=True)
    description = db.Column(db.Text, nullable=True)
    capital = db.Column(db.Integer, nullable=True)
    ca_year = db.Column(db.Integer, nullable=True)
    naf = db.Column(db.String, nullable=True)
    address = db.Column(db.Text, nullable=True)
    created = db.Column(db.DateTime, default=datetime.now)
    updated = db.Column(db.DateTime, default=datetime.now, onupdate=datetime.now)

    employees = relationship('Employee', backref=backref('companies'))

    def __init__(self, *args, **kwargs):
        super(Company, self).__init__(*args, **kwargs)
        self.generate_slug()

    def __repr__(self):
        return '<%s id="%r" slug=%r>' % (__class__.__name__, self.id, self.slug)

    def generate_slug(self):
        self.slug = ''
        if self.name:
            self.slug = slugify(self.name)
