-- Создаем БД 
CREATE DATABASE IF NOT EXISTS seminar2;

-- Использование БД
USE seminar2;

-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
-- Создаем таблицу
DROP TABLE IF EXISTS sales;

CREATE TABLE sales
(
	`id` INT PRIMARY KEY AUTO_INCREMENT, 
    `order_date` DATE NOT NULL, 
    `count_product` INT NOT NULL
);

INSERT INTO sales (order_date, count_product)
VALUES
	('2022-01-01', 156),
    ('2022-01-02', 180),
    ('2022-01-03', 21),
    ('2022-01-04', 124),
    ('2022-01-05', 341);

-- Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT 
	count_product,
    IF (count_product < 100, 'Маленький заказ',
		IF (count_product <= 300, 'Средний заказ',
			IF (count_product > 300, 'Большой заказ', 'заказа нет')))
	AS 'Тип заказа'
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
-- -- Создаем таблицу
DROP TABLE IF EXISTS orders;

CREATE TABLE orders
(
	`id` INT PRIMARY KEY AUTO_INCREMENT, 
    `employee_id` VARCHAR(45) NOT NULL, 
    `amount` FLOAT NOT NULL,
    `order_status` VARCHAR(45) NOT NULL
);

INSERT INTO orders (employee_id, amount, order_status)
VALUES
	('e03', 15.00, 'OPEN'),
    ('e01', 25.50, 'OPEN'),
    ('e05', 100.70, 'CLOSED'),
    ('e02', 22.18, 'OPEN'),
    ('e04', 9.50, 'CANCELLED');
    
-- Выделяем полный статус заказа

SELECT 
	id AS id,
	employee_id AS employee_id, 
    amount AS amount, 
    order_status AS order_status,
CASE
	WHEN order_status = 'OPEN' 
		THEN 'Order is in open state'
	WHEN order_status = 'CLOSED' 
		THEN 'Order is closed'
	ELSE 'Order is cancelled' 
END AS 'full_order_status'
FROM orders;

