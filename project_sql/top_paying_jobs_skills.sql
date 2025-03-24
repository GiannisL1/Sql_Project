/*
    Task : Find the top-paying Data Analyst jobs.
        - Identify 10 highest paying Data Analyst roles that are available remotely.
        - Focuses on job postings with specified salaries(remove nulls).
        - What are the skills for these jobs?
    Goal : Highlight the top-paying opportunities for Data Analysts that can work remotely and the skills that are required.
*/

WITH top_paying_jobs AS(
    SELECT 
        job_id,
        job_title,
        job_schedule_type,
        job_location,
        salary_year_avg,
        name AS company_name
    FROM 
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id=company_dim.company_id
    WHERE 
        job_title_short='Data Analyst' AND 
        job_work_from_home=TRUE AND 
        salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)

SELECT top_paying_jobs.*,
       skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id