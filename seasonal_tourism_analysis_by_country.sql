/*
File: seasonal_tourism_analysis_by_country.sql
Description: Analysis of non-resident arrivals to Buenos Aires by season (2014-2024)
Table: argentina-tourism-trends.NonResidentsArrivalsBA.Non_Residents_Arrivals_by_Country_date
Author: Arianna Giachini
Created: August 2024
*/

-- Query to analyze seasonal tourism patterns by aggregating arrivals data into seasons
SELECT
   season,
   total_number_of_non_residents_per_year
FROM
   (
     SELECT
         CASE
             WHEN EXTRACT(MONTH FROM arrival) IN (12,1,2) THEN 'Summer'
             WHEN EXTRACT(MONTH FROM arrival) IN (3,4,5) THEN 'Fall'
             WHEN EXTRACT(MONTH FROM arrival) IN (6,7,8) THEN 'Winter'
             WHEN EXTRACT(MONTH FROM arrival) IN (9,10,11) THEN 'Spring'
             ELSE 'Unknown'
         END AS season,
         SUM(number_of_non_residents) AS total_number_of_non_residents_per_year
     FROM `argentina-tourism-trends.NonResidentsArrivalsBA.Non_Residents_Arrivals_by_Country_date `
 GROUP BY season) AS seasonal_trends
ORDER BY total_number_of_non_residents_per_year DESC;