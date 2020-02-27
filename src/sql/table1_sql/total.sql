/*
Author:     Aaron Abrahamson, Yu Fen Lin, Akash Rama
Date:       Nov 12, 2019
Note:       Total number of people in South King County
*/
 
SELECT SUM(pwgtp) AS total_people
FROM pums_2017
WHERE (puma BETWEEN '11610' AND '11614' OR puma BETWEEN '11604' AND '11605')
AND agep BETWEEN '16' AND '24';

