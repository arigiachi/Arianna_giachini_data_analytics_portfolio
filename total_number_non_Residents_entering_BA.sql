/*
File: total_number_non_Residents_entering_BA.sql
Description: Total # of non-resident arrivals to Buenos Aires by country
Data source: argentina-tourism-trends.NonResidentsArrivalsBA.Non_Residents_Arrivals_by_Country_date
Author: Arianna Giachini
Date: August 2024
*/

-- Query to analyze seasonal tourism patterns


SELECT 
    country_of_residency, 
    SUM(number_of_non_residents) AS total_number_of_non_residents_per_year 
FROM `argentina-tourism-trends.NonResidentsArrivalsBA.Non_Residents_Arrivals_by_Country_date ` 
    GROUP BY country_of_residency ORDER BY total_number_of_non_residents_per_year DESC;
