-- Question 1. Total milk production for 2023

select SUM(Value)
from milk_production
where Year = 2023


-- Question 2. Which states had cheese produciton greater than 100 million in April 2023?
  
select sl.State, SUM(cp.Value)
from state_lookup sl 
join cheese_production cp 
on sl.State_ANSI = cp.State_ANSI
where cp.Year = 2023 and cp.Period ='APR'
group by sl.State


-- Question 3. Total value of coffee production for 2011
  
select SUM(Value)
from coffee_production
where Year = 2011


-- Question 4. Average Honey Production for 2022
  
select AVG(Value)
from honey_production
where Year = 2022


-- Question 5. Generate list of state names with their ANSI codes
  
select State, State_ANSI
from state_lookup

  
-- Question 6. List all states with cheese production values from April 2023 and find the value for New Jersey
  
select sl.State, SUM(cp.Value)
from state_lookup sl 
join cheese_production cp 
on sl.State_ANSI = cp.State_ANSI
where cp.Year = 2023 and cp.Period ='APR'
group by sl.State

  
-- Question 7. Find total yogurt production for states in year 2022 which also have cheese production data from 2023
  
select sum(yp.Value)
from yogurt_production yp 
where yp.Year = 2022 and yp.State_ANSI in (select distinct cp.State_ANSI from cheese_production cp where cp.Year = 2023);


-- Question 8. List all states from state_lookup that are missing from milk_production in 2023

select sl.State, SUM(mp.Value)
from state_lookup sl 
left join milk_production mp 
on sl.State_ANSI = mp.State_ANSI
where mp.Year = 2023
group by sl.State;


-- Question 9. List all states with their cheese production values for April 2023 and check if Delaware is on the list

select sl.State, SUM(cp.Value)
from state_lookup sl 
join cheese_production cp 
on sl.State_ANSI = cp.State_ANSI
where cp.Year = 2023 and cp.Period ='APR'
group by sl.State

  
-- Question 10. Find average coffee production for all years where the honey production exceeded 1 million
  
--Method 1
select AVG(Value)
from coffee_production
where Year in (select Year from honey_production where Value > 1000000);

--Method2
select AVG (Value)
from coffee_production
where Year in (select Year
from honey_production hp 
group by Year
having sum(Value) > 1000000);
