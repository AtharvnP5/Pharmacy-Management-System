-- Insert data into Doctor table 
INSERT INTO Doctor (AadharID, Name, Specialty, Years_of_Experience)
VALUES (204, 'Dr. Reddy', 'Cardiology', 12);
INSERT INTO Doctor (AadharID, Name, Specialty, Years_of_Experience)
VALUES (205, 'Dr. Nair', 'Dermatology', 8);
INSERT INTO Doctor (AadharID, Name, Specialty, Years_of_Experience)
VALUES (206, 'Dr. Mehra', 'Pediatrics', 18);
INSERT INTO Doctor (AadharID, Name, Specialty, Years_of_Experience)
VALUES (207, 'Dr. Patel', 'Oncology', 22);
INSERT INTO Doctor (AadharID, Name, Specialty, Years_of_Experience)
VALUES (208, 'Dr. Singh', 'Gastroenterology', 14);

-- Insert data into Patient table 
INSERT INTO Patient (AadharID, Name, Address, Age, Primary_physician)
VALUES (105, 'Priya Sharma', '45 Rose Apartments', 31, 204);
INSERT INTO Patient (AadharID, Name, Address, Age, Primary_physician)
VALUES (106, 'Rahul Verma', '72 Lotus Villas', 25, 205);
INSERT INTO Patient (AadharID, Name, Address, Age, Primary_physician)
VALUES (107, 'Anika Kapoor', '10 MG Road', 40, 204);
INSERT INTO Patient (AadharID, Name, Address, Age, Primary_physician)
VALUES (108, 'Arjun Singh', '22 Park Street', 62, 202);
INSERT INTO Patient (AadharID, Name, Address, Age, Primary_physician)
VALUES (109, 'Diya Patel', '5 Lake Road', 18, 203);
INSERT INTO Patient (AadharID, Name, Address, Age, Primary_physician)
VALUES (110, 'Sameer Khan', 'B-12 Hill View', 45, 206);
INSERT INTO Patient (AadharID, Name, Address, Age, Primary_physician)
VALUES (111, 'Neha Reddy', '9th Cross, 6th Main', 28, 207);
INSERT INTO Patient (AadharID, Name, Address, Age, Primary_physician)
VALUES (112, 'Vikram Joshi', 'Sector 5, House 23', 50, 208);
INSERT INTO Patient (AadharID, Name, Address, Age, Primary_physician)
VALUES (113, 'Sanya Iyer', 'Flat 302, Prestige Apts', 33, 206);
INSERT INTO Patient (AadharID, Name, Address, Age, Primary_physician)
VALUES (114, 'Manish Gupta', 'J-14 Green Park', 58, 207);

-- Insert data into Pharma_company table
INSERT INTO Pharma_company (Name, Phone_number)
VALUES ('Sun Pharma', '111-222-3333');
INSERT INTO Pharma_company (Name, Phone_number)
VALUES ('Cipla', '444-555-6666');
INSERT INTO Pharma_company (Name, Phone_number)
VALUES ('AstraZeneca', '777-888-9999');
INSERT INTO Pharma_company (Name, Phone_number)
VALUES ('Novartis', '222-333-4444');
INSERT INTO Pharma_company (Name, Phone_number)
VALUES ('Sanofi', '555-666-7777');

-- Insert data into Pharmacy table
INSERT INTO Pharmacy (Name, Phone_number, Address)
VALUES ('CityMeds', '777-888-9999', 'Andheri Mumbai');
INSERT INTO Pharmacy (Name, Phone_number, Address)
VALUES ('CarePlus Pharmacy', '101-202-3030', 'Kondapur Hyderabad');
INSERT INTO Pharmacy (Name, Phone_number, Address)
VALUES ('Apollo Pharmacy', '909-808-7070', 'Indiranagar Bangalore');
INSERT INTO Pharmacy (Name, Phone_number, Address)
VALUES ('MedPlus', '808-909-7070', 'Gachibowli Hyderabad');
INSERT INTO Pharmacy (Name, Phone_number, Address)
VALUES ('Wellness Store', '707-808-9090', 'Banjara Hills Hyderabad');



