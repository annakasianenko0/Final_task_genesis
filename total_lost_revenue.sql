-- Total lost revenue 

SELECT
  ROUND(SUM(price), 2) AS total_lost_revenue
FROM payments.my_payments_prepared
WHERE is_failed;
