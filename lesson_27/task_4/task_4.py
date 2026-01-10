from jinja2 import Template

"""
Создайте шаблон template.html, который будет содержать HTML-код
для отображения списка пользователей. Шаблон должен использовать
цикл for для перебора элементов списка, и выводить имя и email
каждого пользователя. Затем создайте список пользователей в виде
списка словарей, передайте его в шаблон и отобразите результат на
экране.
"""


def jinja_render():
    try:
        with open('template.html', 'r', encoding='utf-8') as f:
            template_str = f.read()

        users = [
            {"name": "user 1", "email": "test1@example.com"},
            {"name": "user 2", "email": "test2@example.com"},
            {"name": "user 3", "email": "test3@example.com"}
        ]

        # Рендеринг
        template = Template(template_str)
        result = template.render(users=users)

        # Сохранение
        with open('output.html', 'w', encoding='utf-8') as f:
            f.write(result)

        return result

    except Exception as e:
        print(f"Ошибка: {e}")
        return None


if __name__ == "__main__":
    print(jinja_render())