-- Insert data into Drug table  (Ensure Drugs exist before referencing them)
INSERT INTO Drug (Company, TradeName, Formula)
VALUES ('Sun Pharma', 'Azythral', 'C38H72N2O12');
INSERT INTO Drug (Company, TradeName, Formula)
VALUES ('Cipla', 'Atorva', 'C33H35FN2O5');
INSERT INTO Drug (Company, TradeName, Formula)
VALUES ('Pfizer', 'Brufen', 'C13H18O2');
INSERT INTO Drug (Company, TradeName, Formula)
VALUES ('Emcure Pharma', 'Cetirizine', 'C21H25ClN2O3');
INSERT INTO Drug (Company, TradeName, Formula)
VALUES ('AstraZeneca', 'Crestor', 'C24H35FN2O4S');
INSERT INTO Drug (Company, TradeName, Formula)
VALUES ('Novartis', 'Diovan', 'C24H29N5O3');
INSERT INTO Drug (Company, TradeName, Formula)
VALUES ('Sanofi', 'Lantus', 'C267H404N72O78S6'); 
INSERT INTO Drug (Company, TradeName, Formula)
VALUES ('Sun Pharma', 'Rosuvastatin', 'C22H28FN3O6S');
INSERT INTO Drug (Company, TradeName, Formula)
VALUES ('Cipla', 'Escitalopram', 'C20H21ClFN2O');
INSERT INTO Drug (Company, TradeName, Formula)
VALUES ('Pfizer', 'Lyrica', 'C9H17NO2');
INSERT INTO Drug (Company, TradeName, Formula)
VALUES ('Emcure Pharma', 'Levocetirizine', 'C21H25ClN2O3');
INSERT INTO Drug (Company, TradeName, Formula)
VALUES ('AstraZeneca', 'Symbicort', 'C25H32O7 + C29H39ClFNO6');
INSERT INTO Drug (Company, TradeName, Formula)
VALUES ('Novartis', 'Gleevec', 'C29H31N7O7S');
INSERT INTO Drug (Company, TradeName, Formula)
VALUES ('Sanofi', 'Apidra', 'C90H130N26O21S6'); 
INSERT INTO Drug (Company, TradeName, Formula)
VALUES ('Sun Pharma', 'Voriconazole', 'C16H14F3N5O');


-- Insert data into Contract table
INSERT INTO Contract (Pharma_company, Pharmacy, Start_date, End_date, Content, Supervisor)
VALUES ('Sun Pharma', 'CityMeds', TO_DATE('15-02-2025', 'DD-MM-YYYY'), TO_DATE('15-02-2026', 'DD-MM-YYYY'), 'General Supply', 'Suresh Raina');
INSERT INTO Contract (Pharma_company, Pharmacy, Start_date, End_date, Content, Supervisor)
VALUES ('Cipla', 'CarePlus Pharmacy', TO_DATE('20-03-2025', 'DD-MM-YYYY'), TO_DATE('20-03-2026', 'DD-MM-YYYY'), 'Discount Agreement', 'Pooja Hegde');
INSERT INTO Contract (Pharma_company, Pharmacy, Start_date, End_date, Content, Supervisor)
VALUES ('Pfizer', 'CityMeds', TO_DATE('01-04-2025', 'DD-MM-YYYY'), TO_DATE('31-03-2026', 'DD-MM-YYYY'), 'Distribution Rights', 'Virat Kohli');
INSERT INTO Contract (Pharma_company, Pharmacy, Start_date, End_date, Content, Supervisor)
VALUES ('Cipla', 'Apollo Pharmacy', TO_DATE('10-04-2025', 'DD-MM-YYYY'), TO_DATE('09-04-2026', 'DD-MM-YYYY'), 'Exclusive Sales', 'Rohit Sharma');
INSERT INTO Contract (Pharma_company, Pharmacy, Start_date, End_date, Content, Supervisor)
VALUES ('Sun Pharma', 'MedPlus', TO_DATE('01-05-2025', 'DD-MM-YYYY'), TO_DATE('30-04-2026', 'DD-MM-YYYY'), 'Supply Chain', 'David Warner');
INSERT INTO Contract (Pharma_company, Pharmacy, Start_date, End_date, Content, Supervisor)
VALUES ('AstraZeneca', 'Wellness Store', TO_DATE('15-05-2025', 'DD-MM-YYYY'), TO_DATE('14-05-2026', 'DD-MM-YYYY'), 'Retail Sales', 'Kane Williamson');
INSERT INTO Contract (Pharma_company, Pharmacy, Start_date, End_date, Content, Supervisor)
VALUES ('Novartis', 'CityMeds', TO_DATE('01-06-2025', 'DD-MM-YYYY'), TO_DATE('31-05-2026', 'DD-MM-YYYY'), 'General Supply', 'Steve Smith');
INSERT INTO Contract (Pharma_company, Pharmacy, Start_date, End_date, Content, Supervisor)
VALUES ('Sanofi', 'CarePlus Pharmacy', TO_DATE('15-06-2025', 'DD-MM-YYYY'), TO_DATE('14-06-2026', 'DD-MM-YYYY'), 'Discount Agreement', 'Joe Root');
INSERT INTO Contract (Pharma_company, Pharmacy, Start_date, End_date, Content, Supervisor)
VALUES ('Sun Pharma', 'Apollo Pharmacy', TO_DATE('01-07-2025', 'DD-MM-YYYY'), TO_DATE('30-06-2026', 'DD-MM-YYYY'), 'Distribution Rights', 'Jasprit Bumrah');
INSERT INTO Contract (Pharma_company, Pharmacy, Start_date, End_date, Content, Supervisor)
VALUES ('Cipla', 'MedPlus', TO_DATE('15-07-2025', 'DD-MM-YYYY'), TO_DATE('14-07-2026', 'DD-MM-YYYY'), 'Exclusive Sales', 'Babar Azam');


