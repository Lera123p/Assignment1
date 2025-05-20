# Assignment 1
Опис практичного завдання номер 1 з ВБД

1.Почнемо з кроку створення необхідних таблиць:
CREATE database assignment1;
use assignment1;
//створюю базу даних, з якою працюватиму//

CREATE TABLE EMPLOYEES (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(50)
);
//створюю першу таблицю з працівниками (вирішила створити 5 різних таблиць, яка виводитиме дані про працівника, продукт в його компанії, продажі, зарплату робітника та проведені транзакції відповідно до продажів//


CREATE TABLE PRODUCTS (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100),
  product_number INT,
  product_price DECIMAL(10,2)
);

CREATE TABLE SALES (
  sale_id INT PRIMARY KEY,
  sale_number INT
);

CREATE TABLE SALARIES (
  salary_id INT PRIMARY KEY,
  salary_amount DECIMAL(10,2)
);

CREATE TABLE TRANSACTIONS (
  transaction_id INT PRIMARY KEY,
  employee_id INT,
  product_id INT,
  sale_id INT,
  quantity INT,
  FOREIGN KEY (employee_id) REFERENCES EMPLOYEES(employee_id),
  FOREIGN KEY (product_id) REFERENCES PRODUCTS(product_id),
  FOREIGN KEY (sale_id) REFERENCES SALES(sale_id)
);
//FOREIGN KEY створює зв'язок між таблицями (через employee_id посилаюсь на таблицю EMPLOYEES, через product_id на PRODUCTS, через sale_id на SALES)//


2.Далі крок з вставкою даних в створені таблиці (дані були написані мною, видумані кейси)
INSERT INTO EMPLOYEES VALUES
(1, 'Valeriia'),
(2, 'Alice'),
(3, 'Lina'),
(4, 'Nina'),
(5, 'Oleksandr');

INSERT INTO PRODUCTS VALUES
(1, 'Laptop', 25, 40000.00),
(2, 'Smartphone', 40, 20000.00),
(3, 'Tablet', 15, 17000.00),
(4, 'Earphones', 35, 3000.00),
(5, 'Keyboard', 20, 8000.00);


INSERT INTO SALES VALUES
(6, 15),
(7, 30),
(8, 10),
(9, 22),
(10, 12);

INSERT INTO SALARIES VALUES
(1, 30000.00),
(2, 20000.00),
(3, 10000.00),
(4, 35000.00),
(5, 40000.00);


INSERT INTO TRANSACTIONS (transaction_id, employee_id, product_id, sale_id, quantity) VALUES
(1, 1, 1, 1, 3),
(2, 2, 2, 2, 5),
(3, 3, 3, 3, 7),
(4, 4, 4, 4, 10),
(5, 5, 5, 5, 13);

3.Написання запитів (WHERE, GROUP BY, HAVING, ORDER BY, LIMIT)

SELECT 
  e.employee_name,
  p.product_name,
  t.quantity
FROM TRANSACTIONS t
JOIN EMPLOYEES e ON t.employee_id = e.employee_id
JOIN PRODUCTS p ON t.product_id = p.product_id
WHERE t.quantity between 3 and 7;
//прописала запит WHERE такий, щоб виводились колонки з ім'ям працівника, назвою товару та відповідною кількістю цих товарів ![image](https://github.com/user-attachments/assets/3a606f61-7750-40d4-8dfd-b8898988830c)


SELECT product_id, 
COUNT(*) AS number
FROM TRANSACTIONS 
group by product_id
having number != 2;
//прописала запит HAVING, щоб виводились дані скільки разів повторювався продукт з тим чи іншим айдішніком ( в мене нема повторів у таблиці, тому виводиться ![image](https://github.com/user-attachments/assets/96f32111-ae86-4fdd-ba5a-761c96643443) )



SELECT * FROM PRODUCTS order by product_number;
//даний запит сортує кількість товару від найменшого до найбільшого//

SELECT * FROM PRODUCTS limit 3;
//даним запитом я обмежила вивід інформації, так що виводяться товари з таблиці PRODUCTS лише з першими 3 айдішніками//

SELECT employee_name FROM EMPLOYEES 
union 
SELECT salary_amount FROM SALARIES;
//в мене не було ідей, як поєднати дані коректно через union, тому з точки зору сенсу виходить не дуже; поєдную ім'я працівника та його з/п//

with big_number_product as (
SELECT product_number FROM PRODUCTS
where product_number > 20
)
SELECT * FROM big_number_product;
//через common table expressions всередині WITH прописую запит, який витягує всі product_number > 20//
