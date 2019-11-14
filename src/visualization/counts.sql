SELECT state_name, COUNT(state_name) 
FROM puma_names_2010 
GROUP BY state_name 
ORDER BY state_name ASC
LIMIT 5;