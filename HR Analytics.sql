CREATE DATABASE HR_Database;

CREATE TABLE  HrData
(
emp_no int primary key,
Gender varchar(50) NOT NULL,
Marital_Status varchar(50),
Age_band varchar(50),
Age int,
Deaprtment varchar(50),
Education varchar(50),
Education_Field varchar(50),
Job_Role varchar(50),
Business_Travel varchar(50),
Employee_Count int,
Attrition  varchar(50),
Attrition_Level  varchar(50),
Job_Satisfaction int,
Active_Employeee int
);

select * from HrData;

#Testing Tableau HR Analyst Dashboard

SELECT SUM(employee_Count) As Employee_Count
FROM hrdata;

SELECT SUM(employee_Count) As Employee_Count
FROM hrdata
WHERE Education = 'High School';

SELECT SUM(employee_count) As Employee_Count
from hrdata
WHERE Deaprtment = 'Sales';



SELECT SUM(employee_Count) As Employee_Count
FROM hrdata
where Education_Field = 'Medical';

SELECT COUNT(attrition)
from hrdata;

SELECT COUNT(attrition)
from hrdata
where Attrition = 'Yes';

SELECT COUNT(attrition)
from hrdata
where Attrition = 'Yes' and Education = 'Doctoral Degree';

SELECT COUNT(attrition)
from hrdata
where Attrition = 'Yes' and Deaprtment = 'R&D' and Education_Field = 'Medical';

SELECT COUNT(attrition)
from hrdata
where Attrition = 'Yes' and Deaprtment = 'R&D' and Education_Field = 'Medical' and Education = 'High School';

SELECT round((
(select count(attrition)
from hrdata
where attrition = 'Yes')
 /
sum(employee_count)
) * 100, 2) as Attrition_Rate
from hrdata;

SELECT round((
(select count(attrition)
from hrdata
where attrition = 'Yes' and Deaprtment = 'Sales')
 /
sum(employee_count)
) * 100, 2) as Attrition_Rate
from hrdata
where Deaprtment = 'Sales';

select sum(employee_count) - 
(select count(attrition) from hrdata
where Attrition = 'yes')
from hrdata;

select sum(employee_count) - 
(select count(attrition) from hrdata
where Attrition = 'yes'
and Gender = 'Male')
from hrdata As Active_Employee
where gender = 'Male';

select round(avg(age), 0) As Avg_Age
from hrdata;

#Attrition By Gender

select gender, Count(attrition)
from hrdata
where Attrition = 'Yes'
group by gender
order by Count(attrition) desc;

select gender, Count(attrition)
from hrdata
where Attrition = 'Yes' and Education = 'High School' 
group by gender
order by Count(attrition) desc;

select Deaprtment, count(attrition)
from hrdata
where Attrition = 'Yes'
group by Deaprtment
order by count(Attrition) desc;

select Deaprtment, count(attrition), 
round(count(attrition)
 / (select count(Attrition) from hrdata
where attrition = 'Yes') *100 , 2) as pct
from hrdata
where Attrition = 'Yes'
group by Deaprtment
order by count(attrition) desc;

select age, sum(employee_count)
from hrdata
where Deaprtment = 'R&D'
group by Age
order by Age;

select education_field, count(attrition)
from hrdata
where attrition = 'Yes' and Deaprtment = 'Sales'
group by Education_Field
order by count(attrition) desc;

select Age_band, gender, count(attrition)
from hrdata
where attrition = 'Yes'
group by Age_band, gender
order by Age_band, gender;

select Age_band, gender, count(attrition),
round(count(attrition) / (select count(Attrition) from hrdata
where Attrition = 'Yes') * 100, 2)  as PCT
from hrdata
where attrition = 'Yes'
group by Age_band, gender
order by Age_band, gender;

#create EXTENSION  if not exists tablefunc;
#select * from crosstab (
#'select job_Role, Job_Satisfaction, Sum(Employee_Count)
#from hrdata
#group by Job_role, Job_Satisfaction
#order by Job_role, Job_Satisfaction'
#)
#as ct(Job_Role varchar(50), one Numeric, two Numeric, three Numeric, four Numeric)
#order by job_role;

SELECT Age_band, Gender, sum(employee_Count) As Employee_Count
from hrdata
group by Age_band, Gender
order by Age_band, Gender desc;









