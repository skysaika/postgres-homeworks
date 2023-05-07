-- Напишите запросы, которые выводят следующую информацию:
-- 1. "имя контакта" и "город" (contact_name, country) из таблицы customers (только эти две колонки)
SELECT ...

-- 2. идентификатор заказа и разницу между датами формирования (order_date) заказа и его отгрузкой (shipped_date) из таблицы orders


-- 3. все города без повторов, в которых зарегистрированы заказчики (customers)


-- 4. количество заказов (таблица orders)


-- 5. количество стран, в которые отгружался товар (таблица orders, колонка ship_country)

SELECT contact_name, city
FROM customers;

SELECT order_id, shipped_date - order_date
FROM orders;

SELECT DISTINCT city
FROM customers;

SELECT COUNT(*)
FROM orders;

SELECT COUNT(DISTINCT ship_country)
FROM orders
