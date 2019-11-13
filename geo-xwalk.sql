SELECT wg.tabblk2010, wj.w_geocode
FROM wa_jobs_2017 wj
INNER JOIN wa_geo_xwalk wg ON wj.w_geocode = wg.tabblk2010
LIMIT 5;