-- Insert data into Pharmacy_Sales table (Ensure Pharmacy_Sales entries are valid)
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Sun Pharma', 'Azythral', 'CityMeds', 250);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Cipla', 'Atorva', 'CarePlus Pharmacy', 480);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Emcure Pharma', 'Cetirizine', 'Apollo Pharmacy', 120);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('AstraZeneca', 'Crestor', 'MedPlus', 550);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Novartis', 'Diovan', 'Wellness Store', 600);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Sanofi', 'Lantus', 'CityMeds', 1200);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Sun Pharma', 'Rosuvastatin', 'CarePlus Pharmacy', 520);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Cipla', 'Escitalopram', 'Apollo Pharmacy', 300);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Pfizer', 'Lyrica', 'MedPlus', 700);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Emcure Pharma', 'Levocetirizine', 'Wellness Store', 130);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('AstraZeneca', 'Symbicort', 'CityMeds', 950);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Novartis', 'Gleevec', 'CarePlus Pharmacy', 2500);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Sanofi', 'Apidra', 'Apollo Pharmacy', 850);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Sun Pharma', 'Azythral', 'MedPlus', 260);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Cipla', 'Atorva', 'Wellness Store', 490);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Pfizer', 'Brufen', 'CityMeds', 65);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Emcure Pharma', 'Cetirizine', 'CarePlus Pharmacy', 125);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('AstraZeneca', 'Crestor', 'Apollo Pharmacy', 560);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Novartis', 'Diovan', 'MedPlus', 610);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Sanofi', 'Lantus', 'Wellness Store', 1250);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Sun Pharma', 'Rosuvastatin', 'CityMeds', 530);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Cipla', 'Escitalopram', 'CarePlus Pharmacy', 310);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Pfizer', 'Lyrica', 'Apollo Pharmacy', 710);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Emcure Pharma', 'Levocetirizine', 'MedPlus', 135);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('AstraZeneca', 'Symbicort', 'Wellness Store', 960);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Novartis', 'Gleevec', 'CityMeds', 2550);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Sanofi', 'Apidra', 'CarePlus Pharmacy', 860);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Sun Pharma', 'Azythral', 'Apollo Pharmacy', 270);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Cipla', 'Atorva', 'MedPlus', 500);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Pfizer', 'Brufen', 'Wellness Store', 70);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Emcure Pharma', 'Cetirizine', 'CityMeds', 130);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('AstraZeneca', 'Crestor', 'CarePlus Pharmacy', 570);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Novartis', 'Diovan', 'Apollo Pharmacy', 620);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Sanofi', 'Lantus', 'MedPlus', 1300);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Sun Pharma', 'Rosuvastatin', 'Wellness Store', 540);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Cipla', 'Escitalopram', 'CityMeds', 320);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Pfizer', 'Lyrica', 'CarePlus Pharmacy', 720);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Emcure Pharma', 'Levocetirizine', 'Apollo Pharmacy', 140);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('AstraZeneca', 'Symbicort', 'MedPlus', 970);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Novartis', 'Gleevec', 'Wellness Store', 2600);
INSERT INTO Pharmacy_Sales (Company, TradeName, Pharmacy, Price) VALUES ('Sanofi', 'Apidra', 'CityMeds', 870);



