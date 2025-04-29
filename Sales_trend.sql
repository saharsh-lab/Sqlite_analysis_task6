-- FIXED: Sales Trend Analysis in SQLite with proper date conversion

SELECT 
    strftime('%Y', substr("Order Date", 7, 4) || '-' || substr("Order Date", 1, 2) || '-' || substr("Order Date", 4, 2)) AS year,
    strftime('%m', substr("Order Date", 7, 4) || '-' || substr("Order Date", 1, 2) || '-' || substr("Order Date", 4, 2)) AS month,
    SUM(Sales) AS monthly_revenue,
    COUNT(DISTINCT "Order ID") AS order_volume
FROM 
    sales_dataset
WHERE 
    strftime('%Y', substr("Order Date", 7, 4) || '-' || substr("Order Date", 1, 2) || '-' || substr("Order Date", 4, 2)) BETWEEN '2016' AND '2017'
GROUP BY 
    year || '-' || month
ORDER BY 
    year, month;
