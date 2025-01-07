create database if not exists Cars; 
use Cars;

show tables;

# =================================== Basic =========================================
#1
select * from carsales;

#2
select make, model, saleprice from carsales;

#3
select * from carsales
where countryName = "United Kingdom";

#4
select * from carsales
where CountryName= "United Kingdom" and SalePrice > 90000;

#5
select * from carsales
where make in ("Rolls Royce", "Aston Martin");

#6
select * from carsales
order by saleprice desc;

#7
select distinct(make) from carsales;

#8
select * from carsales
where model like "Silver%";

#9
select * from carsales
where Region in ("East Midlands", "Greater London Authority");

#10
select * from carsales
where saleprice between 80000 and 100000;

#11
select * from carsales
where IsDealer is NULL;

#12
select * from carsales
where TotalDiscount is NOT NULL;

#13
select make, model, (SalePrice-CostPrice) as Profit
from carsales;

#14
select sum(saleprice) from carSales;

#15
select avg(saleprice) from carsales;

#16
select count(*), make from carsales
group by make;

#17
select make from carSales
group by make
having avg(saleprice) > 90000;

#18 - Not in syllabus

#19
select make, model, count(make) as Total_cars_sold from carsales
group by make; 

#20
select * from carsales
where saleprice > (select avg(saleprice) from carsales);


# ==================================== Intermediate =========================================

#1
select * from carsales
where saleprice > costprice;

#2
select * from carsales
where countryName = "United Kingdom" and saleprice > 80000;

#3
select * from carsales
where make = "Rolls Royce" or color = "Red";

#4
select * from carsales
order by countryName, saleprice desc;

#5
select distinct(color) from carsales;

#6
select * from carsales
where make like "%Royce%";

#7
select * from carsales
where make in ("Aston Martin", "Rolls Royce");

#8
select * from carsales
where invoicedate between '2012-01-01' and '2012-12-31';
 
 #9
 select * from carsales
 where IsDealer is NULL;

#10
select * from carsales
where totalDiscount is not null;

#11
select make, model, (saleprice + deliverycharge) as TotalCost from carsales;

#12
select model, make, saleprice from carsales
order by saleprice desc
limit 10;

#13
select * from carsales 
where model like "%Ghost";

#14
select * from carsales
where length(region) > 10;

#15
select * from carsales
where (saleprice - costprice) > 10000;

#16
select * from carsales
where countryName <> "United Kingdom";

#17
select make, model, (saleprice - costprice) as Profit from carsales;

#18
select * from carsales
where year(invoiceDate) = 2012;

#19
select * from carsales 
where countryName = "United Kingdom" and (salePrice > 80000 or color = "Red");

#20
select upper(make), upper(model) from carsales;

# ============================================ Advanced ========================================

 #1
 select * from carsales
 where saleprice > costprice and totalDiscount > 500 and color <> "Red";
 
 #2
 select * from carsales
 where (make="Rolls Royce" and saleprice > 90000) or (make="Aston Martin" and saleprice < 100000);
 
 #3
 select make, model, saleprice from carsales
 where Abs(saleprice-costprice) > 20000 and TotalDiscount <= 1000;
 
 #4
 select make, model, color from carsales
 where model like "Silver%" and color in (select upper(color) from carsales);
 
 #5
 select * from carsales
 where year(InvoiceDate) = "2012" and deliveryCharge between 500 and 1500;
 
 #6
 select * from carsales
 order by countryname desc, make desc, saleprice desc;
 
 #7
 select make, model, 
	case when saleprice > 100000 then 'high'
		when saleprice between 50000 and 100000 then 'medium'
		else 'low'
    end as PriceCategory
from carsales;
 
 #8
 select * from carsales
 where length(make) > 5 and color like '%Yellow%';
 
 #9
 select make, model, (saleprice - costprice - deliveryCharge) as NetProfit
 from carsales
 where SalePrice - CostPrice - DeliveryCharge > 0;
 
 #10
 select * from carsales
 where make <> "Rolls Royce" and saleprice not between 80000 and 100000;
 
 #11
 select * from carsales
 where IsDealer is null and (saleprice - TotalDiscount) > 85000;
 
 #12
 select make, model, round(saleprice/1000)*1000 as RoundedSalePrice from carsales;
 
 #13
 select make, concat(lower(model), '_model') as model from carsales;
 
 #14
 select * from carsales
 where invoiceNumber REGEXP '^[0-9][a-z]$';
 
 #15
select * from carsales
where saleprice > costprice and make in ("Aston Martin", "Rolls Royce") and color <> 'Blue';

#16
select * from carsales
where (saleprice < 100000 and deliverycharge < 100000) and countryName = 'United Kingdom';

#17
select make, model, saleprice,
	case when saleprice > 90000 then "Expensive"
		 when saleprice between  50000 and 90000 then "Affordable"
         else "Cheap"
	end as PriceCategory
from carsales;

#18
select * from carsales
where month(InvoiceDate) = 1 and Model like "%S%";

#19
SELECT make, saleprice 
FROM carsales
ORDER BY 
    CASE 
        WHEN make = 'Aston Martin' THEN saleprice
        ELSE NULL
    END DESC,
    CASE 
        WHEN make = 'Rolls Royce' THEN saleprice
        ELSE NULL
    END ASC,
    make;

#20
select make, model, (saleprice - COALESCE(totalDiscount, 0)) as DiscountedPrice from carsales
	