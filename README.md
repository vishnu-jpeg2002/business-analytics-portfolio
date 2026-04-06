/*
Repository: Business Analytics Portfolio
Author: Vishnu R | Management Consultant | Analyst

Focus:
Business analysis, performance evaluation,
data driven decision support, and structured problem solving.
*/

SELECT 
    'SQL'                    AS Data_Analysis,
    'Python (Pandas)'        AS Data_Processing,
    'Seaborn, Matplotlib'    AS Data_Visualization,
    'Power BI'               AS Reporting_and_Dashboarding,
    'Excel'                  AS Business_Insights;

FROM Portfolio
WHERE Approach IN (
    'Data Cleaning',
    'Exploratory Analysis',
    'Data Transformation',
    'KPI Tracking',
    'Performance Measurement',
    'Insight Generation'
);

-- Method:
-- Define the business problem
-- Structure and clean the data
-- Analyse using SQL and Python
-- Visualize insights using Seaborn and Matplotlib
-- Deliver actionable recommendations
