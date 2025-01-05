from app import db
from datetime import datetime


class Campaign(db.Model):
    __tablename__ = 'marketing_compaigns'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String)
    slug = db.Column(db.String)
    created = db.Column(db.DateTime, default=datetime.now)
    updated = db.Column(db.DateTime, default=datetime.now, onupdate=datetime.now)

    def __init__(self, *args, **kwargs):
        super(Function, self).__init__(*args, **kwargs)
        self.generate_slug()

    def __repr__(self):
        return '<%s id="%r" slug=%r>' % (__class__.__name__, self.id, self.slug)

    def generate_slug(self):
        self.slug = ''
        if self.name:
            self.slug = slugify(self.name)
