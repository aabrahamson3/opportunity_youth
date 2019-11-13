/*    
    AUTHOR:     Akash Rama
    Date:       Nov 12, 2019
    Note:       Create a table that flags wheater each unique person is and opportunity youth,
                working without diploma, or not an opportunity youth
*/
--DROP TABLE who11;

CREATE TABLE who11 AS (
    SELECT CONCAT(serialno, sporder) AS unique_id,
        CASE WHEN sch = '1' THEN
            CASE WHEN (esr = '2' OR esr = '3' OR esr = '5' OR esr = '6')
                THEN 'opportunity_youth'
            ELSE 'working_without_diploma' 
            END
        ELSE 'not_an_opportunity_youth'
        END AS opportunity_youth
    FROM pums_2017
);


SELECT * FROM who11;
