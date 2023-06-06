-- count rows
SELECT
    COUNT(*)
FROM "CRICRI_DB".kaggle.datascience_salary_2023;

-- avg salary per year per job_title
-- order by year and avg_salary
SELECT
    work_year,
    job_title,
    round(AVG(salary),0) AS average_salary
FROM "CRICRI_DB".kaggle.datascience_salary_2023
GROUP BY job_title, work_year
ORDER BY work_year, average_salary DESC;