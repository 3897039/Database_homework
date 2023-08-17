-- 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания

CREATE DATABASE IF NOT EXISTS Seminar3; -- создание БД
USE Seminar3; -- подключение к БД
DROP TABLE IF EXISTS staff; -- удаление таблицы если она была
CREATE TABLE staff -- создание таблицы
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	firstname VARCHAR(45) NOT NULL,
    lastname VARCHAR(45) NOT NULL,
    post VARCHAR(45) NOT NULL,
    seniority INT,
    salary DECIMAL(8,2),
    age INT
);

INSERT staff (firstname, lastname, post, seniority, salary, age) -- Заполняем таблицу 
VALUES ("Петр", "Петров", "Начальник", 8, 70000, 30); -- id = 1
INSERT staff (firstname, lastname, post, seniority, salary, age)
VALUES
  ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
  ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
  ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
  ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
  ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
  ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
  ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
  ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
  ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
  ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
  ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
  ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
  
SELECT * FROM staff;
  
SELECT 
	id,
    salary,
    CONCAT(firstname, " ", lastname) AS fullname  
FROM staff
ORDER BY salary DESC; -- по убыванию

SELECT 
	id,
    salary,
    CONCAT(firstname, " ", lastname) AS fullname  
FROM staff
ORDER BY salary; -- по возрастанию

-- 2. Выведите 5 максимальных заработных плат (saraly)

SELECT 
	id,
    salary,
    CONCAT(firstname, " ", lastname) AS fullname-- "Петр Петров" 
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)

SELECT
	post,
	SUM(salary)
FROM staff
GROUP BY post;

-- 4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.

SELECT
	post,
	COUNT(*) AS `count`
FROM staff
WHERE post = "Рабочий" AND age BETWEEN 24 AND 49
GROUP BY post;

-- 5. Найдите количество специальностей
SELECT
	post,
	COUNT(*) AS `count`
FROM staff
GROUP BY post;

-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет включительно

SELECT
	post
FROM staff
WHERE age < 30
GROUP BY post;




