WITH cte AS (
    SELECT 
        delivery_id,
        customer_id,
        order_date,
        customer_pref_delivery_date,
        RANK() OVER (PARTITION BY customer_id ORDER BY order_date) AS sales_rank
    FROM delivery
    
)
SELECT 
    
    ROUND(
        COUNT(*) / (SELECT COUNT(DISTINCT customer_id) FROM delivery) * 100,
        2
    ) AS immediate_percentage
FROM cte
WHERE sales_rank = 1 
  AND order_date = customer_pref_delivery_date;
