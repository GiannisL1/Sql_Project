SELECT 
       ROUND(AVG(j.salary_year_avg)) AS avg_salary,
       s.skills
FROM 
       job_postings_fact j
INNER JOIN skills_job_dim sj ON j.job_id=sj.job_id
INNER JOIN skills_dim s ON sj.skill_id=s.skill_id
WHERE 
      j.job_title_short='Data Analyst' AND 
      j.job_work_from_home=FALSE AND
      j.salary_year_avg IS NOT NULL
GROUP BY 
      s.skills
ORDER BY 
      avg_salary DESC
LIMIT 5