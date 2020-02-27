/*      
    Author:     Aaron Abrahamson, Yu Fen Lin, Akash Rama
    Date:       Nov 14, 2019
    Note:       This query finds the percenatage of jobs available for under 29 out of the total number of jobs. 
*/


SELECT puma5ce AS puma,
ROUND((SUM(ca01) * 100 / SUM(c000)), 2) AS percentage_for_under_29
FROM wa_jobs_2017
JOIN wa_geo_xwalk ON tabblk2010 = w_geocode
JOIN ct_puma_xwalk ON trct = CONCAT(statefp, countyfp, tractce)
GROUP BY puma5ce
HAVING puma5ce BETWEEN '11610' AND '11614' OR puma5ce BETWEEN '11604' AND '11605';

