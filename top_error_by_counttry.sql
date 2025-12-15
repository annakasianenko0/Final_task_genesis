-- Top error by country

WITH ranked_errors AS (
SELECT card_country,error_type,
COUNT(*) AS error_count,
ROW_NUMBER() OVER (
PARTITION BY card_country
ORDER BY COUNT(*) DESC) AS rn
FROM payments.my_payments_prepared
WHERE is_failed
AND card_country IS NOT NULL
AND error_type IS NOT NULL
GROUP BY card_country, error_type
)
SELECT card_country,error_type AS most_common_error,error_count
FROM ranked_errors
WHERE rn = 1
ORDER BY error_count DESC;
