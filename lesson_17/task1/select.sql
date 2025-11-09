SELECT DISTINCT a.an_name, a.an_price
FROM Analysis a
JOIN Orders o ON a.an_id = o.ord_an
WHERE o.ord_datetime BETWEEN '2020-02-05 00:00:00' AND '2020-02-12 23:59:59'
ORDER BY a.an_name;