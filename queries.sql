SELECT
  p.product_name,
  t.quantity,
  p.product_price,
  (t.quantity * p.product_price) AS total_price,
  e.employee_name,
  s.sale_number,
  sa.salary_amount
FROM TRANSACTIONS t
JOIN PRODUCTS p ON t.product_id = p.product_id
JOIN EMPLOYEES e ON t.employee_id = e.employee_id
JOIN SALES s ON t.sale_id = s.sale_id
JOIN SALARIES sa ON e.employee_id = sa.salary_id;



SELECT 
  e.employee_name,
  p.product_name,
  t.quantity
FROM TRANSACTIONS t
JOIN EMPLOYEES e ON t.employee_id = e.employee_id
JOIN PRODUCTS p ON t.product_id = p.product_id
WHERE t.quantity between 3 and 7;


SELECT product_id, 
COUNT(*) AS number
FROM TRANSACTIONS 
group by product_id
having number != 2;


SELECT * FROM PRODUCTS order by product_number;

SELECT * FROM PRODUCTS limit 3;


SELECT employee_name FROM EMPLOYEES 
union 
SELECT salary_amount FROM SALARIES;

with big_number_product as (
SELECT product_number FROM PRODUCTS
where product_number > 20
);
SELECT * FROM big_number_product;
