"""
Создайте класс "Банковский счет", который имеет атрибуты номер
счета, имя владельца, баланс и методы пополнения и снятия денег со
счета. Создайте несколько объектов этого класса и вызовите его методы
для каждого объекта.
"""

class BankAccount:
    def __init__(self, account_number, owner_name, balance=0):
        self.account_number = account_number
        self.owner_name = owner_name
        self.balance = balance
    
    def deposit(self, amount):
        if amount > 0:
            self.balance += amount
            print(f"Пополнение: +{amount} руб. Новый баланс: {self.balance} руб.\n")
        else:
            print("Сумма пополнения должна быть положительной!\n")
        return self.balance
    
    def withdraw(self, amount):
        if amount > 0:
            if amount <= self.balance:
                self.balance -= amount
                print(f"Снятие: {amount} руб. Новый баланс: {self.balance} руб.\n")
            else:
                print("Недостаточно средств на счете!\n")
        else:
            print("Сумма снятия должна быть положительной!\n")
        return self.balance
    
    def display_info(self):
        print(f"Счет №{self.account_number}")
        print(f"Владелец: {self.owner_name}")
        print(f"Баланс: {self.balance} руб.\n")


if __name__ == "__main__":
    account1 = BankAccount("1234567890", "Иванов Иван", 1000)
    account1.deposit(500)
    account1.display_info()
    account1.withdraw(200)
    account1.display_info()
    account1.withdraw(2000)
