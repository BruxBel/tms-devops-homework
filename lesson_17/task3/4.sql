-- Проверяем, что тестовая таблица исчезла
SELECT table_name 
FROM information_schema.tables 
WHERE table_name = 'test_backup';

-- Проверяем данные в основных таблицах
SELECT * FROM Analysis LIMIT 5;
SELECT * FROM Orders WHERE ord_datetime >= '2020-02-05' LIMIT 5;

-- Проверяем количество записей
SELECT count(*) FROM Analysis;
SELECT count(*) FROM Orders;