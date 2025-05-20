CREATE database assignment1;
use assignment1;

CREATE TABLE EMPLOYEES (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(50)
);

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
