-----------Q1 ANSWER--------------
SELECT FIRST_NAME FROM SALES.CUSTOMERS  ORDER BY  FIRST_NAME  DESC
-----------Q2 ANSWER--------------------
SELECT CITY,FIRST_NAME,LAST_NAME FROM SALES.CUSTOMERS 
-----------Q3 ANSWER--------------------
SELECT TOP(3) LIST_PRICE FROM PRODUCTION.PRODUCTS ORDER BY LIST_PRICE DESC

-----------Q4 ANSWER--------------------
SELECT PRODUCT_NAME FROM PRODUCTION.PRODUCTS WHERE LIST_PRICE>300 AND MODEL_YEAR=2018

-----------Q5 ANSWER--------------------
SELECT PRODUCT_NAME FROM PRODUCTION.PRODUCTS WHERE LIST_PRICE>3000 OR MODEL_YEAR=2018

-----------Q6 ANSWER--------------------

SELECT PRODUCT_NAME,LIST_PRICE FROM PRODUCTION.PRODUCTS WHERE LIST_PRICE BETWEEN 1899 AND 1999.99 

-----------Q7 ANSWER--------------------

SELECT PRODUCT_NAME,LIST_PRICE FROM PRODUCTION.PRODUCTS WHERE LIST_PRICE IN(299.99,466.99,489.99) 

-----------Q8 ANSWER--------------------

SELECT LAST_NAME FROM SALES.CUSTOMERS WHERE LAST_NAME LIKE '[ABC]%' ORDER BY LAST_NAME

-----------Q9 ANSWER--------------------

SELECT FIRST_NAME FROM SALES.CUSTOMERS WHERE FIRST_NAME NOT LIKE 'A%'

-----------Q10 ANSWER--------------------

SELECT STATE,CITY, COUNT(CUSTOMER_ID) AS 'NO_CUSTOMER' FROM SALES.CUSTOMERS GROUP BY STATE , CITY

-----------Q11 ANSWER--------------------

SELECT YEAR(ORDER_DATE) AS 'YEAR' ,COUNT(ORDER_ID) AS 'NO_ORDER' FROM SALES.ORDERS GROUP BY YEAR(ORDER_DATE) 

SELECT CUSTOMER_ID,YEAR(ORDER_DATE) AS 'YEAR', COUNT(ORDER_DATE) AS 'NO_ORDER' FROM SALES.ORDERS GROUP BY YEAR(ORDER_DATE),CUSTOMER_ID

-----------Q12 ANSWER--------------------
SELECT CATEGORY_ID, MAX(LIST_PRICE) AS 'MAX_LIST_PRICE', MIN(LIST_PRICE) AS 'MIN_LIST_PRICE' FROM PRODUCTION.PRODUCTS 
GROUP BY CATEGORY_ID HAVING(MAX(LIST_PRICE)>4000 OR MIN(LIST_PRICE)<500)
