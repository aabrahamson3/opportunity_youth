SELECT SUBSTRING(w_geocode, 1, 7) AS puma, 
ROUND((SUM(ca01) * 100 / SUM(c000)), 2) AS percentage_for_under_29
--SUM(ca01) AS young_people_jobs, SUM(c000) AS total_jobs
FROM wa_jobs_2017
GROUP BY puma;