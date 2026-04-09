-- 1. Revenue by sales channel
SELECT sales_channel, SUM(amount) AS revenue
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY sales_channel;

-- 2. Top 10 customers
SELECT uid, SUM(amount) AS total_spent
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY uid
ORDER BY total_spent DESC
LIMIT 10;

-- 3. Profit calculation
SELECT 
MONTH(cs.datetime) AS month,
SUM(cs.amount) AS revenue,
SUM(e.amount) AS expense,
SUM(cs.amount) - SUM(e.amount) AS profit
FROM clinic_sales cs
JOIN expenses e ON cs.cid = e.cid
GROUP BY MONTH(cs.datetime);