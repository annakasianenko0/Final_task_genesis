-- Card brand with high percentage fail

SELECT card_brand,
COUNT(*) AS total_transactions,
COUNTIF(is_failed) AS failed_transactions,
ROUND(COUNTIF(is_failed) / COUNT(*) * 100, 2) AS failed_rate_pct
FROM payments.my_payments_prepared
WHERE card_brand IS NOT NULL
GROUP BY card_brand
HAVING COUNT(*) >= 100
ORDER BY failed_rate_pct DESC;
