from flask import Blueprint
from app.core.libs.base_views import BaseView
from app.marketing.models import Campaign
from app.marketing.forms import CampaignForm


prefix_bp = 'campaigns'
bp = Blueprint(prefix_bp, __name__, url_prefix='/campagnes')


@bp.route('/index.html')
def index():
    fields = {
        'Nom' : 'name',
        'Slug': 'slug',
        'Création': 'created',
        'Mise à jour': 'updated'
    }
    return BaseView.index(Campaign, prefix_bp, fields, 'une campagne')

@bp.route('/ajouter.html', methods=['GET', 'POST'])
def add():
    return BaseView.add(CampaignForm, Campaign, prefix_bp)

@bp.route('/<int:id>-supprimer.html')
def destroy(id):
    return BaseView.destroy(id, Campaign, prefix_bp)

@bp.route('/<int:id>-<string:slug>-editer.html', methods=['GET', 'POST'])
def edit(id, slug):
    return BaseView.edit(id, slug, Campaign, CampaignForm, prefix_bp)
