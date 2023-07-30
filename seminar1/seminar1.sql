-- Установка СУБД, подключение к БД, просмотр и создание таблиц
-- Основная часть:
-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными
CREATE DATABASE IF NOT EXISTS Seminar1; -- создание БД
USE Seminar1; -- подключение к БД
DROP TABLE IF EXISTS phone; -- удаление таблицы с телефонами если она была
CREATE TABLE phone -- создание таблицы
(
	-- имя_столбца тип_данных ограничения 
    id INT PRIMARY KEY AUTO_INCREMENT,
	ProductName VARCHAR(45),
    Manufacturer VARCHAR(45),
    ProductCount INT,
    Price INT
);
INSERT phone (ProductName, Manufacturer, ProductCount, Price) -- Заполняем таблицу phone, столбцы: (ProductName, Manufacturer, ProductCount, Price)
VALUES 
	("iPhone X", "Apple", "3", "76000"), -- id = 0
    ("iPhone 8", "Apple", "2", "51000"),  -- id = 1 
    ("Galaxy S9", "Samsung", "2", "56000"),  -- id = 2
    ("Galaxy S8", "Samsung", "1", "41000"),  -- id = 3 
    ("P20 Pro", "Huawei", "5", "36000");  -- id = 4 
     
SELECT *
FROM phone; -- вывод таблицыalter

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT *
FROM phone
WHERE ProductCount > 2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”

SELECT ProductName
FROM phone
WHERE Manufacturer = 'Samsung';

-- 4.1 Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000
SELECT *
FROM phone
WHERE Price*ProductCount BETWEEN 100000 AND 145000;

-- 4.2 Товары, в которых есть упоминание "Iphone" 
SELECT *
FROM phone
WHERE ProductName LIKE "iPhone%";

-- 4.3 Товары, в которых есть упоминание "Galaxy"
SELECT *
FROM phone
WHERE ProductName LIKE "Galaxy%";

-- 4.4 Товары, в которых есть ЦИФРЫ(REGEXP - регулярки, либо RLIKE) 
SELECT *
FROM phone
WHERE ProductName NOT LIKE "%[a-z]%";

-- 4.5 Товары, в которых есть ЦИФРА "8"
SELECT *
FROM phone
WHERE ProductName LIKE "%8%";



