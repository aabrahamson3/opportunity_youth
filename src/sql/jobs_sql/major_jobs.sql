/*      
    Author:     Aaron Abrahamson, Yu Fen Lin, Akash Rama
    Date:       Nov 14, 2019
    Note:       This query finds the percenatage of jobs available for under 29 and creates a table. 
*/


CREATE TABLE job_totals AS (

SELECT puma5ce AS puma,
ROUND((SUM(ca01) * 100 / SUM(c000)), 2) AS percentage_for_under_29,
SUM(cns01) AS Agriculture_Forestry_Fishing_Hunting,
SUM(cns02) AS Mining_Quarrying_Oil_Gas_Extraction,
SUM(cns03) AS Utilities,
SUM(cns04) AS Construction,
SUM(cns05) AS Manufacturing,
SUM(cns06) AS Wholesale_Trade,
SUM(cns07) AS Retail_Trade,
SUM(cns08) AS Transportation_Warehousing,
SUM(cns09) AS Information,
SUM(cns10) AS Finance_Insurance,
SUM(cns11) AS Real_Estate_Rental_Listing,
SUM(cns12) AS Professional_Scientific_Technical_Services,
SUM(cns13) AS Manage_of_Companies_Enterprise,
SUM(cns14) AS Administrative_Support_Waste_Management_Remediation_Services,
SUM(cns15) AS Educational_Services,
SUM(cns16) AS Health_Care_Social_Assistance,
SUM(cns17) AS Arts_Entertainment_Recreation,
SUM(cns18) AS Accomadation_Food_Services,
SUM(cns19) AS Other_Services,
SUM(cns20) AS Public_Administration
FROM wa_jobs_2017
JOIN wa_geo_xwalk ON tabblk2010 = w_geocode
JOIN ct_puma_xwalk ON trct = CONCAT(statefp, countyfp, tractce)
GROUP BY puma5ce
HAVING puma5ce BETWEEN '11610' AND '11614' OR puma5ce BETWEEN '11604' AND '11605'
);
