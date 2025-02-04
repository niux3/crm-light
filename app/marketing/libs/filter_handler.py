class FilterHandler:
    def __init__(self, next_handler=None):
        self.next_handler = next_handler

    def handle(self, column, comparator, value):
        if self.next_handler:
            return self.next_handler.handle(column, comparator, value)
        raise ValueError(f"Aucun gestionnaire pour le comparateur : {comparator}")
