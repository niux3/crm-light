from pathlib import Path
from slugify import slugify
from flask import Blueprint, render_template, request, redirect, url_for, flash
from app.marketing.models import Campaign, DiffusionList, Email
from app.marketing.forms import EmailImportForm
from app.core.config import config
from app import db


prefix_bp = "emails"
bp = Blueprint(prefix_bp, __name__, url_prefix='/emails')


@bp.route('/index.html')
def index():
    object_list = Campaign.query.all()
    print(object_list[1].email)
    ctx = {
        "object_list": object_list
    }
    return render_template('email/index.html', **ctx)

@bp.route('/<int:id>-importer.html', methods=['GET', 'POST'])
def add(id):
    instance = Campaign.query.get_or_404(id)
    form = EmailImportForm(obj=instance)
    if request.method == 'POST' and form.validate_on_submit():
        template_html_file = request.files['template_html']
        template_text_file = request.files['template_text']
        destination = f'{config.TEMPLATES_EMAIL}/{str(id)}'
        print(destination)
        print("NOT EXISTS >>>",id, not Path(destination).exists())
        if not Path(destination).exists():
            Path(destination).mkdir(parents=True)
        destination_html = f'{destination}/{slugify(template_html_file.filename)}'
        destination_text = f'{destination}/{slugify(template_text_file.filename)}'
        print(destination_text)
        template_html_file.save(destination_html)
        template_text_file.save(destination_text)
        email = Email(**{
            'template_html': destination_html,
            'template_text': destination_text,
            'campaign_id': id
        })
        db.session.add(email)
        db.session.commit()
        db.session.refresh(email)
        flash('enregistrement des templates avec succès', 'success')
        return redirect(url_for('emails.index'))
    ctx = {
        'form': form
    }
    return render_template('email/edit.html', **ctx)

@bp.route('/<int:id>-supprimer')
def destroy(id):
    return f"delete {id}"

@bp.route('/voir.html')
def show():
    return "show email"

@bp.route('/envoyer.html')
def send():
    return "send email"
