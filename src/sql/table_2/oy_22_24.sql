/*
    Author:     Aaron Abrahamson, Yu Fen Lin, Akash Rama
    Date:       November 12, 2019
    Purpose:    Count the number of 2017 population in opportunity youth in South King County
                in defferent diploma
                age from 22 to 24                 
    Note:       
*/

SELECT age2224.diploma AS degree, 
        --ROUND((count(*) / SUM(COUNT(*)) OVER()) * 100, 0) AS ratio_row_22_24, -- number of row
        --COUNT(*) AS row_22_24,
        SUM(age2224.pwgtp) As popluation_22_24,
        --SUM(SUM(age2224.pwgtp)) OVER()  AS total,
        ROUND(SUM(age2224.pwgtp) / (SUM(SUM(age2224.pwgtp)) OVER()) * 100,0) As ratio_22_24
FROM(
    SELECT pwgtp,
        CASE 
            WHEN (schl BETWEEN '01' AND '15') THEN '0_No diploma'
            WHEN (schl BETWEEN '16' AND '17') THEN '1_HS or GED'
            WHEN (schl BETWEEN '18' AND '19') THEN '2_Some college'
            WHEN (schl BETWEEN '20' AND '24') THEN '3_Degree'
            ELSE '4_NA'
        END As diploma
    FROM pums_2017
    WHERE ((puma BETWEEN '11610' AND '11614') OR puma = '11604' OR puma = '11605') -- PUMA
    AND (agep BETWEEN 22 AND 24)
    AND sch = '1' -- No school enrollment
    AND (esr = '2' OR esr = '3' OR esr = '5' OR esr ='6') -- Not at work
    ) age2224
GROUP BY age2224.diploma
ORDER BY degree