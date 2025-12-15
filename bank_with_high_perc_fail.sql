-- Bank with high percentage fail

SELECT bank_name,
COUNT(*) AS total_transactions,
COUNTIF(is_failed) AS failed_transactions,
ROUND(COUNTIF(is_failed) / COUNT(*) * 100, 2) AS failed_rate_pct
FROM payments.my_payments_prepared
WHERE bank_name IS NOT NULL
GROUP BY bank_name
HAVING COUNT(*) >= 100
ORDER BY failed_rate_pct DESC;
