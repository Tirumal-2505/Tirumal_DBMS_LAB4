/*(9)	Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.
*/

select ORDERS.ORD_ID, ORDERS.PRICING_ID, rating.RAT_RATSTARS from ORDERS inner join rating where ORDERS.ORD_ID=rating.ORD_ID;
select ORDERS.PRICING_ID, avg(rating.RAT_RATSTARS) as rating, 

case 
when avg(rating.RAT_RATSTARS)=5 then 'Excellent Service'
when avg(rating.RAT_RATSTARS)>4 then 'Good Service'
when avg(rating.RAT_RATSTARS)>2 then 'Average Service'
else 'Poor Service' end as Type_of_Service from `order` 
inner join rating where `order`.ORD_ID=rating.ORD_ID group by `order`.PRICING_ID;


select Y.Final_ID, Y. Final_Supp_Name, Y.FinalAverage,

case 
when Y.FinalAverage=5 then 'Excellent Service'
when Y.FinalAverage>4 then 'Good Service'
when Y.FinalAverage>2 then 'Average Service'
else 'Poor Service' 
end 
as Type_of_Service 
 from 
(
SELECT S.SUPP_ID,supp_name, X.SUPPLIER_AVERAGE FROM supplier AS S INNER JOIN
(
SELECT ORD_RAT_SP.SUPPLIER_ID,AVG(ORD_RAT_SP.RATING_STARS) AS SUPPLIERAVERAGE FROM
(
select SP.SUPP_ID AS SUPPLIER_ID, ORD_RAT.ORD_ID, ORD_RAT.RAT_ID, ORD_RAT.RAT_STARS AS RATING_STARS from supplier_pricing as sp inner join
(
select O.ORD_ID, O.PRICING_ID, R.RAT_ID, R.RAT_RATSTARS from orders O inner join rating R  on
O.ORD_ID = R.ORD_ID
)as ORD_RAT
on ORD_RAT.pricing_id = sp.pricing_id
)
AS ORD_RAT_SP GROUP BY SUPP_ID
)X ON 
X.SUPPLIER_ID = S.SUPP_ID
) AS Y;