CREATE DATABASE seminar4;
USE seminar4;

DROP TABLE IF EXISTS shops;
CREATE TABLE `shops` (
	`id` INT,
    `shopname` VARCHAR (100),
    PRIMARY KEY (id)
);

CREATE TABLE `cats` (
	`name` VARCHAR (100),
    `id` INT,
    PRIMARY KEY (id),
    shops_id INT,
    CONSTRAINT fk_cats_shops_id FOREIGN KEY (shops_id)
        REFERENCES `shops` (id)
);

INSERT INTO shops
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");

INSERT INTO cats
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);
        
-- 1. Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)

SELECT 
	s.shopname AS "Магазин", -- s = shops
    c.name AS "Имя котика" -- c = cats 
FROM shops s 
JOIN cats c  
ON s.id = c.shops_id;

-- 2. Вывести магазин, в котором продается кот “Мурзик”

SELECT 
	s.shopname AS "Магазин", -- s = shops
    c.name AS "Имя котика" -- c = cats 
FROM shops s 
JOIN cats c  -- INNER JOIN = JOIN (сокращенная)
ON s.id = c.shops_id
WHERE c.name = "Murzik";

-- 3. Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza”

SELECT 
	s.shopname AS "Магазин", -- s = shops
    c.name AS "Имя котика" -- c = cats 
FROM shops s 
JOIN cats c  -- INNER JOIN = JOIN (сокращенная)
ON s.id = c.shops_id
WHERE c.name != "Murzik" AND c.name != "Zuza";

