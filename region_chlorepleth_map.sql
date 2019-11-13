/*  Creates a table of South Seattle/King County PUMAs and their OY Counts */

CREATE TABLE oy_puma AS (

    SELECT puma, SUM(pums_2017.pwgtp) AS total_per_region FROM pums_2017
    JOIN who11 ON CONCAT(serialno, sporder) = who11.unique_id
    WHERE puma BETWEEN '11610' AND '11614' OR puma BETWEEN '11604' AND '11605'
    AND opportunity_youth = 'opportunity_youth'
    GROUP BY puma
);