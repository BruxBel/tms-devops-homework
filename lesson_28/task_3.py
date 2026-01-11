"""
Создайте класс "Студент", который имеет атрибуты имя, возраст и
средний балл. Создайте методы для вычисления среднего балла и
определения статуса студента (отличник, хорошист, троечник). Создайте
несколько объектов этого класса и вызовите его методы для каждого
объекта.
"""

class Student:
    def __init__(self, name, age, grades):
        self.name = name
        self.age = age
        self.grades = grades
    
    def calculate_average(self):
        if len(self.grades) == 0:
            return 0
        return sum(self.grades) / len(self.grades)
    
    def determine_status(self):
        avg = self.calculate_average()
        if avg >= 4.5:
            return "отличник"
        elif avg >= 3.5:
            return "хорошист"
        elif avg >= 2.5:
            return "троечник"
        else:
            return "неудовлетворительно"
    
    def display_info(self):
        avg = self.calculate_average()
        status = self.determine_status()
        print(f"Студент: {self.name}")
        print(f"Возраст: {self.age}")
        print(f"Оценки: {self.grades}")
        print(f"Средний балл: {avg}")
        print(f"Статус: {status}")

if __name__ == "__main__":
    student = Student("Алексей Алексеев", 20, [5, 5, 4, 5, 4, 5])
    
    student.display_info()
    
    print(f"Средний балл: {student.calculate_average()}")
    print(f"Статус студента: {student.determine_status()}")
    
    student.grades.append(0)
    student.display_info()
