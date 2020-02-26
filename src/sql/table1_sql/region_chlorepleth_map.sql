/*
    AUTHOR:     Akash Rama
    Date:       Nov 12, 2019
    NOTE:       This query obtains the numer of opportunity youth per region
*/

/*
SELECT puma, 
SUM(pums_2017.pwgtp) AS total_opportunity_youth_per_region 
FROM pums_2017
JOIN who11 ON CONCAT(serialno, sporder) = who11.unique_id
WHERE (puma BETWEEN '11610' AND '11614' OR puma BETWEEN '11604' AND '11605')
AND opportunity_youth = 'opportunity_youth'
AND agep BETWEEN '16' AND '24'
GROUP BY puma;
*/

SELECT puma, 
    SUM(pums_2017.pwgtp) AS total_opportunity_youth_per_region,
    ROUND(SELECT SUM(pwgtp) FROM pums_2017 WHERE opportunity_youth = 'opportunity_youth' AND agep BETWEEN '16' AND '24'/ 
    (SELECT SUM(pwgtp) FROM pums_2017 WHERE agep BETWEEN '16' AND '24', 0)) AS percent
FROM pums_2017
JOIN who11 ON CONCAT(serialno, sporder) = who11.unique_id
WHERE opportunity_youth = 'opportunity_youth'
AND agep BETWEEN '16' AND '24'
GROUP BY puma
HAVING (puma BETWEEN '11610' AND '11614' OR puma BETWEEN '11604' AND '11605');