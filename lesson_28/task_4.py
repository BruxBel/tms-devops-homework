"""
Создайте класс "Книга", который имеет атрибуты название, автор и год
издания. Создайте методы для получения и изменения этих
атрибутов. Создайте несколько объектов этого класса и вызовите его
методы для каждого объекта.
"""

class Book:
    def __init__(self, title, author, year):
        self.title = title
        self.author = author
        self.year = year
    
    def get_title(self):
        return self.title
    
    def get_author(self):
        return self.author
    
    def get_year(self):
        return self.year
    
    def set_title(self, new_title):
        self.title = new_title
        print(f"Название изменено на: '{new_title}'")
    
    def set_author(self, new_author):
        self.author = new_author
        print(f"Автор изменен на: {new_author}")
    
    def set_year(self, new_year):
        self.year = new_year
        print(f"Год издания изменен на: {new_year}")
    
    def display_info(self):
        print(f"Книга: '{self.title}'")
        print(f"Автор: {self.author}")
        print(f"Год издания: {self.year}")

if __name__ == "__main__":
    book = Book("Война и мир", "Лев Толстой", 1869)
    
    book.display_info()
    
    print(f"Название: {book.get_title()}")
    print(f"Автор: {book.get_author()}")
    print(f"Год: {book.get_year()}")
    
    book.set_title("Война и мир. Том 1")
    book.set_year(1870)
    
    book.display_info()
    
    book.set_author("Л.Н. Толстой")
    print(f"\nТекущее название: {book.get_title()}")
