-- Lost revenue by country

SELECT card_country, ROUND(SUM(price), 2) AS lost_revenue
FROM payments.my_payments_prepared
WHERE is_failed
GROUP BY card_country
ORDER BY lost_revenue DESC;
