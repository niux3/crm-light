from flask import Blueprint


prefix_bp = "email"
bp = Blueprint(prefix_bp, __name__, url_prefix='/emails')


@bp.route('/index.html')
def index():
    return "home email"

@bp.route('/show.html')
def show():
    return "show email"

@bp.route('/send.html')
def send():
    return "send email"
