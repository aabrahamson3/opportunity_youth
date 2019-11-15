/*  
    AUTHOR:     Akash Rama
    Date:       Nov 12, 2019
    NOTE:       This query joins who and age table to pums_2017 and gets total amount of people based
                on their age range and wheater or not they are an opportunity youth
*/

SELECT 
    SUM(pums_2017.pwgtp) AS estimated_people, 
    ROUND(SUM(pums_2017.pwgtp) / SUM(SUM(pums_2017.pwgtp)) OVER(PARTITION BY age_group) * 100, 0) AS percent,
    age_group,
    opportunity_youth 
FROM pums_2017 
JOIN who11 ON CONCAT(serialno, sporder) = who11.unique_id
JOIN age11 ON CONCAT(serialno, sporder) = age11.unique_id
WHERE puma BETWEEN '11610' AND '11614' OR puma BETWEEN '11604' AND '11605'
GROUP BY who11.opportunity_youth, age11.age_group
HAVING age_group IS NOT NULL;
