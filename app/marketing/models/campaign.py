from datetime import datetime
from app import db
from slugify import slugify
from sqlalchemy.orm import relationship, backref


class Campaign(db.Model):
    __tablename__ = 'marketing_compaigns'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, unique=True)
    slug = db.Column(db.String, unique=True)
    created = db.Column(db.DateTime, default=datetime.now)
    updated = db.Column(db.DateTime, default=datetime.now, onupdate=datetime.now)

    diffusions_list = relationship('DiffusionList', backref=backref('campaigns_diffusion_lists'))
    email = relationship('Email', backref=backref('campaigns_email'))

    def __init__(self, *args, **kwargs):
        super(Campaign, self).__init__(*args, **kwargs)
        self.generate_slug()

    def __repr__(self):
        return '<%s id="%r" slug=%r>' % (__class__.__name__, self.id, self.slug)

    def generate_slug(self):
        self.slug = ''
        if self.name:
            self.slug = slugify(self.name)
