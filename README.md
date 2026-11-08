# Employee Attrition Analysis

Tools: Power BI Desktop, Power Query Editor, SQL (MySQL-style queries)
Dataset: IBM HR Employee Attrition dataset
Project type: HR analytics | Exploratory data analysis | Business intelligence

An end-to-end HR analytics project investigating employee attrition and its relationship with workforce characteristics. Power Query Editor was used for data cleaning and transformation, SQL for exploratory analysis and business questions, and Power BI for interactive data visualisation and reporting.

Project Overview

Employee attrition can affect recruitment costs, team stability, and workforce planning. This project analyses 1,470 employee records across 35 attributes, including 237 employees who left, to identify patterns that HR teams may want to investigate further.

The analysis is descriptive: it identifies associations within the dataset, not proven causes of employees leaving. The aim is to help HR stakeholders identify areas for further investigation and develop evidence-informed retention strategies.

Project Objectives

	●	Measure overall employee attrition and understand workforce composition.
	●	Explore how attrition differs across departments, job roles, overtime, income, satisfaction, tenure and age.
	●	Prepare a consistent dataset using Power Query Editor.
	●	Communicate findings through SQL analysis and an interactive Power BI dashboard.
	●	Translate observed patterns into practical questions and recommendations for HR teams.

What this project covers

	●	Data cleaning and transformation in Power Query Editor (duplicates, missing values, data types, column names and calculated columns)
	●	Inspecting employee records and checking total versus distinct employee IDs
	●	Calculating the overall attrition rate
	●	Comparing attrition by department and job role
	●	Exploring the association between overtime and attrition
	●	Comparing average monthly income for employees who stayed versus left
	●	Examining job satisfaction and work–life balance
	●	Segmenting attrition by employee tenure and age group
	●	Presenting workforce metrics in Power BI

Repository Structure

The following is a suggested GitHub layout for the three project files supplied; arrange or rename files to match it before using these paths as links.

employee-attrition-analysis/

├── Dataset/

│   └── HR_employee_attrition.csv

├── SQL/

│   └── project2_hr_employee_attrition.sql

├── Dashboard/

│   └── hr_employee.pbix

└── README.md

Project Workflow and Methodology

1. Data Collection and Inspection

The project uses the IBM HR Employee Attrition dataset supplied as HR_employee_attrition.csv. The data contains employee demographic, job, compensation, satisfaction and tenure attributes, with Attrition identifying whether an employee left.

2. Data Cleaning and Transformation — Power Query Editor

Data preparation was performed in Power BI Desktop using Power Query Editor, before building the dashboard. The cleaning work included:

	●	Removing duplicates: reviewing and removing duplicate records where appropriate to maintain a consistent employee-level dataset.
	●	Handling null or missing values: inspecting columns for blanks and handling missing entries as appropriate for the analysis.
	●	Correcting data types: assigning suitable text, whole-number or other data types so fields could be analysed and visualised correctly.
	●	Renaming columns: improving column names for readability and consistent reporting.
	●	Creating new columns: adding derived or categorised fields to support analysis and dashboard visuals.

These steps describe the preparation performed in Power Query. The supplied CSV is a separate source file; it does not, by itself, document the exact sequence of Power Query transformations. The editable transformations are maintained in the .pbix project.

3. Exploratory Data Analysis — SQL

SQL queries were written to explore the dataset and answer HR business questions. The script includes employee record checks, conditional aggregations, GROUP BY summaries, and CASE expressions for age and tenure segmentation.

Questions investigated:

	1.	What is the overall employee attrition rate?
	2.	Which departments and job roles have the highest attrition rates?
	3.	Is working overtime associated with higher attrition?
	4.	How does average monthly income differ between employees who stay and leave?
	5.	How do job satisfaction and work–life balance relate to attrition?
	6.	Does attrition vary by employee tenure or age group?

Attrition rate formula:

Attrition Rate (%) = (Employees with Attrition = 'Yes' / Total Employees) × 100

4. Data Visualisation — Power BI

The Power BI project (hr_employee.pbix) provides an interactive environment for exploring and communicating workforce attrition insights. Power Query was used for preparation, while Power BI was used to present HR metrics and segment-level patterns in a dashboard.

Workflow summary:

CSV dataset → Power Query cleaning & transformation → SQL exploratory analysis → Power BI dashboard → HR insights & recommendations

The SQL queries and Power BI reporting are complementary analytical components; the workflow above summarises the project stages rather than asserting that SQL output was directly imported into Power BI.

Dataset Information

File: HR_employee_attrition.csv
Records: 1,470
Columns: 35
Missing values in supplied CSV: 0

|Column                   |Description                              |
|-------------------------|-----------------------------------------|
|`EmployeeNumber`         |Employee identifier                      |
|`Attrition`              |Whether the employee left (`Yes` or `No`)|
|`Age`                    |Employee age                             |
|`Department`             |Department                               |
|`JobRole`                |Job title or role                        |
|`OverTime`               |Whether the employee works overtime      |
|`MonthlyIncome`          |Monthly income (dataset units)           |
|`JobSatisfaction`        |Job satisfaction rating (1–4)            |
|`WorkLifeBalance`        |Work–life balance rating (1–4)           |
|`YearsAtCompany`         |Years employed at the company            |
|`BusinessTravel`         |Business travel frequency                |
|`DistanceFromHome`       |Distance from home                       |
|`EnvironmentSatisfaction`|Work environment satisfaction rating     |
|`TotalWorkingYears`      |Total years of work experience           |
|`YearsSinceLastPromotion`|Years since most recent promotion        |

