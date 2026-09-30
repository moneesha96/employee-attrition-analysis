CREATE DATABASE ibm_hr_analytics;

USE ibm_hr_analytics;

CREATE TABLE hr_employee (
    Age INT,
    Attrition VARCHAR(10),
    BusinessTravel VARCHAR(50),
    DailyRate INT,
    Department VARCHAR(100),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(100),
    EmployeeCount INT,
    EmployeeNumber INT PRIMARY KEY,
    EnvironmentSatisfaction INT,
    Gender VARCHAR(20),
    HourlyRate INT,
    JobInvolvement INT,
    JobLevel INT,
    JobRole VARCHAR(100),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(50),
    MonthlyIncome INT,
    MonthlyRate INT,
    NumCompaniesWorked INT,
    Over18 VARCHAR(5),
    OverTime VARCHAR(10),
    PercentSalaryHike INT,
    PerformanceRating INT,
    RelationshipSatisfaction INT,
    StandardHours INT,
    StockOptionLevel INT,
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT
);

SELECT * 
FROM hr_employee;

SELECT * 
FROM hr_employee
LIMIT 10; 

SELECT COUNT(*) as total_employees
FROM hr_employee; 

SELECT 
 COUNT(*) as total_rows, 
 COUNT(DISTINCT employeenumber) as unique_employees
 FROM hr_employee;
 


-- what is the overall employee attrition rate? 
SELECT 
 COUNT(*) as total_employees, 
 SUM(CASE
     WHEN attrition = 'Yes' THEN 1 
     ELSE 0
 END) as employees_left, 
 ROUND(
      100.0 * SUM (CASE 
          WHEN attrition = 'Yes' then 1 
          else 0 
      end) / count (*),
      2
    ) AS attrition_rate 
  from hr_employee;

-- which departments have the highest attrition rate? 
SELECT department, 
COUNT(*) as total_employees, 
 SUM(CASE
     WHEN attrition = 'Yes' THEN 1 
     ELSE 0
 END) as employees_left,
 ROUND( 100.0* SUM(CASE
     WHEN attrition = 'Yes' THEN 1 
     ELSE 0
 END)/ COUNT(*), 
  2) aS attrition_rate 
from hr_employee 
Group by department
Order by attrition_rate DESC; 

-- Does working overtime appear to be associated with higher attrition? 
SELECT 
 overtime, 
 count(*) AS total_employees, 
 SUM(CASE
     WHEN attrition = 'Yes' THEN 1 
     ELSE 0
 END) as employees_left,
  ROUND( 100.0* SUM(CASE
     WHEN attrition = 'Yes' THEN 1 
     ELSE 0
 END)/ COUNT(*), 
  2) aS attrition_rate 
from HR_employee
group by overtime; 

-- Which job roles have the highest attrition? 
SELECT jobrole, 
COUNT(*) as total_employees, 
 SUM(CASE
     WHEN attrition = 'Yes' THEN 1 
     ELSE 0
 END) as employees_left,
 ROUND( 100.0* SUM(CASE
     WHEN attrition = 'Yes' THEN 1 
     ELSE 0
 END)/ COUNT(*), 
  2) aS attrition_rate 
from hr_employee 
Group by jobrole
Order by attrition_rate DESC; 

---	Does monthly income differ between employees who stay and leave? 
SELECT attrition, round(avg(monthlyincome),2) AS avg_monthlyincome
from HR_employee
GROUP by attrition; 

---	Does job satisfaction appear related to attrition? 
select jobsatisfaction,
 COUNT(*) as total_employees, 
 SUM(CASE 
     WHEN attrition = 'Yes' then 1 
     else 0
 end)  as employee_left,
 ROUND( 100.0* SUM(CASE
     WHEN attrition = 'Yes' THEN 1 
     ELSE 0
 END)/ COUNT(*), 
  2) aS attrition_rate 
FROM HR_employee
GROUP BY jobsatisfaction;

-- what about work-life balance?
select worklifebalance,
 COUNT(*) as total_employees, 
 SUM(CASE 
     WHEN attrition = 'Yes' then 1 
     else 0
 end)  as employee_left,
 ROUND( 100.0* SUM(CASE
     WHEN attrition = 'Yes' THEN 1 
     ELSE 0
 END)/ COUNT(*), 
  2) aS attrition_rate 
FROM HR_employee
GROUP BY worklifebalance;

-- Does Tenure matter? 
SELECT
 CASE 
  WHEN yearsatcompany <= 2 THEN '0-2 years'
  when yearsatcompany <= 5 then '3-5 years' 
  when yearsatcompany <=  10 then '6-10 years' 
  else '11+ years'
 end as tenure_group, 
 count(*) as total_employees,
 SUM(CASE 
     WHEN attrition = 'Yes' then 1 
     else 0
 end)  as employee_left,
 ROUND( 100.0* SUM(CASE
     WHEN attrition = 'Yes' THEN 1 
     ELSE 0
 END)/ COUNT(*), 
  2) aS attrition_rate 
from HR_employee
group by tenure_group; 

---	Are particular age groups experiencing higher attrition? 
SELECT
 CASE 
  WHEN age <= 20 THEN '11-20 years'
  when age <= 30 then '21-30 years' 
  when age <= 40 then '31-40 years' 
  when age <= 50 then '41-50 years' 
  when age <= 60 then '51-60 years' 
  else '60+ years' 
 end as age_group, 
 count(*) as total_employees,
 SUM(CASE 
     WHEN attrition = 'Yes' then 1 
     else 0
 end)  as employee_left,
 ROUND( 100.0* SUM(CASE
     WHEN attrition = 'Yes' THEN 1 
     ELSE 0
 END)/ COUNT(*), 
  2) AS attrition_rate 
from HR_employee
group by age_group;  
