1

-----

Write a query that shows all the information about all the salespeople in
the database. Use a basic SELECT query.

-----


select * from salespeople;


==========
2

-----

Write a query that shows all the information about all salespeople from
the 'Northwest' region.

-----


select * from salespeople where region = 'Northwest';


==========
3

-----

Write a query that shows just the emails of the salespeople from the
'Southwest' region.

-----


select email from salespeople where region = 'Southwest';


==========
4

-----

Write a query that shows the first name, last name, and email of all
salespeople in the 'Northwest' region.

-----


select first_name, last_name, email from salespeople where region = 'Northwest';


==========
5

-----

Write a query that shows the common name of melons that cost more than
$5.00.

-----


select common_name from melons where price > 5.00;


==========
6

-----

Write a query that shows the common name and price for all
watermelons that cost more than $5.00.


-----


select common_name, price from melons where (price > 5.00 and melon_type = 'Watermelon');


==========
7

-----

Write a query that displays all common names of melons that start with
the letter 'C'.


-----


select common_name from melons where common_name like 'C%';


==========
8

-----

Write a query that shows the common name of any melon with 'Golden'
anywhere in the common name.


-----


select common_name from melons where common_name like '%Golden%';


==========
9

-----

Write a query that shows all the distinct regions that a salesperson can belong to.


-----


select distinct region from salespeople;


==========
10

-----

Write a query that shows the emails of all salespeople from both the
Northwest and Southwest regions.


-----


select email from salespeople where region = 'Northwest' or region = 'Southwest';


==========
11

-----

Write a query that shows the emails of all salespeople from both the
Northwest and Southwest regions, this time using an 'IN' clause.  


-----


select email from salespeople where region in ('Northwest','Southwest');


==========
12

-----

Write a query that shows the email, first name, and last name of all
salespeople in either the Northwest or Southwest regions whose last names start
with the letter 'M'.

-----


select email, first_name, last_name  from salespeople where (region = 'Northwest' or region = 'Southwest') AND (last_name LIKE 'M%');


==========
13

-----

Write a query that shows the melon type, common name, price, and the
price of the melon given in euros. The 'melons' table has prices in dollars,
and the dollar to euro conversion rate is 0.73.


-----


select melon_type, common_name, price,  (price * 0.73) as euro_price from melons;


==========
14

-----

Write a query that shows the total number of customers in our customer
table.

-----


select count(id) from customers;


==========
15

-----

Write a query that counts the number of orders (in the orders table) shipped to California.

-----


select count(id) from orders where shipto_state = 'CA';


==========
16

-----

Write a query that shows the total amount of money spent across all melon
orders.

-----


select sum(order_total) from orders;


==========
17

-----

Write a query that shows the average order cost.

-----


select avg(order_total) from orders;


==========
18

-----

Write a query that shows the order total that was lowest in price.

-----


select min(order_total) from orders; 


==========
19

-----

Write a query that fetches the id of the customer whose email is
'pclark74@gmail.com'.

-----


select id from customers where email = 'pclark74@gmail.com'; 


==========
20

-----

Write a query that shows the id, status and order_total for all orders 
made by customer 100.

-----


select id, status, order_total from orders where (customer_id=100);


==========
21

-----

Write a single query that shows the id, status, and order total for all
orders made by 'pclark74@gmail.com'. Use a subselect to do this.


-----


select id, status, order_total from orders where customer_id = (select id from customers where email = 'pclark74@gmail.com');


==========
22

-----

Write a query that shows the id, status, and order total for all orders
made by 'pclark74@gmail.com'. Use a join to do this.

-----


select orders.id, orders.status, order_total from orders join customers on (orders.customer_id=customers.id) where customers.email = 'pclark74@gmail.com'; 


==========
23

-----

Write a query that shows all columns in the order_items table for order #2725.

-----


select * from order_items where order_id = 2725;


==========
24

-----

Write a query that shows the common_name, melon_type, quantity,
unit_price and total_price for all the melons in order #2725.

-----


select melons.common_name, melons.melon_type, order_items.quantity, order_items.unit_price, order_items.total_price from order_items join melons on (order_items.melon_id=melons.id) WHERE order_items.order_id = 2725;


==========
25

-----

Write a query that shows the total amount of revenue that comes from
internet orders.

-----


SELECT SUM(order_total)  FROM orders where salesperson_id is NULL;


==========
26

-----

Challenge: Produce a list of all salespeople and the total amount of orders
they've sold, while calculating a 15% commission on all of their orders.
Include their first name, last name, the total of all their sales, and their
commission. Only report one row per salesperson. Include salespeople who have
not made any sales.

You will need 'left join' (http://sqlzoo.net/wiki/LEFT_JOIN) and 'group by'
(http://sqlzoo.net/wiki/SELECT_.._GROUP_BY) clauses to finish this one.

-----


select
salespeople.first_name, 
salespeople.last_name,
sum(orders.order_total),
(sum(orders.order_total)*.15) as commission
from salespeople
left join orders
on (salespeople.id = orders.salesperson_id)
group by salespeople.id
;