/*
    Task : Find the top-paying Data Analyst jobs.
        - Identify 10 highest paying Data Analyst roles that are available remotely.
        - Focuses on job postings with specified salaries(remove nulls).
    Goal : Highlight the top-paying opportunities for Data Analysts that can work remotely.
*/

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