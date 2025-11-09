-- Подключаемся к базе данных
psql -U postgres -d my_database

-- Добавляем новую таблицу
CREATE TABLE test_backup (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Добавляем тестовые данные
INSERT INTO test_backup (name) VALUES ('Test record before backup');

-- Проверяем изменения
SELECT * FROM test_backup;
