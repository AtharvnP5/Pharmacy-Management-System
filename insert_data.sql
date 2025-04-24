-- Insert data into Patient table
INSERT INTO Patient (AadharID, Name, Address, Age, Primary_physician)
VALUES (101, 'Parth Joshi', '127 Shankar Bhavan', 22, NULL);
INSERT INTO Patient (AadharID, Name, Address, Age, Primary_physician)
VALUES (102, 'Atharv Patil', '161 Vishwakarma Bhavan', 20, NULL);
INSERT INTO Patient (AadharID, Name, Address, Age, Primary_physician)
VALUES (103, 'Atharva Deshkar', '121 Ganga Bhavan', 16, NULL);
INSERT INTO Patient (AadharID, Name, Address, Age, Primary_physician)
VALUES (104, 'Rujul Krishna', '51 Gandhi Bhavan', 19, NULL);


-- Insert data into Doctor table
INSERT INTO Doctor (AadharID, Name, Specialty, Years_of_Experience)
VALUES (201, 'Dr. Venkat', 'Neuroscience', 15);
INSERT INTO Doctor (AadharID, Name, Specialty, Years_of_Experience)
VALUES (202, 'Dr. Sharma', 'ENT', 10);
INSERT INTO Doctor (AadharID, Name, Specialty, Years_of_Experience)
VALUES (203, 'Dr. Verma', 'Orthopedics', 20);

UPDATE Patient
SET Primary_physician = 201
WHERE AadharID = 101;

UPDATE Patient
SET Primary_physician = 202
WHERE AadharID = 102;

UPDATE Patient
SET Primary_physician = 201
WHERE AadharID = 103;

UPDATE Patient
SET Primary_physician = 203
WHERE AadharID = 104;

-- Insert data into Pharma_company table
INSERT INTO Pharma_company (Name, Phone_number)
VALUES ('Emcure Pharma', '123-456-7890');
INSERT INTO Pharma_company (Name, Phone_number)
VALUES ('Aditya Birla Pharma', '987-654-3210');
INSERT INTO Pharma_company (Name, Phone_number)
VALUES ('Pfizer', '555-123-4567');

-- Insert data into Pharmacy table
INSERT INTO Pharmacy (Name, Phone_number, Address)
VALUES ('NOVAHealthPlus', '987-654-3210', 'Wakad Pune');
INSERT INTO Pharmacy (Name, Phone_number, Address)
VALUES ('NOVAMediStore', '123-987-6543', 'Borivali Mumbai');
INSERT INTO Pharmacy (Name, Phone_number, Address)
VALUES ('NOVAWellnessPharma', '555-678-1234', 'Whitefield Banglore');

-- Insert data into Treatment table
INSERT INTO Treatment (Patient, Doctor)
VALUES (101, 201);
INSERT INTO Treatment (Patient, Doctor)
VALUES (102, 202);
INSERT INTO Treatment (Patient, Doctor)
VALUES (103, 203);

-- Insert data into Drug table
INSERT INTO Drug (Company, TradeName, Formula)
VALUES ('Pfizer', 'PainRelief', 'C8H9NO2');
INSERT INTO Drug (Company, TradeName, Formula)
VALUES ('Emcure Pharma', 'ColdCure', 'C10H14N2');
INSERT INTO Drug (Company, TradeName, Formula)
VALUES ('Aditya Birla Pharma', 'AllergyFix', 'C16H19NO3');

-- Insert data into Contract table
INSERT INTO Contract (Pharma_company, Pharmacy, Start_date, End_date, Content, Supervisor)
VALUES ('Pfizer', 'NOVAHealthPlus', TO_DATE('01-01-2025', 'DD-MM-YYYY'), TO_DATE('31-12-2025', 'DD-MM-YYYY'), 'Supply Agreement', 'Ram Chandra');
INSERT INTO Contract (Pharma_company, Pharmacy, Start_date, End_date, Content, Supervisor)
VALUES ('Emcure Pharma', 'NOVAMediStore', TO_DATE('01-02-2025', 'DD-MM-YYYY'), TO_DATE('30-11-2025', 'DD-MM-YYYY'), 'Exclusive Deal', 'Tejas Kumar');
INSERT INTO Contract (Pharma_company, Pharmacy, Start_date, End_date, Content, Supervisor)
VALUES ('Aditya Birla Pharma', 'NOVAWellnessPharma', TO_DATE('01-03-2025', 'DD-MM-YYYY'), TO_DATE('31-10-2025', 'DD-MM-YYYY'), 'Distribution Contract', 'Lalu Yadav');

-- Insert data into Pharmacy_Sales table
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price)
VALUES ('Pfizer', 'PainRelief', 'NOVAHealthPlus', 500);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price)
VALUES ('Emcure Pharma', 'ColdCure', 'NOVAMediStore', 300);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price)
VALUES ('Aditya Birla Pharma', 'AllergyFix', 'NOVAWellnessPharma', 400);

-- Insert data into Prescription table
INSERT INTO Prescription (Patient, Date_, Doctor)
VALUES (101, TO_DATE('19-04-2025', 'DD-MM-YYYY'), 201);
INSERT INTO Prescription (Patient, Date_, Doctor)
VALUES (102, TO_DATE('18-04-2025', 'DD-MM-YYYY'), 202);
INSERT INTO Prescription (Patient, Date_, Doctor)
VALUES (103, TO_DATE('17-04-2025', 'DD-MM-YYYY'), 203);

-- Insert data into Prescription_Drug table
INSERT INTO Prescription_Drug (Patient, Date_, Company, TradeName, City)
VALUES (101, TO_DATE('19-04-2025', 'DD-MM-YYYY'), 'Pfizer', 'PainRelief', 'Mumbai');
INSERT INTO Prescription_Drug (Patient, Date_, Company, TradeName, City)
VALUES (102, TO_DATE('18-04-2025', 'DD-MM-YYYY'), 'Emcure Pharma', 'ColdCure', 'Pune');
INSERT INTO Prescription_Drug (Patient, Date_, Company, TradeName, City)
VALUES (103, TO_DATE('17-04-2025', 'DD-MM-YYYY'), 'Aditya Birla Pharma', 'AllergyFix', 'Banglore');
