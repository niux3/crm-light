from flask import render_template


def page_not_found(e):
    return render_template('404.html')


def internal_server_error(e):
    return render_template('500.html')

error_handler = {
    404: page_not_found,
    500: internal_server_error
}
