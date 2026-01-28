--This creates a table with specific variables
  
CREATE TABLE Patients (
    patient_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    gender TEXT,
    city TEXT
);

--This inserts patients into the above table with info for each variables
  
INSERT INTO Patients (patient_id, name, age, gender, city) VALUES
(1, 'John Doe', 45, 'M', 'Boston'),
(2, 'Jane Smith', 32, 'F', 'Cambridge'),
(3, 'Mike Johnson', 58, 'M', 'Boston'),
(4, 'Sarah Williams', 41, 'F', 'Somerville'),
(5, 'David Brown', 29, 'M', 'Boston'),
(6, 'Emily Davis', 67, 'F', 'Cambridge');

This selects all values from the table
  
select * from Patients;

--------

--this creates a new table of the patients visits, with specific variables
CREATE TABLE Visits (
    visit_id INTEGER PRIMARY KEY,
    patient_id INTEGER,
    visit_date TEXT,
    diagnosis TEXT,
    cost REAL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- this inserts specific visits with info for each variable
INSERT INTO Visits (visit_id, patient_id, visit_date, diagnosis, cost) VALUES
(101, 1, '2024-01-15', 'Hypertension', 150.00),
(102, 1, '2024-03-20', 'Diabetes', 200.00),
(103, 2, '2024-02-10', 'Flu', 100.00),
(104, 3, '2024-01-25', 'Hypertension', 150.00),
(105, 3, '2024-02-14', 'Back Pain', 180.00),
(106, 4, '2024-03-05', 'Diabetes', 200.00),
(108, 6, '2024-02-20', 'Arthritis', 220.00),
(109, 6, '2024-03-15', 'Hypertension', 150.00);

--this selects all the visits from the above table
SELECT * from Visits;

--this selects all the patients from the first table
select * from Patients;

-- this selects all the patients from boston
select * from Patients where city = 'Boston';



-- this selects patients and includes their name age and id, leaving out things like city
Select patient_id, name, age from Patients;


--this tells you how many patients there are
select count(*) from patients;

--this tells you how many genders there are
select count(distinct gender) from Patients;


-- this tells you the average age from the patients table
select avg(age) from Patients;


--this tells you the average age per gender
select gender, avg(age)
from Patients
group by gender;

--this tells you the average age by gender, but orders the data in descending age
select gender, avg(age)
from Patients
group by gender
order by 2 desc;

--- this joins the data together by the common variable patient ID
SELECT 
    p.name,
    p.age,
    v.visit_date,
    v.diagnosis,
    v.cost
FROM Patients p
JOIN Visits v ON p.patient_id = v.patient_id;



-- this joins the two tables, and includes all data from the left table, regardless if it includes the variable it is looking for or written for
SELECT 
    p.name,
    p.age,
    v.visit_date,
    v.diagnosis,
    v.cost
FROM Patients p
LEFT JOIN Visits v ON p.patient_id = v.patient_id;




---Advanced---
--case when
--window functions
--CTE (with)
