# 	World life expectancy (Data Cleaning).

select * 
from world_life_expectancy;

## ------------------- Detect and remove duplicates.

select Country, Year, concat(Country, Year), count(concat(Country, Year))
from world_life_expectancy
group by Country, Year, concat(Country, Year)
having count(concat(Country, Year)) > 1; 

SELECT *
FROM (
    SELECT 
        Row_ID,
        CONCAT(Country, Year) AS Country_Year,
        ROW_NUMBER() OVER (
            PARTITION BY CONCAT(Country, Year)
            ORDER BY CONCAT(Country, Year)
        ) AS Row_Num
    FROM world_life_expectancy
) AS Row_table
WHERE Row_Num > 1;

DELETE FROM world_life_expectancy
WHERE
	Row_ID IN (
    SELECT Row_ID
FROM (
    SELECT 
        Row_ID,
        CONCAT(Country, Year),
        ROW_NUMBER() OVER (PARTITION BY CONCAT(Country, Year)
		ORDER BY CONCAT(Country, Year)) AS Row_Num
    FROM world_life_expectancy
) AS Row_table
WHERE Row_Num > 1);

## ------------------- Check empty cells in the "Status" column.

select *
from world_life_expectancy;

select *
from world_life_expectancy
where Status = '';

select distinct(Status)
from world_life_expectancy; # We can see that we have two options: developing and developed.

update world_life_expectancy t1
join world_life_expectancy t2
	on t1.country = t2.country
    set t1.Status = 'Developing'
    where t1.Status = ''
    and t2.Status <> ''
    and t2.Status = 'Developing';
    
update world_life_expectancy t1
join world_life_expectancy t2
	on t1.country = t2.country
    set t1.Status = 'Developed'
    where t1.Status = ''
    and t2.Status <> ''
    and t2.Status = 'Developed';
    
## ------------------- Check empty cells in the "Life expectancy" column.

select *
from world_life_expectancy;

select * 
from world_life_expectancy
where `Life expectancy` = '';

select t1.Country, t1.Year, t1.`Life expectancy`,
t2.Country, t2.Year, t2.`Life expectancy`,
t3.Country, t3.Year, t3.`Life expectancy`,
round((t2.`Life expectancy` + t3.`Life expectancy`)/2, 1)
from world_life_expectancy t1
join world_life_expectancy t2
	on t1.Country = t2.Country
    and t1.Year = t2.Year-1
join world_life_expectancy t3
	on t1.Country = t3.Country
    and t1.Year = t3.Year+1
where t1.`Life expectancy` = ''
;

update world_life_expectancy t1
join world_life_expectancy t2
	on t1.Country = t2.Country
    and t1.Year = t2.Year-1
join world_life_expectancy t3
	on t1.Country = t3.Country
    and t1.Year = t3.Year+1
set t1.`Life expectancy` = round((t2.`Life expectancy` + t3.`Life expectancy`)/2, 1)
where t1.`Life expectancy` = ''
;


# ----------------------------------
# ----------------------------------


# 	World life expectancy (Exploratory Data Analysis).

select * 
from world_life_expectancy;

## Q1: How has life expectancy changed in each country over the last 15 years (2007–2022)?

select Country, min(`Life expectancy`),
 max(`Life expectancy`),
 round( max(`Life expectancy`) -  min(`Life expectancy`), 1) as Life_increase_15_years
from world_life_expectancy
group by Country
having min(`Life expectancy`) <> 0
and max(`Life expectancy`) <> 0
order by Life_increase_15_years desc
;

## Q2: What is the trend in global average life expectancy over the last 15 years (2007–2022)?

select Year, round(avg(`Life expectancy`), 2) 
from world_life_expectancy
group by Year
order by Year
;

## Q3: How Does GDP Correlate With Life Expectancy Across Nations?

select Country, round(avg(`Life expectancy`), 1) as Life_Expectancy, round(avg(GDP),1) as GDP
from world_life_expectancy
group by Country
having Life_Expectancy >0 
and GDP >0
order by GDP desc
;

select 
sum(case when GDP >= 1500 then 1 else 0 end) as High_Gdp_Count,
avg(case when GDP >= 1500 then `Life expectancy` else null end) High_GDP_Life_Expectancy,
sum(case when GDP <= 1500 then 1 else 0 end) as Low_Gdp_Count,
avg(case when GDP <= 1500 then `Life expectancy` else null end) Low_GDP_Life_Expectancy
from world_life_expectancy
;

## Q4: Comparing Life Expectancy Across Developed and Developing Countries

select Status, count(distinct Country), round(avg(`Life expectancy`), 1)
from world_life_expectancy
group by Status
;