## Assignment SQL
## 1.I am  working with an ecommerce database that has the following 4 tables:

## gold_members
(userid, signup_date)
Example:
('John','09-22-2017'), ('Mary','04-21-2017')

## users
(userid, signup_date)
Example:
('John','09-02-2014'), ('Michel','01-15-2015'), ('Mary','04-11-2014')

## sales
(userid, created_date, product_id)
Example:
('John','04-19-2017',2), ('Mary','12-18-2019',1), ...

## product
(product_id, product_name, price)
Example:
(1,'Mobile',980), (2,'Ipad',870), (3,'Laptop',330)

## Follwed by 20 query 

## 2. Create a table product_details with columns (sell_date, product) and get the number of distinct products sold each day, along with a comma-separated list of those products.

## sell_date: 
the date when a product was sold

## product:
 the product name

## 3. I have a table dept_tbl with these columns:

## id_deptname: 
department code and name (e.g., "1111-MATH")

## emp_name: 
employee name

## salary: 
employee salary

## 4. I have a table email_signup with:

## id: 
user ID

## email_id: 
user's email address

## signup_date: 
the date they signed up (can be NULL)

## goal 
Find how many users have a Gmail account (check if email_id ends with '@gmail.com', case-insensitive).

For Gmail users:

Find the latest and first signup date.

Find the difference in days between the two dates.

Replace null signup_date values with '1970-01-01'.

## 5. I have a table sales_data with:

product_id: ID of the product

sale_date: date of sale

quantity_sold: number of units sold

## What I have done:
Assign RANK by product_id based on latest sale_date

Find latest sale for each product_id

Compare each day's quantity with the previous day's using LAG()

Return the first and last quantity_sold for each product_id using FIRST_VALUE() and LAST_VALUE()