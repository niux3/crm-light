from datetime import datetime
from app import db
from slugify import slugify


class Page(db.Model):
    __tablename__ = 'pages_pages'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String)
    slug = db.Column(db.String)
    body = db.Column(db.Text)
    is_online = db.Column(db.Boolean, default=True)
    created = db.Column(db.DateTime, default=datetime.now)
    updated = db.Column(db.DateTime, default=datetime.now, onupdate=datetime.now)

    def __init__(self, *args, **kwargs):
        super(Company, self).__init__(*args, **kwargs)
        self.generate_slug()

    def __repr__(self):
        return '<%s id="%r" slug=%r>' % (__class__.__name__, self.id, self.slug)

    def generate_slug(self):
        self.slug = ''
        if self.name:
            self.slug = slugify(self.name)
