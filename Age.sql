/*    
    AUTHOR:     Akash Rama
    Date:       Nov 12, 2019
    Note:       Creates a table that groups each unique identifer by age range
                16 - 18, 19 - 21, 22 - 24, 25 - 99
*/

DROP TABLE age11;

CREATE TABLE age11 AS (
    SELECT CONCAT(serialno, sporder) AS unique_id,
        CASE
        WHEN agep BETWEEN '16' AND '18' THEN '16 - 18'
        WHEN agep BETWEEN '19' AND '21' THEN '19 - 21'
        WHEN agep BETWEEN '22' AND '24' THEN '22 - 24'
        ELSE '25 - 99'
        END AS age_group 
    FROM pums_2017
);

SELECT * FROM age11;
