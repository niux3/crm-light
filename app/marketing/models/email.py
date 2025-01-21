from datetime import datetime
from app import db


class Email(db.Model):
    __tablename__ = 'marketing_emails'
    id = db.Column(db.Integer, primary_key=True)
    template_html = db.Column(db.String, nullable=True, default='')
    template_text = db.Column(db.String, nullable=True, default='')
    created = db.Column(db.DateTime, default=datetime.now)
    updated = db.Column(db.DateTime, default=datetime.now, onupdate=datetime.now)

    campaign_id = db.Column(db.Integer, db.ForeignKey('marketing_compaigns.id', onupdate='CASCADE', ondelete='CASCADE'))

    def __repr__(self):
        return '<%s id="%r" slug=%r>' % (__class__.__name__, self.id, self.slug)
