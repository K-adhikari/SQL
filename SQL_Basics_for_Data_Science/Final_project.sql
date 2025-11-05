-- Question 1. Total milk production for 2023.

SELECT SUM(Value)
FROM milk_production
WHERE Year = 2023


-- Question 2. Which states had cheese produciton greater than 100 million in April 2023?
  
SELECT sl.State, SUM(cp.Value)
FROM state_lookup sl 
JOIN cheese_production cp 
ON sl.State_ANSI = cp.State_ANSI
WHERE cp.Year = 2023 AND cp.Period ='APR'
GROUP BY sl.State


-- Question 3. Total value of coffee production for 2011.
  
SELECT SUM(Value)
FROM coffee_production
WHERE Year = 2011


-- Question 4. Average Honey Production for 2022.
  
SELECT AVG(Value)
FROM honey_production
WHERE Year = 2022


-- Question 5. Generate list of state names with their ANSI codes.
  
SELECT State, State_ANSI
FROM state_lookup

  
-- Question 6. List all states with cheese production values from April 2023 and find the value for New Jersey.
  
SELECT sl.State, SUM(cp.Value)
FROM state_lookup sl 
JOIN cheese_production cp 
ON sl.State_ANSI = cp.State_ANSI
WHERE cp.Year = 2023 AND cp.Period ='APR'
GROUP BY sl.State

  
-- Question 7. Find total yogurt production for states in year 2022 which also have cheese production data from 2023.
  
SELECT sum(yp.Value)
FROM yogurt_production yp 
WHERE yp.Year = 2022 AND yp.State_ANSI IN (SELECT DISTINCT cp.State_ANSI FROM cheese_production cp WHERE cp.Year = 2023)


-- Question 8. List all states from state_lookup that are missing from milk_production in 2023.

select sl.State, SUM(mp.Value)
from state_lookup sl 
left join milk_production mp 
on sl.State_ANSI = mp.State_ANSI
where mp.Year = 2023
group by sl.State


-- Question 9. List all states with their cheese production values for April 2023 and check if Delaware is on the list.

select sl.State, SUM(cp.Value)
from state_lookup sl 
join cheese_production cp 
on sl.State_ANSI = cp.State_ANSI
where cp.Year = 2023 and cp.Period ='APR'
group by sl.State

  
-- Question 10. Find average coffee production for all years where the honey production exceeded 1 million.
  
--Method 1
SELECT AVG(Value)
FROM coffee_production
WHERE Year IN (SELECT Year FROM honey_production WHERE Value > 1000000)


--Method2
SELECT AVG (Value)
FROM coffee_production
WHERE Year IN (SELECT Year
FROM honey_production hp 
GROUP BY Year
HAVING SUM(Value) > 1000000)
