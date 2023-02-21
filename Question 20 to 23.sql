-- Question 20

-- Find all low-priority orders made in the month of April. Out of them, how many were made in
-- the first half of the month?

with April_Orders as (
			select Ord_id, Order_Date, Order_Priority
            from orders_dimen
            where  MonthName(Order_Date) = 'April' and day(Order_Date) <= 15 and Order_Priority = 'LOW')

select Order_Priority, Count(Order_Priority) as Total_Orders
from April_Orders;

-- Question 21

-- Rank the orders made by Aaron Smayling in the decreasing order of the resulting sales.

select m.Cust_id, c.Customer_Name, m.Ord_id, m.Sales, rank() over(order by Sales desc) Rank_
from market_fact_full m
join cust_dimen c
on m.Cust_id = c.Cust_id
where c.Customer_Name = 'Aaron Smayling';

-- Question 22

-- For the above customer, rank the orders in the increasing order of the discounts provided.
-- Also display the dense ranks.

select m.Cust_id, c.Customer_Name, m.Ord_id, m.Sales, m.Discount, rank() over(order by Discount) Rank_,
dense_rank() over(order by Discount) Dense_Rank_
from market_fact_full m
join cust_dimen c
on m.Cust_id = c.Cust_id
where c.Customer_Name = 'Aaron Smayling';

-- Question 23

-- Rank the orders in the increasing order of the shipping costs for all orders placed by Aaron Smayling.
-- Also display the row number for each order.

select row_number() over(order by Shipping_Cost) Row_Number_, m.Cust_id, c.Customer_Name, m.Ord_id, m.Shipping_Cost,
rank() over(order by Shipping_Cost) Rank_
from market_fact_full m
join cust_dimen c
on m.Cust_id = c.Cust_id
where c.Customer_Name = 'Aaron Smayling';