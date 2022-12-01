create database e_commerce;
use e_commerce;

create table supplier(SUPP_ID int primary key,
					  supp_name varchar(50) not null,
                      supp_city varchar(50),supp_phone varchar(50));

create table customer(CUS_ID	INT primary key,
                      CUS_NAME	VARCHAR(20) NOT NULL,
                      CUS_PHONE	VARCHAR(10) NOT NULL,
                     CUS_CITY	VARCHAR(30) NOT NULL,
                     CUS_GENDER	CHAR);
                     
  create table  category(CAT_ID	INT primary key,
                     CAT_NAME	VARCHAR(20) NOT NULL);
                     
create table product(PRO_ID	INT Primary key,
                     PRO_NAME	VARCHAR(20) NOT NULL DEFAULT "Dummy",
					 PRO_DESC	VARCHAR(60),cat_id int,
					 foreign key(cat_id) references category(cat_id));

create table supplier_pricing(PRICING_ID	INT Primary key,
                              PRO_ID	INT,
                              foreign key (pro_id) references product(pro_id),
                              SUPP_ID	INT,
                              foreign key(supp_id) references supplier(supp_id), 
                              SUPP_PRICE	INT DEFAULT 0);
     
	create table orders(ORD_ID	INT Primary key,
                       ORD_AMOUNT	INT NOT NULL,
                       ORD_DATE	DATE NOT NULL,
                       CUS_ID	INT,
                        foreign key(cus_id) references customer(cus_id),
                       PRICING_ID	INT,
					   foreign key(pricing_id) references supplier_pricing(pricing_id));

create table rating(RAT_ID	INT Primary key,
                    ORD_ID	INT,
                    foreign key(ord_id) references orders(ord_id),
                    RAT_RATSTARS	INT NOT NULL);
                    

INSERT INTO supplier values(1 ,"Rajesh Retails","Delhi", 1234567890);
insert into supplier values(2 ,"Appario Ltd.",	"Mumbai",2589631470);
insert into supplier values(3 ,"Knome products","Banglore",9785462315);
insert into supplier values(4 ,"Bansal Retails","Kochi",8975463285);
insert into supplier values(5 ,"Mittal Ltd.","Lucknow",7898456532);


insert into customer values(1,"AAKASH",9999999999,"DELHI","M");
insert into customer values(2,"AMAN",'9785463215',"NOIDA",'M');
insert into customer values(3,"NEHA",'9999999999',"MUMBAI",'F');
insert into customer values(4,"MEGHA",'9994562399',"KOLKATA",'F');
insert into customer values(5,"PULKIT",'7895999999',"LUCKNOW",'M');

INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");

INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);

INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);


INSERT INTO orders VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO orders VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO orders VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO orders VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO orders VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO orders VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO orders VALUES(107,789,"2021-09-01",3,7);
INSERT INTO orders VALUES(108,780,"2021-09-07",5,6);
INSERT INTO orders VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO orders VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO orders VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO orders VALUES(112,789,"2021-09-16",4,7);
INSERT INTO orders VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO orders VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO orders VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO orders VALUES(116,99,"2021-09-17",2,14);


INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);


/*Queries 

(3)	Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
*/

select count(cus_gender) as totalnoofcustomers, cus_gender from 
(select oc.cus_id, oc.cus_gender,oc.cus_name from
(select o.*, c.cus_name,c.cus_gender from orders o inner join customer c where o.cus_id = c.cus_id and 
o.ord_amount>=3000) as oc group by cus_id)
as occ group by cus_gender;



/*
(4)	Display all the orders along with product name ordered by a customer having Customer_Id=2
*/

select orders.*,product.pro_name from orders,supplier_pricing, product
where
orders.PRICING_ID = supplier_pricing.PRICING_ID and
supplier_pricing.pro_id = product.PRO_ID and
orders.CUS_ID=2;


/*
(5)	Display the Supplier details who can supply more than one product.
*/

select supplier.* from supplier where supplier.supp_id in
(select supp_id from supplier_pricing group by supp_id having count(supp_id)>1)
group by supplier.supp_id;



/*
6)	Find the least expensive product from each category and print the table with category id, name, product name and price of the product
*/

select psp.*,c.cat_name from category c inner join
(select p.pro_id, p.cat_id,p.pro_name, sp.minProductprice from product p inner join
(select pro_id, min(supp_price) as minProductprice from supplier_pricing group by PRO_ID)
as sp
where sp.pro_id = p.pro_id)
as psp
where psp.cat_id = c.cat_id;

	
/*
(7)	Display the Id and Name of the Product ordered after “2021-10-05”.
*/

select p.pro_name, p.pro_id from orders as o,supplier_pricing as sp,product as p 
where o.PRICING_ID = sp.PRICING_ID and
sp.pro_id = p.PRO_ID and
o.ORD_DATE > "2021-10-05";



/*
(8)	Display customer name and gender whose names start or end with character 'A'.
*/
select cus_name, cus_gender from customer where 
customer.cus_name like '%A%';


/*
(9)	Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.
*/






