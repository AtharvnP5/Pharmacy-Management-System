-- Insert data into Patient table
INSERT INTO Patient (AadharID, Name, Address, Age, Primary_physician)
VALUES (101, 'John Doe', '123 Elm Street', 45, NULL);
INSERT INTO Patient (AadharID, Name, Address, Age, Primary_physician)
VALUES (102, 'Jane Smith', '456 Maple Avenue', 30, NULL);
INSERT INTO Patient (AadharID, Name, Address, Age, Primary_physician)
VALUES (103, 'Alice Brown', '789 Pine Road', 50, NULL);

-- Insert data into Doctor table
INSERT INTO Doctor (AadharID, Name, Specialty, Years_of_Experience)
VALUES (201, 'Dr. Smith', 'Cardiology', 15);
INSERT INTO Doctor (AadharID, Name, Specialty, Years_of_Experience)
VALUES (202, 'Dr. Johnson', 'Neurology', 10);
INSERT INTO Doctor (AadharID, Name, Specialty, Years_of_Experience)
VALUES (203, 'Dr. Lee', 'Orthopedics', 20);

UPDATE Patient
SET Primary_physician = 201
WHERE AadharID = 101;

UPDATE Patient
SET Primary_physician = 202
WHERE AadharID = 102;

UPDATE Patient
SET Primary_physician = 201
WHERE AadharID = 103;

-- Insert data into Pharma_company table
INSERT INTO Pharma_company (Name, Phone_number)
VALUES ('PharmaCorp', '123-456-7890');
INSERT INTO Pharma_company (Name, Phone_number)
VALUES ('MediLife', '987-654-3210');
INSERT INTO Pharma_company (Name, Phone_number)
VALUES ('HealthGen', '555-123-4567');

-- Insert data into Pharmacy table
INSERT INTO Pharmacy (Name, Phone_number, Address)
VALUES ('HealthPlus', '987-654-3210', '456 Oak Avenue');
INSERT INTO Pharmacy (Name, Phone_number, Address)
VALUES ('MediStore', '123-987-6543', '789 Birch Lane');
INSERT INTO Pharmacy (Name, Phone_number, Address)
VALUES ('WellnessPharma', '555-678-1234', '321 Cedar Street');

-- Insert data into Treatment table
INSERT INTO Treatment (Patient, Doctor)
VALUES (101, 201);
INSERT INTO Treatment (Patient, Doctor)
VALUES (102, 202);
INSERT INTO Treatment (Patient, Doctor)
VALUES (103, 203);

-- Insert data into Drug table
INSERT INTO Drug (Company, TradeName, Formula)
VALUES ('PharmaCorp', 'PainRelief', 'C8H9NO2');
INSERT INTO Drug (Company, TradeName, Formula)
VALUES ('MediLife', 'ColdCure', 'C10H14N2');
INSERT INTO Drug (Company, TradeName, Formula)
VALUES ('HealthGen', 'AllergyFix', 'C16H19NO3');

-- Insert data into Contract table
INSERT INTO Contract (Pharma_company, Pharmacy, Start_date, End_date, Content, Supervisor)
VALUES ('PharmaCorp', 'HealthPlus', TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2025-12-31', 'YYYY-MM-DD'), 'Supply Agreement', 'Alice Johnson');
INSERT INTO Contract (Pharma_company, Pharmacy, Start_date, End_date, Content, Supervisor)
VALUES ('MediLife', 'MediStore', TO_DATE('2025-02-01', 'YYYY-MM-DD'), TO_DATE('2025-11-30', 'YYYY-MM-DD'), 'Exclusive Deal', 'Bob Carter');
INSERT INTO Contract (Pharma_company, Pharmacy, Start_date, End_date, Content, Supervisor)
VALUES ('HealthGen', 'WellnessPharma', TO_DATE('2025-03-01', 'YYYY-MM-DD'), TO_DATE('2025-10-31', 'YYYY-MM-DD'), 'Distribution Contract', 'Carol White');

-- Insert data into Pharmacy_Sales table
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price)
VALUES ('PharmaCorp', 'PainRelief', 'HealthPlus', 50);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price)
VALUES ('MediLife', 'ColdCure', 'MediStore', 30);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price)
VALUES ('HealthGen', 'AllergyFix', 'WellnessPharma', 40);

-- Insert data into Prescription table
INSERT INTO Prescription (Patient, Date, Doctor)
VALUES (101, TO_DATE('2025-04-19', 'YYYY-MM-DD'), 201);
INSERT INTO Prescription (Patient, Date, Doctor)
VALUES (102, TO_DATE('2025-04-18', 'YYYY-MM-DD'), 202);
INSERT INTO Prescription (Patient, Date, Doctor)
VALUES (103, TO_DATE('2025-04-17', 'YYYY-MM-DD'), 203);

-- Insert data into Prescription_Drug table
INSERT INTO Prescription_Drug (Patient, Date, Company, TradeName, City)
VALUES (101, TO_DATE('2025-04-19', 'YYYY-MM-DD'), 'PharmaCorp', 'PainRelief', 'New York');
INSERT INTO Prescription_Drug (Patient, Date, Company, TradeName, City)
VALUES (102, TO_DATE('2025-04-18', 'YYYY-MM-DD'), 'MediLife', 'ColdCure', 'Los Angeles');
INSERT INTO Prescription_Drug (Patient, Date, Company, TradeName, City)
VALUES (103, TO_DATE('2025-04-17', 'YYYY-MM-DD'), 'HealthGen', 'AllergyFix', 'Chicago');