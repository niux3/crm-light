from datetime import datetime
from app import db
from slugify import slugify
from app.marketing.models import Campaign


class DiffusionList(db.Model):
    __tablename__ = 'marketing_diffusions_lists'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String)
    slug = db.Column(db.String)
    data = db.Column(db.String)
    created = db.Column(db.DateTime, default=datetime.now)
    updated = db.Column(db.DateTime, default=datetime.now, onupdate=datetime.now)

    campaign_id = db.Column(db.Integer, db.ForeignKey('marketing_compaigns.id', onupdate='CASCADE', ondelete='CASCADE'))

    def __init__(self, *args, **kwargs):
        super(DiffusionList, self).__init__(*args, **kwargs)
        self.generate_slug()

    def __repr__(self):
        return '<%s id="%r" slug=%r>' % (__class__.__name__, self.id, self.slug)

    def generate_slug(self):
        self.slug = ''
        if self.name:
            self.slug = slugify(self.name)

    @property
    def campaign(self):
        return Campaign.query.get(self.campaign_id).name
