

Select * From employees;

Select * From completed_projects;

Select * From departments;

Select * From project_assignments;

Select * From [upcoming projects];

Select * From projects;

-- Project Status
WITH Project_Status AS
(
    SELECT
        project_id,
        project_name,
        project_budget,
        'Upcoming' AS Status
    FROM [upcoming projects]

    UNION ALL

    SELECT
        project_id,
        project_name,
        project_budget,
        'Completed' AS Status
    FROM completed_projects
)

-- Big Table
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.job_title,
    e.salary,
    d.Department_Name,
    pa.project_id,
    ps.project_name,
    ps.project_budget,
    ps.Status
FROM employees e
JOIN departments d
    ON e.department_id = d.Department_ID
JOIN project_assignments pa
    ON pa.employee_id = e.employee_id
LEFT JOIN Project_Status ps
    ON pa.project_id = ps.project_id;