"""
Создайте класс "Автомобиль", который имеет атрибуты марка, модель,
цвет и год выпуска. Создайте методы для получения и изменения этих
атрибутов. Создайте несколько объектов этого класса и вызовите его
методы для каждого объекта.
"""

class Car:
    def __init__(self, brand, model, color, year):
        self.brand = brand
        self.model = model
        self.color = color
        self.year = year
    
    def get_brand(self):
        return self.brand
    
    def get_model(self):
        return self.model
    
    def get_color(self):
        return self.color
    
    def get_year(self):
        return self.year
    
    def set_brand(self, new_brand):
        self.brand = new_brand
        print(f"Марка изменена на: {new_brand}")
    
    def set_model(self, new_model):
        self.model = new_model
        print(f"Модель изменена на: {new_model}")
    
    def set_color(self, new_color):
        self.color = new_color
        print(f"Цвет изменен на: {new_color}")
    
    def set_year(self, new_year):
        self.year = new_year
        print(f"Год выпуска изменен на: {new_year}")
    
    def display_info(self):
        print(f"Автомобиль: {self.brand} {self.model}")
        print(f"Цвет: {self.color}")
        print(f"Год выпуска: {self.year}")


if __name__ == "__main__":
    car = Car("Toyota", "Camry", "черный", 2020)
    
    car.display_info()
    
    print(f"Марка: {car.get_brand()}")
    print(f"Модель: {car.get_model()}")
    print(f"Цвет: {car.get_color()}")
    print(f"Год: {car.get_year()}")
    print(f"Полная информация: {car.get_full_info()}")
    
    car.set_color("красный")
    car.set_model("Camry Hybrid")
    
    car.display_info()
    
    car.set_brand("Toyota Motor Corporation")
    car.set_year(2021)
    
    car.display_info()
