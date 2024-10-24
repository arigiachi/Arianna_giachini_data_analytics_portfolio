/*
File: avg_stay_by_non_resident_in_BA.sql
Description: Analysis of non-resident arrivals to Buenos Aires by season
Data source: argentina-tourism-trends.NonResidentsArrivalsBA.Non_Residents_Arrivals_by_Country_date
Author: Arianna Giachini
Date: August 2024
*/

-- Query to analyze seasonal tourism patterns
SELECT
   season,
   avg_number_of_nights_per_non_resident,
   country_of_residency
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
         AVG(average_stay_by_non_residents) AS avg_number_of_nights_per_non_resident, country_of_residency
     FROM `argentina-tourism-trends.NonResidentsArrivalsBA.Non_Residents_Arrivals_by_Country_date `
     GROUP BY country_of_residency, season) AS seasonal_trends
    
ORDER BY country_of_residency, avg_number_of_nights_per_non_resident DESC;


