/*  
    AUTHOR:     Akash Rama
    Date:       Nov 12, 2019
    NOTE:       This query joins who and age table to pums_2017 and gets total amount of people based
                on wheater or not they are an opportunity you
*/
CREATE TABLE total_count AS (

SELECT 
    --COUNT(*) AS row_count,
    SUM(pums_2017.pwgtp) AS estimated_people, 
    ROUND(SUM(pums_2017.pwgtp) / SUM(SUM(pums_2017.pwgtp)) OVER() * 100, 0) AS percent,
    opportunity_youth 
FROM pums_2017 
JOIN who11 ON CONCAT(serialno, sporder) = who11.unique_id
WHERE (puma BETWEEN '11610' AND '11614' OR puma BETWEEN '11604' AND '11605')
AND agep BETWEEN '16' AND '24'
GROUP BY who11.opportunity_youth
);