--Query 1: What are the top 10 highest-paying jobs?

SELECT c4 AS job_title, ROUND(AVG(c7), 0) AS average_salary
FROM salaries
WHERE c4 != 'job_title'
GROUP BY c4
ORDER BY average_salary DESC
LIMIT 10;

--Note: The highest compensation tiers are dominated by specialized leadership positions, with Research Team Leads and Analytics Engineering Managers topping the chart at $450,000 and roughly $400,000 respectively.

-----------------------------------------------

--Query 2: How does experience level impact average salary and job availability?

SELECT c2 AS experience_level, ROUND(AVG(c7), 0) AS average_salary, COUNT(*) AS total_jobs
FROM salaries
WHERE c2 != 'experience_level'
GROUP BY c2
ORDer BY average_salary DESC;

--Note: Executive (EX) roles boast the highest average compensation at roughly $200,471. However, Senior (SE) roles hold the vast majority of the job market share with over 87,000 postings, averaging a highly competitive $172,658.

-----------------------------------------------

--Query 3: How does remote work impact average salary and job availability?

SELECT
    CASE
        WHEN c9 = '100' THEN 'Fully Remote'
        WHEN c9 = '50' THEN 'Hybrid'
        WHEN c9 = '0' THen 'On-Site'
        ELSE 'Unknown'
    END AS work_model,
    ROUND(AVG(c7), 0) AS average_salary,
    COUNT(*) AS total_jobs
FROM salaries
WHERE c9 != 'remote_ratio'
GROUP BY c9
ORDER BY total_jobs DESC;

--Note: While Fully Remote jobs maintain strong salaries (averaging $151k), On-Site roles offer both the highest volume of opportunities and the highest average pay ($159k).

-----------------------------------------------

--Query 4: Which countries have the most data and AI job opportunities?

SELECT c10 AS company_location, COUNT(*) AS total_jobs, ROUND(AVG(c7), 0) AS average_salary
FROM salaries
WHERE c10 != 'company_location'
GROUP BY c10
ORDER BY total_jobs DESC
LIMIT 10;

--Note: The United States overwhelmingly dominates the global data job market with over 135,000 postings and offers the highest average compensation at roughly $163,905.

-----------------------------------------------