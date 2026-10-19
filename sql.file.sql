CREATE TABLE energy_data (
date DATE,
building VARCHAR(20),
temperature_c DECIMAL(5,2),
occupancy INT,
energy_consumption_kwh DECIMAL(10,2),
solar_generation_kwh DECIMAL(10,2),
peak_hour_consumption_kwh DECIMAL(10,2),
day_type VARCHAR(20)
);


SELECT COUNT(*)
FROM energy_data;

SELECT * 
FROM energy_data
LIMIT 10;

SELECT COUNT(*) AS total_records
FROM energy_data;


SELECT 
MIN(date) AS start_date,
MAX(date) AS end_date
FROM energy_data;

SELECT 
SUM("energy_consumption_kwh")
AS total_energy_consumption
FROM energy_data;

SELECT 
ROUND(AVG("energy_consumption_kwh"),2) AS
average_energy_consumption
FROM energy_data;

SELECT
MIN("energy_consumption_kwh")
AS min_energy,
MAX("energy_consumption_kwh")
AS max_energy
FROM energy_data;

SELECT 
    day_type,
    ROUND(AVG(energy_Consumption_kwh), 2) AS average_energy
FROM energy_data
GROUP BY day_type
ORDER BY average_energy DESC;

SELECT * FROM energy_data LIMIT 1;

SELECT DISTINCT day_type
FROM energy_data;

SELECT 
    ROUND(SUM(solar_generation_kwh), 2) AS total_solar_generation
FROM energy_data;

SELECT 
    "building",
    ROUND(AVG(energy_consumption_kwh), 2) AS average_energy
FROM energy_data
GROUP BY "building"
ORDER BY average_energy DESC;

SELECT 
    ROUND(AVG(peak_hour_consumption_kwh), 2) AS average_peak_consumption
FROM energy_data;


SELECT 
    ROUND(
        (SUM(solar_generation_kwh) / SUM(energy_consumption_kwh)) * 100,
        2
    ) AS solar_contribution_percent
FROM energy_data;


SELECT 
    "building",
    ROUND(SUM(solar_generation_kwh), 2) AS total_solar_generation
FROM energy_data
GROUP BY "building"
ORDER BY total_solar_generation DESC;


SELECT 
    ROUND(temperature_c::numeric, 0) AS temperature,
    ROUND(AVG(energy_consumption_kwh), 2) AS average_energy
FROM energy_data
GROUP BY ROUND(temperature_c::numeric, 0)
ORDER BY temperature;


SELECT 
    "occupancy",
    ROUND(AVG(energy_consumption_kwh), 2) AS average_energy
FROM energy_data
GROUP BY "occupancy"
ORDER BY "occupancy";


SELECT 
    ROUND(AVG(energy_consumption_kwh), 2) AS average_total_consumption,
    ROUND(AVG(peak_hour_consumption_kwh), 2) AS average_peak_consumption
FROM energy_data;

SELECT 
    "date",
    "building",
    "energy_consumption_kwh",
    "temperature_c",
    "occupancy"
FROM energy_data
ORDER BY energy_consumption_kwh DESC
LIMIT 10;


SELECT 
    "building",
    ROUND(SUM(energy_consumption_kwh), 2) AS total_energy,
    ROUND(SUM(solar_generation_kwh), 2) AS total_solar,
    ROUND(
        (SUM(solar_generation_kwh) / SUM(energy_consumption_kwh)) * 100,
        2
    ) AS solar_contribution_percent
FROM energy_data
GROUP BY "building"
ORDER BY solar_contribution_percent DESC;


SELECT 
    "date",
    "building",
    "energy_consumption_kwh",
    "temperature_c",
    "occupancy"
FROM energy_data
WHERE "energy_consumption_kwh" >
      (SELECT AVG(energy_consumption_kwh) 
       FROM energy_data)
ORDER BY energy_consumption_kwh DESC; 