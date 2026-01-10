import os

"""
Создайте пустую директорию mydir в текущей рабочей директории.
Затем перейдите в эту директорию и создайте в ней три пустых файла:
file1.txt, file2.txt и file3.txt. Наконец, выведите список файлов в
директории на экран.
"""


def directory_operations():
    # Создание директории
    os.makedirs('mydir', exist_ok=True)

    # Переход в директорию
    original_dir = os.getcwd()
    os.chdir('mydir')

    # Создание трёх пустых файлов
    files_to_create = ['file1.txt', 'file2.txt', 'file3.txt']
    for file_name in files_to_create:
        with open(file_name, 'w') as f:
            pass

    # Получение списка файлов в директории
    file_list = os.listdir()

    # Возвращение в исходную директорию
    os.chdir(original_dir)

    return file_list


if __name__ == '__main__':
    print(directory_operations())
