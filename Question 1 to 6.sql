-- Question 1

-- Need the full details of shipment so select Order ID, Ship ID, Shipping_Cost, Ship_date from the database ?

select s.Order_ID, s.Ship_id, m.Shipping_Cost, s.Ship_Date
from shipping_dimen as s
Join market_fact_full as m
on s.Ship_id = m.Ship_id;

-- Question 2

-- Provide the customer name, city, state and the order ID and order quantity they ordered ?

select c.Customer_Name, c.City, c.State, m.Ord_id, m.Order_Quantity
from cust_dimen as c
join market_fact_full as m
on c.Cust_id = m.Cust_id;

-- Question 3

-- Provide the product details like order Id, shipment ID whose shipment mode is Regular air ?

select Order_ID, Ship_id, Ship_Mode
from shipping_dimen
where Ship_Mode  ='REGULAR AIR';

-- Question 4

-- From order_dimen table order having order_priority as Critical and High change it to
-- immediate delivery and all other to normal delivery ?

select Ord_id, Order_Number, Order_Date, 
	Case
		when Order_Priority  = 'CRITICAL' then 'IMMEDIATE DELIVERY'
        when Order_Priority = 'HIGH' then 'IMMEDIATE DELIVERY'
        else 'NORMAL DELIVERY'
        end as Order_Priority
from orders_dimen;

-- Question 5

-- Provide all the details of customers which are from West Bengal ?

select *
from cust_dimen
where State = 'West Bengal';

-- Question 6

-- Provide the order details like odr_id, prod_id, ship_id, cust_id whose discount is more than
-- 0.05 and order_quantity is more than 10 ?

select Ord_id, Prod_id, Ship_id, Cust_id, Discount, Order_Quantity
from market_fact_full
where Discount > 0.05 and Order_Quantity > 10;