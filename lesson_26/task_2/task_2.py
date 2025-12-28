"""
Скрипт, который принимает на вход строку и выводит на экран количество букв в верхнем регистре, количество букв в нижнем регистре, количество цифр и количество символов пунктуации.
"""


if __name__ == "__main__":
    upper_count = 0
    lower_count = 0
    digit_count = 0
    punctuation_count = 0

    text = input("Enter the string: ")

    for char in text:
        if char.isupper():
            upper_count += 1
        elif char.islower():
            lower_count += 1
        elif char.isdigit():
            digit_count += 1
        else:
            char_code = ord(char)
            if (
                33 <= char_code <= 47 or 
                58 <= char_code <= 64 or 
                91 <= char_code <= 96 or 
                123 <= char_code <= 126 or 
                char_code in [8230, 171, 187, 8212, 8216, 8217, 8220, 8221]
            ):
                punctuation_count += 1

    print(f"{upper_count=}")
    print(f"{lower_count=}")
    print(f"{digit_count=}")
    print(f"{punctuation_count=}")
