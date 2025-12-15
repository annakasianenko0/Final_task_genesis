-- revenue 

SELECT
  ROUND(SUM(price), 2) AS successful_revenue
FROM payments.my_payments
WHERE transaction_status = 'success';