-- Insert data into Prescription table  (Ensure Prescriptions exist before referencing them)
INSERT INTO Prescription (Patient, Date_, Doctor)
VALUES (104, TO_DATE('22-04-2025', 'DD-MM-YYYY'), 201);
INSERT INTO Prescription (Patient, Date_, Doctor)
VALUES (105, TO_DATE('21-04-2025', 'DD-MM-YYYY'), 204);
INSERT INTO Prescription (Patient, Date_, Doctor)
VALUES (106, TO_DATE('20-04-2025', 'DD-MM-YYYY'), 205);
INSERT INTO Prescription (Patient, Date_, Doctor)
VALUES (107, TO_DATE('19-04-2025', 'DD-MM-YYYY'), 201);
INSERT INTO Prescription (Patient, Date_, Doctor)
VALUES (108, TO_DATE('18-04-2025', 'DD-MM-YYYY'), 202);
INSERT INTO Prescription (Patient, Date_, Doctor)
VALUES (109, TO_DATE('17-04-2025', 'DD-MM-YYYY'), 203);
INSERT INTO Prescription (Patient, Date_, Doctor)
VALUES (110, TO_DATE('23-04-2025', 'DD-MM-YYYY'), 206);
INSERT INTO Prescription (Patient, Date_, Doctor)
VALUES (111, TO_DATE('24-04-2025', 'DD-MM-YYYY'), 207);
INSERT INTO Prescription (Patient, Date_, Doctor)
VALUES (112, TO_DATE('25-04-2025', 'DD-MM-YYYY'), 208);
INSERT INTO Prescription (Patient, Date_, Doctor)
VALUES (113, TO_DATE('26-04-2025', 'DD-MM-YYYY'), 206);
INSERT INTO Prescription (Patient, Date_, Doctor)
VALUES (114, TO_DATE('27-04-2025', 'DD-MM-YYYY'), 207);


-- Insert data into Treatment table
INSERT INTO Treatment (Patient, Doctor)
VALUES (104, 201);
INSERT INTO Treatment (Patient, Doctor)
VALUES (105, 204);
INSERT INTO Treatment (Patient, Doctor)
VALUES (106, 205);
INSERT INTO Treatment (Patient, Doctor)
VALUES (107, 201);
INSERT INTO Treatment (Patient, Doctor)
VALUES (108, 202);
INSERT INTO Treatment (Patient, Doctor)
VALUES (109, 203);
INSERT INTO Treatment (Patient, Doctor)
VALUES (110, 206);
INSERT INTO Treatment (Patient, Doctor)
VALUES (111, 207);
INSERT INTO Treatment (Patient, Doctor)
VALUES (112, 208);
INSERT INTO Treatment (Patient, Doctor)
VALUES (113, 206);
INSERT INTO Treatment (Patient, Doctor)
VALUES (114, 207);

-- Insert data into Prescription_Drug table (Ensure Prescription_Drug entries are valid)
INSERT INTO Prescription_Drug (Patient, Date_, Company, TradeName, City) VALUES (104, TO_DATE('22-04-2025', 'DD-MM-YYYY'), 'Pfizer', 'PainRelief', 'Mumbai');
INSERT INTO Prescription_Drug (Patient, Date_, Company, TradeName, City) VALUES (105, TO_DATE('21-04-2025', 'DD-MM-YYYY'), 'Sun Pharma', 'Azythral', 'Hyderabad');
INSERT INTO Prescription_Drug (Patient, Date_, Company, TradeName, City) VALUES (106, TO_DATE('20-04-2025', 'DD-MM-YYYY'), 'Cipla', 'Atorva', 'Banglore');
INSERT INTO Prescription_Drug (Patient, Date_, Company, TradeName, City) VALUES (107, TO_DATE('19-04-2025', 'DD-MM-YYYY'), 'Emcure Pharma', 'Cetirizine', 'Mumbai');
INSERT INTO Prescription_Drug (Patient, Date_, Company, TradeName, City) VALUES (108, TO_DATE('18-04-2025', 'DD-MM-YYYY'), 'AstraZeneca', 'Crestor', 'Pune');
INSERT INTO Prescription_Drug (Patient, Date_, Company, TradeName, City) VALUES (109, TO_DATE('17-04-2025', 'DD-MM-YYYY'), 'Novartis', 'Diovan', 'Banglore');
INSERT INTO Prescription_Drug (Patient, Date_, Company, TradeName, City) VALUES (110, TO_DATE('23-04-2025', 'DD-MM-YYYY'), 'Sanofi', 'Lantus', 'Hyderabad');
INSERT INTO Prescription_Drug (Patient, Date_, Company, TradeName, City) VALUES (111, TO_DATE('24-04-2025', 'DD-MM-YYYY'), 'Sun Pharma', 'Rosuvastatin', 'Mumbai');
INSERT INTO Prescription_Drug (Patient, Date_, Company, TradeName, City) VALUES (112, TO_DATE('25-04-2025', 'DD-MM-YYYY'), 'Cipla', 'Escitalopram', 'Hyderabad');
INSERT INTO Prescription_Drug (Patient, Date_, Company, TradeName, City) VALUES (113, TO_DATE('26-04-2025', 'DD-MM-YYYY'), 'Pfizer', 'Lyrica', 'Banglore');
