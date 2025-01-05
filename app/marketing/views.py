from flask import Blueprint


bp = Blueprint('marketing', __name__, url_prefix='/marketing')


@bp.route('/')
def index():
    return 'ok'
