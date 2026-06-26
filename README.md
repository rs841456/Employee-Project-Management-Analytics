<div align="center">

<img src="Aaaets/logo.png" alt="Logo" width="160"/>

# 🏢 Employee & Project Management Analytics Dashboard

### *People • Projects • Performance*

[![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)
[![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)](https://www.microsoft.com/en-us/sql-server)
[![License: MIT](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)]()
[![Data](https://img.shields.io/badge/Data-CSV%20%2B%20SQL-blue?style=for-the-badge)]()

<br/>

> **An end-to-end Business Intelligence project** that tracks employee performance,  
> departmental budgets, and project status across 5 business units using **SQL Server + Power BI**.

<br/>

![Dashboard Preview](Dashboard_img.png)

</div>

---

## 📋 Table of Contents

- [📌 Project Overview](#-project-overview)
- [✨ Features](#-features)
- [🗄 Database Schema](#-database-schema)
- [📁 File Structure](#-file-structure)
- [📊 KPI Summary](#-kpi-summary)
- [🏢 Department Analysis](#-department-analysis)
- [📋 Project Status](#-project-status)
- [🔧 SQL Queries](#-sql-queries)
- [🚀 How to Use](#-how-to-use)
- [📄 License](#-license)

---

## 📌 Project Overview

The **Employee & Project Management Analytics Dashboard** provides a single-pane view of all HR and project data across an organization. It was built with a structured SQL relational database as the backend and Power BI as the interactive front-end.

| Attribute | Detail |
|---|---|
| **Type** | Business Intelligence / Data Analytics |
| **Tools** | Microsoft SQL Server · Power BI Desktop |
| **Data** | 7 CSV tables · 1 SQL file · 1 PBIX file |
| **Scope** | 10 Employees · 5 Departments · 10 Projects |
| **Report Date** | June 2025 |
| **Version** | v1.0 |

---

## ✨ Features

| Feature | Description |
|---|---|
| 🔍 **Employee Filter** | Dropdown to select any Employee ID — updates profile card + headshot |
| 🏢 **Department Slicer** | Filter all visuals by department in one click |
| 📊 **Status Toggle** | Switch between Completed / Upcoming project views |
| 💹 **Capital Calculation** | Auto-computes: Budget − (Project Cost + Salary Cost) per department |
| 🔴 **Deficit Alert** | HR department negative capital flagged in red automatically |
| 🍩 **Dual Donut Charts** | Total capital distribution + per-project budget breakdown |
| 📋 **Financial Summary Table** | Department-level: project cost, salary cost, budget, 2-yr budget, capital |
| 📊 **Bar Charts** | Project Budget by project name + by department |

---

## 🗄 Database Schema

Six relational tables power the dashboard:

```
┌──────────────────────────────────────────────────────────┐
│  employees                                               │
│  ─────────────────────────────────────────────────────   │
│  employee_id (PK) · first_name · last_name · email      │
│  job_title · salary · hire_date · department_id (FK)    │
└───────────────────────┬──────────────────────────────────┘
                        │ FK
┌───────────────────────▼──────────────────────────────────┐
│  departments                                             │
│  ─────────────────────────────────────────────────────   │
│  Department_ID (PK) · Department_Name                    │
│  Department_Budget · Head_of_Department                  │
│  Number_of_Employees · Department_Goals · Location       │
└──────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────┐
│  project_assignments  (Bridge / M:M)                     │
│  ─────────────────────────────────────────────────────   │
│  assignment_id (PK) · employee_id (FK) · project_id (FK)│
└───────────┬──────────────────────────────────────────────┘
            │ connects to ↓
┌───────────▼──────────────────────────────────────────────┐
│  completed_projects         upcoming_projects            │
│  ──────────────────         ─────────────────────────    │
│  project_id (PK)            project_id (PK)             │
│  project_name               project_name                 │
│  project_budget             project_budget               │
│  project_start_date         project_start_date           │
│  project_end_date           project_end_date             │
│  department_id (FK)         department_id (FK)           │
│                             project_lead                 │
└──────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────┐
│  Head_Shots                                              │
│  ─────────────────────────────────────────────────────   │
│  employee_id (FK) · headshot_url                        │
└──────────────────────────────────────────────────────────┘
```

**Relationships:**
- `employees.department_id` → `departments.Department_ID`
- `project_assignments.employee_id` → `employees.employee_id`
- `project_assignments.project_id` → `completed_projects.project_id` OR `upcoming_projects.project_id`

---

## 📁 File Structure

```
Employee-Project-Management-Analytics/
│
├── 📊 Dashboard
│   └── Employee_Project_Management_Analytics_Dashboard.pbix
│
├── 🗄 SQL
│   └── Employee_Project_Analytics.sql
│
├── 📁 Data/
│   ├── employees.csv
│   ├── departments.csv
│   ├── projects.csv
│   ├── completed_projects.csv
│   ├── upcoming_projects.csv
│   ├── project_assignments.csv
│   └── Head_Shots.csv
│
├── 🖼 Assets/
│   ├── logo.png
│   └── Dashboard_img.png
│
├── 📄 Docs/
│   └── Employee_Project_Management_Report.pdf
│
├── 📄 README.md
├── 📄 LICENSE
└── 🚫 .gitignore
```

---

## 📊 KPI Summary

| Metric | Value |
|---|---|
| 👥 Total Employees | **10** |
| 🏢 Total Departments | **5** |
| 💵 Average Salary | **$79,600** |
| 💰 Total Payroll | **$7,96,000** |
| 🏦 Combined Dept. Budget | **$34,50,000** |
| ✅ Completed Projects | **4** (Total: $2,05,000) |
| 🔵 Upcoming Projects | **6** (Total: $3,65,000) |
| 📈 Total Capital Deployed | **$12,88,000** |

---

## 🏢 Department Analysis

| Department | Budget | Employees | Goal | Capital | Status |
|---|---|---|---|---|---|
| Engineering | $12,00,000 | 2 | Develop new products | **$7,70,000** | ✅ Healthy |
| Marketing | $16,00,000 | 2 | Increase brand awareness | **$3,69,000** | ✅ Healthy |
| Sales | $12,00,000 | 3 | Boost sales | **$1,16,000** | ✅ Healthy |
| IT | $9,00,000 | 2 | Improve IT infrastructure | **$58,000** | ✅ Healthy |
| Human Resources | $8,00,000 | 2 | Enhance employee engagement | **($25,000)** | 🔴 Deficit |

> ⚠️ **HR Alert:** Human Resources is the **only department with negative capital**, indicating costs exceeded the allocated budget. Immediate management review is recommended.

---

## 📋 Project Status

### ✅ Completed Projects

| ID | Project | Budget | Start | End |
|---|---|---|---|---|
| 204 | CRM Integration | $50,000 | 2022-01-20 | 2023-01-20 |
| 205 | Brand Repositioning | $70,000 | 2022-04-01 | 2023-04-01 |
| 208 | Customer Support System | $55,000 | 2022-12-15 | 2022-12-15 |
| 209 | Market Research | $30,000 | 2022-03-25 | 2023-03-25 |

### 🔵 Upcoming Projects

| ID | Project | Budget | Start | End | Lead |
|---|---|---|---|---|---|
| 201 | Website Overhaul | $60,000 | 2025-01-15 | 2025-06-30 | Alice Green |
| 202 | Social Media Strategy | $45,000 | 2025-02-20 | 2025-09-10 | Bob White |
| 203 | Product Launch | $80,000 | 2025-03-30 | 2025-12-31 | Carol Black |
| 206 | New Marketing Campaign | $60,000 | 2025-09-10 | 2025-12-10 | Diana Silver |
| 207 | Mobile App Development | $70,000 | 2025-06-10 | 2025-08-15 | Eva Brown |
| 210 | SEO Optimization | $50,000 | 2025-08-01 | 2025-11-01 | Frank Gray |

---

## 🔧 SQL Queries

### Basic Queries

```sql
-- View all tables
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM completed_projects;
SELECT * FROM project_assignments;
SELECT * FROM [upcoming projects];
SELECT * FROM projects;
```

### Master Analytics Query (CTE + Multi-JOIN)

```sql
-- STEP 1: Combine completed & upcoming projects with status label
WITH Project_Status AS (

    SELECT project_id, project_name, project_budget,
           'Upcoming' AS Status
    FROM [upcoming projects]

    UNION ALL

    SELECT project_id, project_name, project_budget,
           'Completed' AS Status
    FROM completed_projects

)

-- STEP 2: Full join — employees + departments + assignments + project status
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
```

> **How this query works:**
> 1. **CTE** `Project_Status` uses `UNION ALL` to merge two project tables into one unified set with a `Status` column (`'Upcoming'` or `'Completed'`)
> 2. **Three JOINs** connect employees → departments → project assignments for complete context
> 3. **LEFT JOIN** to `Project_Status` ensures all employees are returned even if their project has no status match
> 4. **Power BI** consumes this single result set to drive all dashboard visuals

---

## 🚀 How to Use

### Open in Power BI Desktop

```
1. Download Power BI Desktop → https://powerbi.microsoft.com/desktop/
2. Open: Employee_Project_Management_Analytics_Dashboard.pbix
3. On prompt → update data source path to your local /Data/ folder
4. Click: Home → Refresh
5. All visuals update automatically ✅
```

### Run SQL in SQL Server

```
1. Open SQL Server Management Studio (SSMS)
2. Create new database: CREATE DATABASE EmployeeProjectDB;
3. Import each CSV via: Tasks → Import Flat File
   (employees, departments, projects, completed_projects,
    upcoming_projects, project_assignments, Head_Shots)
4. Open Employee_Project_Analytics.sql → Execute (F5)
```

### Refresh with New Data

```
1. Update CSV files with new employee/project records
2. In Power BI → Home → Refresh
3. Dashboard visuals auto-update with latest data ✅
```

---

## 📄 License

```
MIT License

Copyright (c) 2025 Employee & Project Management Analytics

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```

**Permissions:**

| ✅ Allowed | ❌ Not Allowed |
|---|---|
| Commercial use | Liability claim |
| Modification | Warranty claim |
| Distribution | — |
| Private use | — |
| Sub-licensing | — |

> 📌 This project was built for **educational and portfolio purposes**.  
> All data used is **fictional** and does not represent any real organization.

---

<div align="center">

**Made with ❤️ using SQL Server + Power BI**

*"Turning data into decisions — People, Projects, Performance."*

</div>
