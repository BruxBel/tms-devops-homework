"""
Создайте класс "Круг", который имеет атрибуты радиус и цвет, и
методы вычисления площади и длины окружности. Создайте несколько
объектов этого класса и вызовите его методы для каждого объекта.
"""

import math


class Circle:
    def __init__(self, radius, color):
        self.radius = radius
        self.color = color

    def area(self):
        return math.pi * self.radius ** 2

    def circumference(self):
        return 2 * math.pi * self.radius


if __name__ == "__main__":
    red_circle = Circle(2, "red")
    print(f"{red_circle.area()=}")
    print(f"{red_circle.circumference()=}")
