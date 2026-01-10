"""
Создайте файл test.txt и запишите в него строку "Это тестовый файл для
домашнего задания по программированию". Затем откройте этот файл в
режиме чтения, прочитайте его содержимое и выведите на экран.
"""


def file_operations():
    # Запись в файл
    with open('test.txt', 'w', encoding='utf-8') as f:
        f.write("Это тестовый файл для домашнего задания по программированию")

    # Чтение из файла
    with open('test.txt', 'r', encoding='utf-8') as f:
        content = f.read()

    return content


if __name__ == '__main__':
    print(file_operations())
