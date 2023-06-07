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


-- looking for all time high salary per job_title to see what I missed as a poor data engineer
WITH CTE AS (
    SELECT
        job_title,
        salary,
        work_year,
        company_location,
        row_number() over (PARTITION BY job_title ORDER BY salary DESC) ROW_NUM_SALARY_PER_JOB_TITLE
    FROM "CRICRI_DB".kaggle.datascience_salary_2023
)
    SELECT
        job_title,
        salary,
        work_year,
        company_location,
        NTILE (5) OVER (ORDER BY salary DESC) bracket
FROM CTE
    WHERE ROW_NUM_SALARY_PER_JOB_TITLE = 1
    ORDER BY salary DESC;
