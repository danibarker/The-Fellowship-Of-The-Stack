SELECT SUM(sale_price * quantity) 
FROM sales_by_product 
WHERE product_id = 48 /*This will return total sales for product 48*/;

SELECT SUM(sale_price * quantity) 
FROM sales_by_product 
WHERE artist_id = 1 /*This will return total sales for artist 1*/;

SELECT SUM(sale_price * quantity) 
FROM sales_by_product 
WHERE artist_id = 1 AND EXTRACT(YEAR FROM DATE) = EXTRACT(YEAR FROM CURRENT_TIMESTAMP);
/*This will get sales from this year for artist 1*/
SELECT sum(sale_price), EXTRACT(day FROM DATE) AS DAY, EXTRACT(month FROM DATE) AS month, EXTRACT(year FROM DATE) AS YEAR
FROM sales_by_product
GROUP BY EXTRACT(day FROM DATE), EXTRACT(month FROM DATE), EXTRACT(year FROM DATE)
ORDER BY DAY desc;
/*This will get 

