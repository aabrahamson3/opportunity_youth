/*
SELECT tabblk2010,
ROUND((SUM(ca01) * 100 / SUM(c000)), 2) AS percentage_for_under_29,
SUM(cns01),
SUM(cns02),
SUM(cns03),
SUM(cns04),
SUM(cns05),
SUM(cns06),
SUM(cns07),
SUM(cns08),
SUM(cns09),
SUM(cns10),
SUM(cns11),
SUM(cns12),
SUM(cns13),
SUM(cns14)
FROM wa_geo_xwalk wx
JOIN wa_jobs_2017 wj ON wx.tabblk2010 = wj.w_geocode
WHERE ctycsubname LIKE '%King%'
GROUP BY tabblk2010;
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
