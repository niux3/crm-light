from app.marketing.libs.filter_handler import FilterHandler


class EqualsHandler(FilterHandler):
    def handle(self, column, comparator, value):
        if comparator == "Est égal à":
            return column == value
        return super().handle(column, comparator, value)
