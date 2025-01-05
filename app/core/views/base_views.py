from flask import render_template, request, redirect, url_for
from slugify import slugify
from app import db


class BaseView:
    @staticmethod
    def index(obj, prefix_bp, fields, category="un item"):
        ctx = {action: f'{prefix_bp}.{action}' for action in ['add', 'edit', 'destroy']}
        ctx['object_list'] = obj.query.all()
        ctx['category'] = category
        ctx['fields'] = fields
        return render_template('companies/index.html', **ctx)

    @staticmethod
    def add(objForm, obj, prefix_bp):
        form = objForm()
        if form.validate_on_submit() and request.method == "POST":
            cleared_data = {k:v for k, v in form.data.items() if k != 'csrf_token'}
            instance = obj(**cleared_data)
            db.session.add(instance)
            db.session.commit()
            return redirect(url_for(f'{prefix_bp}.index'))
        ctx = {
            'form': form
        }
        return render_template('companies/edit.html', **ctx)

    @staticmethod
    def destroy(id, obj, prefix_bp):
        instance = obj.query.get_or_404(id)
        db.session.delete(instance)
        db.session.commit()
        return redirect(url_for(f'{prefix_bp}.index'))

    @staticmethod
    def edit(id, slug, obj, objForm, prefix_bp, to_slug=None):
        instance = obj.query.get_or_404(id)
        form = objForm(obj=instance)
        if form.validate_on_submit() and request.method == "POST":
            form.populate_obj(instance)
            slug_data = form.name.data
            if to_slug is not None:
                slug_data = to_slug(form)
            instance.slug = slugify(slug_data)
            db.session.add(instance)
            db.session.commit()
            return redirect(url_for(f'{prefix_bp}.index'))
        ctx = {
            'form': form
        }
        return render_template('companies/edit.html', **ctx)
