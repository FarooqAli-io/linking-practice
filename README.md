# Linking Practice

This repository contains my **AI Diploma Days 8–10 SQL practice** at Aptech.  
The focus is on **linking tables** using **primary keys, foreign keys, and joins**.  
All tables, sample data, and example queries are included in one SQL script.

---

## Database Overview

- **Database Name:** `Link practice `  
- **Tables:**  
  - `Departments` – Department details  
  - `Employees` – Employee details linked to departments  
  - `Projects` – Projects linked to departments  
  - `EmployeeProjects` – Linking table connecting employees and projects
 
  - 
```sql
-- Create the database
CREATE DATABASE Linkpractice;

-- Use the database
USE Linkpractice;

-- Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT,
    Role VARCHAR(50),
    CONSTRAINT FK_Employees_Department FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);

-- Projects table
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    DepartmentID INT,
    CONSTRAINT FK_Projects_Department FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);

-- EmployeeProjects table to link employees and projects
CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT,
    PRIMARY KEY (EmployeeID, ProjectID),
    CONSTRAINT FK_EmployeeProjects_Employee FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID),
    CONSTRAINT FK_EmployeeProjects_Project FOREIGN KEY (ProjectID)
        REFERENCES Projects(ProjectID)
);

-- Sample data
INSERT INTO Departments VALUES (1, 'AI'), (2, 'Web'), (3, 'Data');

INSERT INTO Employees VALUES 
(1, 'Ali Khan', 1, 'AI Engineer'),
(2, 'Sara Ahmed', 2, 'Developer'),
(3, 'John Smith', 3, 'Data Analyst');

INSERT INTO Projects VALUES 
(1, 'Chatbot', 1),
(2, 'Website', 2),
(3, 'Analysis', 3);

INSERT INTO EmployeeProjects VALUES 
(1, 1),
(2, 2),
(3, 3);

-- Example join: Get employee and their department
SELECT e.Name AS Employee, d.DepartmentName AS Department
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Example join: Get employee and their project
SELECT e.Name AS Employee, p.ProjectName AS Project
FROM EmployeeProjects ep
INNER JOIN Employees e ON ep.EmployeeID = e.EmployeeID
INNER JOIN Projects p ON ep.ProjectID = p.ProjectID;
