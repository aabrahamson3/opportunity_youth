SELECT pop,
       age_group,
       --COUNT(pop) AS number_records,
       SUM(pwgtp) AS est,
       SUM(SUM(pwgtp)) OVER(PARTITION BY age_group) AS total_records, 
      -- try removing partition by to test out how it works
       (SUM(pwgtp) / SUM(SUM(pwgtp)) OVER(PARTITION BY age_group)) * 100 AS percent_per_age
FROM (
    SELECT CONCAT(serialno, sporder) AS unique_id,
            pwgtp,
            sch,
            schl,
            esr,
            CASE WHEN ((esr = '3' OR esr = '6') AND (agep BETWEEN 16 AND 24) AND (sch = '1'))
                --    If someone meats above condition, assign to oy_yes in new column: pop (END AS pop)
                THEN 'oy_yes'
                WHEN (schl <= '15' AND (esr = '1' OR esr = '2') AND (agep BETWEEN 16 AND 24))
                THEN 'working w/o a diploma'
                ELSE 'oy_no'
                END AS pop,
            agep,
            CASE WHEN (agep BETWEEN 16 AND 18)
                THEN '16-18'
                WHEN (agep BETWEEN 19 AND 21)
                THEN '19-21'
                WHEN (agep BETWEEN 22 AND 24)
                THEN '22-24'
                ELSE NULL
                END AS age_group,
            pn.puma,
            pn.puma_name
    FROM pums_2017 p
    JOIN puma_names_2010 pn
        ON pn.puma = p.puma
    WHERE (pn.puma BETWEEN '11610' AND '11614' OR pn.puma BETWEEN '11604' AND '11605')
        AND (agep BETWEEN 16 AND 24)
) AS temp
GROUP BY pop, age_group;