/*
File: tourist_point_of_entry_analysis.sql
Description: Analysis of Non Resident's travel reasons to Buenos Aires (2014-July of 2024)
Table: argentina-tourism-trends.NonResidentsArrivalsBA.reasons_for_travelling_non_residents
Author: Arianna Giachini
Created: August 2024
Location: ~/Desktop/tourist_entry_analysis.sql
*/

-- Query to analyze tourist volumes by year, entry point, and travel reason
SELECT 
    EXTRACT(YEAR FROM arrival) as year,
    SUM(number_of_non_residents) as total_tourists,
    point_of_entry,
    motive_for_travelling 
FROM 
    `argentina-tourism-trends.NonResidentsArrivalsBA.reasons_for_travelling_non_residents` 
WHERE 
    point_of_entry IN ('Ezeiza_&_Aeroparque') 
GROUP BY 
    arrival,
    point_of_entry,
    motive_for_travelling 
ORDER BY 
    total_tourists;
