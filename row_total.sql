SELECT 
    --COUNT(*) AS row_count,
    SUM(pums_2017.pwgtp) AS estimated_people, 
    ROUND(SUM(pums_2017.pwgtp) / SUM(SUM(pums_2017.pwgtp)) OVER() * 100, 0) AS percent,
    opportunity_youth 
FROM pums_2017 
JOIN who11 ON CONCAT(serialno, sporder) = who11.unique_id
JOIN age11 ON CONCAT(serialno, sporder) = age11.unique_id
WHERE puma BETWEEN '11610' AND '11614' OR puma BETWEEN '11604' AND '11605'
GROUP BY who11.opportunity_youth;