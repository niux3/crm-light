from datetime import datetime
from sqlalchemy.orm import relationship, backref
from app import db
from slugify import slugify


class Civility(db.Model):
    __tablename__ = 'companies_civilities'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String)
    slug = db.Column(db.String)
    created = db.Column(db.DateTime, default=datetime.now)
    updated = db.Column(db.DateTime, default=datetime.now, onupdate=datetime.now)

    employees = relationship('Employee', backref=backref('companies_civilities'))

    def __init__(self, *args, **kwargs):
        super(Civility, self).__init__(*args, **kwargs)
        self.generate_slug()

    def __repr__(self):
        return '<%s id="%r" slug=%r>' % (__class__.__name__, self.id, self.slug)

    def generate_slug(self):
        self.slug = ''
        if self.name:
            self.slug = slugify(self.name)
