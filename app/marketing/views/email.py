from pathlib import Path
from slugify import slugify
from flask import Blueprint, render_template, request
from app.marketing.models import Campaign, DiffusionList
from app.marketing.forms import EmailImportForm
from app.core.config import config


prefix_bp = "emails"
bp = Blueprint(prefix_bp, __name__, url_prefix='/emails')


@bp.route('/index.html')
def index():
    ctx = {
        "object_list": Campaign.query.all()
    }
    return render_template('email/index.html', **ctx)

@bp.route('/<int:id>-importer.html', methods=['GET', 'POST'])
def add(id):
    instance = Campaign.query.get_or_404(id)
    form = EmailImportForm(obj=instance)
    if request.method == 'POST' and form.validate_on_submit():
        template_html_file = request.files['template_html']
        template_text_file = request.files['template_text']
        destination = str(config.BASEDIR / 'static' / 'templates_email' / str(id))
        if not Path(destination).exists():
            Path(destination).mkdir(parents=True)
        destination_html = str(Path(config.BASEDIR / 'static' / 'templates_email' / str(id) / slugify(template_html_file.filename)))
        destination_text = str(Path(config.BASEDIR / 'static' / 'templates_email' / str(id) / slugify(template_text_file.filename)))
        template_html_file.save(destination_html)
        template_text_file.save(destination_text)
        return 'post'
    ctx = {
        'form': form
    }
    return render_template('email/edit.html', **ctx)

@bp.route('/voir.html')
def show():
    return "show email"

@bp.route('/envoyer.html')
def send():
    return "send email"
