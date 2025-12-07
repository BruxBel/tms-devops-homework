# Базовый образ Ubuntu 20.04
FROM ubuntu:20.04

# Для избежания интерактивных вопросов при установке
ENV DEBIAN_FRONTEND=noninteractive

# Установка зависимостей
RUN apt-get update && \
    apt-get install -y \
    nginx \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Копируем конфигурацию nginx
COPY nginx-config/nginx.conf /etc/nginx/nginx.conf

# Копируем статические файлы
RUN mkdir -p /app/static
COPY static/ /app/static/

# Открываем порт 8080
EXPOSE 8080

# Запускаем nginx
CMD ["nginx", "-g", "daemon off;"]
