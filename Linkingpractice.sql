Create database Linkpractice

use Linkpractice;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT,
    Role VARCHAR(50),
    CONSTRAINT FK_Employees_Department FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);


CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    DepartmentID INT,
    CONSTRAINT FK_Projects_Department FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);


CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT,
    PRIMARY KEY (EmployeeID, ProjectID),
    CONSTRAINT FK_EmployeeProjects_Employee FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID),
    CONSTRAINT FK_EmployeeProjects_Project FOREIGN KEY (ProjectID)
        REFERENCES Projects(ProjectID)
);


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


SELECT e.Name, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;


SELECT e.Name AS Employee, p.ProjectName AS Project
FROM EmployeeProjects ep
INNER JOIN Employees e ON ep.EmployeeID = e.EmployeeID
INNER JOIN Projects p ON ep.ProjectID = p.ProjectID;


SELECT * FROM Departments;
SELECT * FROM Projects;
