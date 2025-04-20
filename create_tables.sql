CREATE TABLE Patient(
    AadharID INT PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Address VARCHAR2(255),
    Age INT NOT NULL,
    Primary_physician INT
);

CREATE TABLE Doctor(
    AadharID INT PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Specialty VARCHAR2(100),
    Years_of_Experience INT
);

ALTER TABLE Patient ADD CONSTRAINT fk_physician
FOREIGN KEY (Primary_physician) REFERENCES Doctor(AadharID);

CREATE TABLE Pharma_company(
    Name VARCHAR2(100) PRIMARY KEY,
    Phone_number VARCHAR2(15) NOT NULL
);

CREATE TABLE Pharmacy(
    Name VARCHAR2(100) PRIMARY KEY,
    Phone_number VARCHAR2(15) NOT NULL,
    Address VARCHAR2(255)
    
);

CREATE TABLE Treatment(
    Patient INT,
    Doctor INT,
    PRIMARY KEY (Patient, Doctor)
);

CREATE TABLE Drug(
    Company VARCHAR2(100),
    TradeName VARCHAR2(100),
    Formula VARCHAR2(100),
    PRIMARY KEY (Company, TradeName)
);

CREATE TABLE Contract(
    Pharma_company VARCHAR2(100),
    Pharmacy VARCHAR2(100),
    Start_date DATE,
    End_date DATE,
    Content VARCHAR2(255),
    Supervisor VARCHAR2(100),
    PRIMARY KEY (Pharma_company, Pharmacy)
);

CREATE TABLE Pharmacy_Sales(
    Company VARCHAR2(100),
    TradeName VARCHAR2(100),
    Pharmacy VARCHAR2(100),
    Price INT,
    PRIMARY KEY (Company, TradeName, Pharmacy)
);

CREATE TABLE Prescription(
    Patient INT,
    Date DATE,
    Doctor INT,
    PRIMARY KEY (Patient, Date)
);

CREATE TABLE Prescription_Drug(
    Patient INT,
    Date DATE,
    Company VARCHAR2(100),
    TradeName VARCHAR2(100),
    City VARCHAR2(100),
    PRIMARY KEY (Patient, Date, Company, TradeName)
);

ALTER TABLE Patient ADD CONSTRAINT fk_physician
FOREIGN KEY (Primary_physician) REFERENCES Doctor(AadharID);

ALTER TABLE Treatment ADD CONSTRAINT fk_patient
FOREIGN KEY (Patient) REFERENCES Patient(AadharID);

ALTER TABLE Treatment ADD CONSTRAINT fk_doctor
FOREIGN KEY (Doctor) REFERENCES Doctor(AadharID);

ALTER TABLE Drug ADD CONSTRAINT fk_company
FOREIGN KEY (Company) REFERENCES Pharma_company(Name);

ALTER TABLE Contract ADD CONSTRAINT fk_pharma_company
FOREIGN KEY (Pharma_company) REFERENCES Pharma_company(Name);

ALTER TABLE Contract ADD CONSTRAINT fk_pharmacy
FOREIGN KEY (Pharmacy) REFERENCES Pharmacy(Name);

ALTER TABLE Pharmacy_Sales ADD CONSTRAINT fk_drug
FOREIGN KEY (Company, TradeName) REFERENCES Drug(Company, TradeName);

ALTER TABLE Pharmacy_Sales ADD CONSTRAINT fk_pharmacy_sales
FOREIGN KEY (Pharmacy) REFERENCES Pharmacy(Name);

ALTER TABLE Prescription ADD CONSTRAINT fk_patient_prescription
FOREIGN KEY (Patient) REFERENCES Patient(AadharID);

ALTER TABLE Prescription ADD CONSTRAINT fk_doctor_prescription
FOREIGN KEY (Doctor) REFERENCES Doctor(AadharID);

ALTER TABLE Prescription_Drug ADD CONSTRAINT fk_prescription
FOREIGN KEY (Patient, Date) REFERENCES Prescription(Patient, Date);

ALTER TABLE Prescription_Drug ADD CONSTRAINT fk_drug_prescription
FOREIGN KEY (Company, TradeName) REFERENCES Drug(Company, TradeName);


