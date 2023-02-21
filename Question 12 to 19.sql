-- Question 12

-- Print the names of all customers who are either corporate or belong to Mumbai.

select * 
from cust_dimen
where  Customer_Segment = 'CORPORATE' or City = 'Mumbai';

-- Question 13

-- Find the total number of sales made ?

select sum(Sales)
from market_fact_full;

-- Question 14

-- What are the total numbers of customers from each city ?

select City, count(cust_id) as Total_Number_of_Customers
from cust_dimen
group by 1;

-- Question 15

-- List the customer names in alphabetical order.

select Customer_Name 
from cust_dimen
order by 1;

-- Question 16

-- Print the three most ordered products.

select p.Prod_id, p.Product_Category, p.Product_Sub_Category, p.Manu_Id, count(m.Ord_id) as Total_Order
from prod_dimen as p
join market_fact_full as m
on p.Prod_id = m.Prod_id 
group by 1
order by 5 desc
limit 3;

-- Question 17

-- Which month and year combination saw the most number of critical orders?

select concat(MonthName(Order_Date),'-',year(Order_Date)) as Month_Year_Combonation, count(Order_Priority = 'CRITICAL') as Citical_Orders
from orders_dimen
group by 1
order by 2 desc
limit 1;

-- Question 18

-- Find the most commonly used mode of shipment in 2011.

select Ship_Mode, count(Ship_Mode) as Number_of_Shipments
from shipping_dimen
where year(Ship_Date) = '2011'
group by 1
limit 1;

-- Question 19

-- Print the name of the most frequent customer.

select c.Customer_Name, count(m.Ord_id)
from market_fact_full as m
join cust_dimen as c
on m.Cust_id = c.Cust_id
group by 1
order by 2 desc
limit 1;