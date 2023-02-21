-- Question 7

-- Create a table shipping_mode_dimen having columns with their respective data types as the following:
-- (i) Ship_Mode VARCHAR(25)
-- (ii) Vehicle_Company VARCHAR(25)
-- (iii) Toll_Required BOOLEAN

create table shipping_mode_dimen (
				Ship_Mode VARCHAR(25),
                Vehicle_Company VARCHAR(25),
                Toll_Required BOOLEAN
);

-- Question 8

-- Make 'Ship_Mode' as the primary key in the above table.

alter table shipping_mode_dimen
add primary key (Ship_Mode);

-- question 9

-- Insert two rows in the table created above having the row-wise values:
-- (i) ‘DELIVERY TRUCK', 'Ashok Leyland', false
-- (ii) 'REGULAR AIR', 'Air India', false

insert into shipping_mode_dimen
values ('DELIVERY TRUCK', 'Ashok Leyland', false),
		('REGULAR AIR', 'Air India', false); 

-- Question 10

-- Add another column named 'Vehicle_Number' and its data type to the created table.

alter table shipping_mode_dimen
add column (Vehicle_Number char(20));

-- Question 11

-- Update its value to 'MH-05-R1234'

update shipping_mode_dimen
set Vehicle_Number = 'MH-05-R1234'
where Ship_Mode = 'DELIVERY TRUCK';