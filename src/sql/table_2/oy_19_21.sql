/*
    Author:     Aaron Abrahamson, Yu Fen Lin, Akash Rama
    Date:       November 12, 2019
    Purpose:    Count the number of 2017 population in opportunity youth in South King County
                in defferent diploma
                age from 19 to 21                 
    Note:       
*/

SELECT age1921.diploma AS degree, 
        --ROUND((count(*) / SUM(COUNT(*)) OVER()) * 100, 0) AS ratio_row_19_21, -- number of row
        --COUNT(*) AS row_19_21,
        SUM(age1921.pwgtp) As popluation_19_21,
        --SUM(SUM(age1921.pwgtp)) OVER()  AS total,
        ROUND(SUM(age1921.pwgtp) / (SUM(SUM(age1921.pwgtp)) OVER()) * 100,0) As ratio_19_21
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
    AND (agep BETWEEN 19 AND 21)
    AND sch = '1' -- No school enrollment
    AND (esr = '2' OR esr = '3' OR esr = '5' OR esr ='6') -- Not at work
    ) age1921
GROUP BY age1921.diploma
ORDER BY degree