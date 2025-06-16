CREATE DATABASE ecommerce;
USE ecommerce;

Create Table gold_member_data
(User_Id Int Primary key, 
User_name varchar(100), singup_date Date)

INSERT INTO gold_member_data values 
(001, 'Aradhana', '2025-05-14'),
(002, 'Chandan', '2013-04-20'),
(003, 'Divkar', '2014-06-10'),
(004, 'Edwin', '2015-05-27'),
(005, 'Shreya', '2016-07-15'),
(006, 'Stewart', '2017-01-17')

Create Table users_data(User_Id Int Primary key, 
user_name varchar(100), singup_date Date)

INSERT INTO Users_data VALUES
(001, 'Aradhana', '2024-03-04'),
(002, 'chandan', '2018-04-20'),
(003, 'Divkar', '2016-06-10'),
(007, 'Edwin', '2018-05-01'),
(008, 'Shreya', '2019-03-25'),
(009, 'Stewart', '2020-08-13'),
(010, 'Krishna', '2021-09-23'),
(006, 'Radha', '2019-01-17')

create table sales_data(user_id INT,
USer_name varchar (100), created_date DATE,
product_id int)

Insert into sales_data values
(001, 'Aradhana',   '2024-03-10',1),
(001, 'Chandan',   '2024-03-15',2),
(002, 'Divkar',     '2019-04-20',1),
(003, 'Edwin',  '2019-06-10',1),
(007, 'Shreya',     '2019-05-01',1),
(008, 'Stewart',    '2019-12-25',3),
(009, 'Krishna',   '2021-08-13',1),
(010, 'Radha',     '2021-12-23',1),
(006, 'Prashan', '2020-05-17',1),
(004, 'Kabir',   '2015-07-27',2),
(005, 'Vikas',    '2017-07-15',2),
(004, 'Kabir',   '2015-09-27',3),
(005, 'Vikas',    '2016-12-15',3),
(002, 'Chandan',     '2018-04-20',1),
(003, 'Resh',  '2019-06-10',2),
(007, 'Mamatha',     '2020-05-01',2),
(008, 'Kalu',    '2021-03-25',2),
(009, 'Vidhya',   '2020-08-03',2),
(010, 'Manu',     '2022-09-23',2),
(006, 'Prashna', '2024-01-17',2)

CREATE TABLE Product_data (product_id int primary key,
product_name varchar(50),price int)


INSERT INTO Product_data values (1, 'mobile',20000),
(2,'laptop',45000),(3,'headset',2000)

#showing all the  table which as created

SELECT * from gold_member_data
SELECT * from users_data
SELECT * from sales_data
SELECT * from Product_data

#Count all the records of all four tables using single query
SELECT 'gold_member_data' as Table_name, count(*) as RecordCount
from  gold_member_data UNION ALL 
SELECT 'users_data' , count(*) as RecordCount
from  users_data UNION all 
SELECT 'Product_ID' , count(*) as RecordCount
from  Product_data UNION all 
SELECT 'Sales_data', count(*) as RecordCount
from  sales_data

#total amount each customer spent on ecommerce company


select u.USER_ID,u.USER_NAME, sum(price) as Total_amount from users_data u
left join sales_data s on u.User_Id= s. user_id
left join Product_data p on s.product_id = p.product_id
group by u.user_id, u.user_name order by Total_amount DESC;

#distinct dates of each customer visited the website
SELECT DISTINCT s.created_date AS Date, u.user_name AS CustomerName
FROM sales_data s
INNER JOIN Users_data u ON s.user_id = u.User_Id
ORDER BY Date, CustomerName;

# first product purchased by each customer 
SELECT u.user_name,min( p.product_name) as First_product
FROM users_data u
JOIN sales_data s ON u.User_Id = s.user_id
JOIN Product_data p ON s.product_id = p.product_id
GROUP BY u.user_name
ORDER BY MIN(s.created_date);

#most purchased item of each customer and how many times the customer has purchased it
SELECT s.user_id, u.user_name, p.product_name, COUNT(*) AS item_count
FROM sales_data s
JOIN users_data u ON s.user_id = u.user_id
JOIN Product_data p ON s.product_id = p.product_id
GROUP BY s.user_id, u.user_name, p.product_name
ORDER BY s.user_id, item_count DESC;

#customer who is not the gold_member_user
SELECT *
FROM users_data
WHERE user_id NOT IN (SELECT user_id FROM gold_member_data);

#amount spent by each customer when he was the gold_member user
SELECT u.user_name, SUM(p.price) AS total_spent
FROM gold_member_data g
JOIN sales_data s ON g.User_Id = s.user_id
JOIN Product_data p ON s.product_id = p.product_id
JOIN users_data u ON g.User_Id = u.User_Id
GROUP BY u.user_name;

#Customers names whose name starts with M
SELECT *
FROM users_data
WHERE user_name LIKE 'M%';

#Distinct customer Id of each customer

SELECT DISTINCT user_id, user_name
FROM Users_data;

#Change the Column name from product table as price_value from price
ALTER TABLE product_data RENAME COLUMN price TO price_value;
SELECT * FROM product_data;


#Change the Column value product_name – Ipad to Iphone from product table#
SET SQL_SAFE_UPDATES = 0;

UPDATE Product_data
SET product_name = 'Iphone'
WHERE product_name = 'mobile';

#Change the table name of gold_member_users to gold_membership_users
RENAME TABLE gold_member_data TO gold_membership_users;
SHOW TABLES;

#Create a new column as Status in the table create above gold_membership_users
ALTER TABLE gold_membership_users
ADD COLUMN Status VARCHAR(3);
UPDATE gold_membership_users
SET Status = 'Yes';
SELECT * FROM GOLD_MEMBERSHIP_USERS;

 #deleted user id 1
 START TRANSACTION;
DELETE FROM users_data WHERE User_Id = 1;
SELECT * FROM users_data;
DELETE FROM users_data WHERE User_Id = 2;
SELECT * FROM users_data;



ROLLBACK;
SELECT * FROM users_data;


#Insert one more record as same (3,'Laptop',330) as product table
INSERT INTO Product_data (product_id, product_name,price_value) VALUES (4, 'Laptop3', 330);
SELECT * FROM product_data;
#to find the duplicates in product table
SELECT product_id, product_name, price_value, COUNT(*) AS duplicate_count
FROM Product_data
GROUP BY product_id, product_name, price_value
HAVING COUNT(*) > 1;