The CSV also includes education, compensation, performance, relationship, and management-tenure fields. The SQL analysis focuses on the attributes listed above. Note: The supplied CSV has no missing cells; missing-value checks and handling were still part of the Power Query preparation workflow.

Key Findings from the Analysis

Figures below were calculated from the supplied CSV using the groupings reflected in the SQL file.

Overall Employee Attrition

	●	Total employees: 1,470
	●	Employees who left: 237
	●	Employees who stayed: 1,233
	●	Overall attrition rate: 16.12%

Departments with the Highest Attrition

|Department            |Employees|Employees who left|Attrition rate|
|----------------------|--------:|-----------------:|-------------:|
|Sales                 |446      |92                |20.63%        |
|Human Resources       |63       |12                |19.05%        |
|Research & Development|961      |133               |13.84%        |

Sales had the highest rate, while Research & Development had the highest number of employees who left.

Overtime and Attrition

|Overtime|Employees|Employees who left|Attrition rate|
|--------|--------:|-----------------:|-------------:|
|Yes     |416      |127               |30.53%        |
|No      |1,054    |110               |10.44%        |

Attrition was approximately 2.9 times as high among employees who worked overtime. This is an association and does not establish that overtime caused attrition.

Job Roles with the Highest Attrition Rates

|Job role             |Employees|Employees who left|Attrition rate|
|---------------------|--------:|-----------------:|-------------:|
|Sales Representative |83       |33                |39.76%        |
|Laboratory Technician|259      |62                |23.94%        |
|Human Resources      |52       |12                |23.08%        |

Sales Representatives had the highest attrition rate among the nine job roles in the dataset.

Monthly Income

	●	Employees who left: average monthly income of 4,787.09
	●	Employees who stayed: average monthly income of 6,832.74

Employees who left had lower average monthly income. Job level, role, and other differences may influence this comparison.

Job Satisfaction and Work–Life Balance

	●	Employees with job satisfaction level 1 had an attrition rate of 22.84%, compared with 11.33% for level 4.
	●	Employees with work–life balance level 1 had an attrition rate of 31.25%, compared with 14.22% for level 3.

These results suggest satisfaction and work–life balance are useful dimensions for further HR investigation.

Employee Tenure

|Years at company|Attrition rate|
|----------------|-------------:|
|0–2 years       |29.82%        |
|3–5 years       |13.82%        |
|6–10 years      |12.28%        |
|11+ years       |8.13%         |

Employees in their first two years had the highest attrition rate of the tenure groups analysed.

Age Groups

The 21–30 age group had an attrition rate of 23.46%, while the 31–40 group had a rate of 13.73%. The 20-and-under group had a higher rate (57.14%) but contained only 28 employees, so it should be interpreted cautiously.

Business Implications and Recommendations

The findings suggest several areas for HR teams to investigate:

	1.	Review overtime workloads: Examine whether scheduling, staffing, or workload pressures are contributing to the elevated attrition observed among overtime workers.
	2.	Prioritise early-tenure retention: Strengthen onboarding, check-ins, and support during employees’ first two years.
	3.	Investigate high-attrition roles: Explore the working conditions and career pathways of Sales Representatives and Laboratory Technicians.
	4.	Monitor satisfaction and work–life balance: Use employee feedback alongside attrition metrics to understand potential retention risks.
	5.	Review compensation fairly: Compare pay within comparable roles and job levels before drawing conclusions from overall income differences.

These are recommendations for further investigation, not experimentally validated interventions.

How to Explore or Reproduce the Project

	1.	Download or clone the repository.
	2.	Open Dashboard/hr_employee.pbix in Power BI Desktop. If prompted, update the data-source path to your local copy of the CSV.
	3.	Select Transform data to inspect the Power Query cleaning and transformation steps; select Close & Apply when ready to return to the report.
	4.	Explore the dashboard visuals and available interactive filters.
	5.	To reproduce the SQL analysis, create the hr_employee table using the SQL script, import the CSV records into that table, and run the analysis queries in a compatible SQL environment.

The SQL script creates the database and table but does not include a CSV import command. Its syntax is MySQL-oriented and may require changes in other SQL systems.

Note: The uploaded SQL script does not include a CSV import command. Its SQL syntax is MySQL-oriented; some statements may need adaptation for other database systems.

Technologies Used

	●	Power Query Editor: Duplicate checks/removal, null-value handling, data-type changes, column renaming and creation of derived columns
	●	SQL: Table creation, record inspection, GROUP BY, CASE, aggregation, attrition rate calculations and segmentation
	●	Power BI Desktop: Interactive HR reporting, dashboard development and data visualisation
	●	CSV: Source employee dataset

Visual Outputs


Limitations

	●	The analysis is observational and does not prove why employees leave.
	●	Results reflect the supplied employee dataset, not necessarily a wider workforce.
	●	Group sizes vary; percentages from small groups require caution.
	●	The supplied SQL analysis does not perform predictive modelling or statistical significance testing.
	●	The exact Power Query step sequence and dashboard appearance should be checked in Power BI Desktop before publishing screenshots or claiming specific visual features.

Author

GitHub: moneesha96

License

No license has been specified in the supplied project files. Add a LICENSE file if you wish to define reuse permissions.
