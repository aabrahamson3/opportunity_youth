/*  
    AUTHOR:     Akash Rama
    Date:       Nov 12, 2019
    NOTE:       This query joins who and age table to pums_2017 and gets total amount of people based
                on their age range and wheater or not they are an opportunity youth
*/


SELECT 
    --COUNT(*) AS row_count,
    SUM(pums_2017.pwgtp) AS estimated_people, 
    ROUND(SUM(pums_2017.pwgtp) / SUM(SUM(pums_2017.pwgtp)) OVER(PARTITION BY age_group) * 100, 0) AS percent,
    age_group,
    opportunity_youth 
FROM pums_2017 
JOIN who11 ON CONCAT(serialno, sporder) = who11.unique_id
JOIN age11 ON CONCAT(serialno, sporder) = age11.unique_id
WHERE puma BETWEEN '11610' AND '11614' OR puma BETWEEN '11604' AND '11605'
--AND pums_2017.agep BETWEEN 16 AND 14
--AND age_group = '16 - 18' OR age_group = '19 - 21' OR age_group = '22 - 24'
GROUP BY who11.opportunity_youth, age11.age_group
HAVING age_group IS NOT NULL;

/*
SELECT 
    SUM(pwgtp) AS estimated_people, 
    ROUND(SUM(pwgtp) / SUM(SUM(pwgtp)) OVER(PARTITION BY (    CASE
    WHEN agep BETWEEN '16' AND '18' THEN '16 - 18'
    WHEN agep BETWEEN '19' AND '21' THEN '19 - 21'
    WHEN agep BETWEEN '22' AND '24' THEN '22 - 24'
    ELSE NULL
    END)) * 100, 0) AS percent,
    CASE
    WHEN agep BETWEEN '16' AND '18' THEN '16 - 18'
    WHEN agep BETWEEN '19' AND '21' THEN '19 - 21'
    WHEN agep BETWEEN '22' AND '24' THEN '22 - 24'
    ELSE NULL
    END AS age_range,
    CASE WHEN sch = '1' THEN
        CASE WHEN (esr = '2' OR esr = '3' OR esr = '5' OR esr = '6')
            THEN 'opportunity_youth'
        ELSE 'working_without_diploma' 
        END
    ELSE 'not_an_opportunity_youth'
    END AS opportunity_youth 
FROM pums_2017 
WHERE puma BETWEEN '11610' AND '11614' OR puma BETWEEN '11604' AND '11605'
GROUP BY opportunity_youth, age_range
HAVING (CASE
    WHEN agep BETWEEN '16' AND '18' THEN '16 - 18'
    WHEN agep BETWEEN '19' AND '21' THEN '19 - 21'
    WHEN agep BETWEEN '22' AND '24' THEN '22 - 24'
    ELSE NULL
    END) IS NOT NULL;
    */

/*SELECT 
    SUM(pwgtp) AS estimated_people, 
    ROUND(SUM(pwgtp) / SUM(SUM(pwgtp)) OVER(PARTITION BY (CASE
    WHEN agep BETWEEN '16' AND '18' THEN '16 - 18'
    WHEN agep BETWEEN '19' AND '21' THEN '19 - 21'
    WHEN agep BETWEEN '22' AND '24' THEN '22 - 24'
    ELSE NULL
    END)) * 100, 0) AS percent,
    CASE
    WHEN agep BETWEEN '16' AND '18' THEN '16 - 18'
    WHEN agep BETWEEN '19' AND '21' THEN '19 - 21'
    WHEN agep BETWEEN '22' AND '24' THEN '22 - 24'
    ELSE NULL
    END AS age_range,
    CASE WHEN sch = '1' THEN
        CASE WHEN (esr = '2' OR esr = '3' OR esr = '5' OR esr = '6')
            THEN 'opportunity_youth'
        ELSE 'working_without_diploma' 
        END
    ELSE 'not_an_opportunity_youth'
    END AS opportunity_youth 
FROM pums_2017 
WHERE puma BETWEEN '11610' AND '11614' OR puma BETWEEN '11604' AND '11605'
GROUP BY age_range, opportunity_youth
HAVING (CASE
    WHEN agep BETWEEN '16' AND '18' THEN '16 - 18'
    WHEN agep BETWEEN '19' AND '21' THEN '19 - 21'
    WHEN agep BETWEEN '22' AND '24' THEN '22 - 24'
    ELSE NULL
    END) IS NOT NULL;*/