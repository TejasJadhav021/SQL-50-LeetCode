WITH cte AS (
    SELECT lat, lon, COUNT(*) AS cnt
    FROM Insurance
    GROUP BY lat, lon
)
SELECT ROUND(SUM(i.tiv_2016) ,2) AS tiv_2016
FROM Insurance i
JOIN cte ON i.lat = cte.lat AND i.lon = cte.lon
WHERE cte.cnt = 1
AND i.tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) >= 2
);
