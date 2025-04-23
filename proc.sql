-- Patient Procedures
CREATE OR REPLACE PROCEDURE Add_Patient (
    p_aadhar    INT,
    p_name      VARCHAR2,
    p_address   VARCHAR2,
    p_age       INT,
    p_phys      INT
) AS
BEGIN
    INSERT INTO Patient (AadharID, Name, Address, Age, Primary_physician)
    VALUES (p_aadhar, p_name, p_address, p_age, p_phys);
END;
/

CREATE OR REPLACE PROCEDURE Update_Patient (
    p_aadhar    INT,
    new_address VARCHAR2,
    new_age     NUMBER,
    new_phys    INT
) AS
BEGIN
    UPDATE Patient
    SET Address = new_address,
        Age = new_age,
        Primary_physician = new_phys
    WHERE AadharID = p_aadhar;
END;
/

CREATE OR REPLACE PROCEDURE Delete_Patient (
    p_aadhar INT
) AS
BEGIN
    DELETE FROM Patient
    WHERE AadharID = p_aadhar;
END;
/

----------------------------------------------------------------------------------------------------------
-- Pharma Company Procedures
CREATE OR REPLACE PROCEDURE Add_Company (
    c_name          VARCHAR2,
    c_phone_number VARCHAR2
) AS
BEGIN
    INSERT INTO Pharma_company (Name, Phone_number)
    VALUES (c_name, c_phone_number);
END;
/

CREATE OR REPLACE PROCEDURE Update_Company_Phone (
    c_name          VARCHAR2,
    new_phone       VARCHAR2
) AS
BEGIN
    UPDATE Pharma_company
    SET Phone_number = new_phone
    WHERE Name = c_name;
END;
/

CREATE OR REPLACE PROCEDURE Delete_Company (
    c_name VARCHAR2
) AS
BEGIN
    DELETE FROM Pharma_company
    WHERE Name = c_name;
END;
/

------------------------------------------------------------------------------------------------------------------
-- Pharmacy Procedures
CREATE OR REPLACE PROCEDURE Add_Pharmacy (
    ph_name    VARCHAR2,
    ph_phone   VARCHAR2,
    ph_address VARCHAR2
) AS
BEGIN
    INSERT INTO Pharmacy (Name, Phone_number, Address)
    VALUES (ph_name, ph_phone, ph_address);
END;
/

CREATE OR REPLACE PROCEDURE Update_Pharmacy (
    ph_name     VARCHAR2,
    new_phone   VARCHAR2,
    new_address VARCHAR2
) AS
BEGIN
    UPDATE Pharmacy
    SET Phone_number = new_phone,
        Address = new_address
    WHERE Name = ph_name;
END;
/

CREATE OR REPLACE PROCEDURE Delete_Pharmacy (
    ph_name VARCHAR2
) AS
BEGIN
    DELETE FROM Pharmacy
    WHERE Name = ph_name;
END;
/
---------------------------------------------------------------------------------------------
-- Doctor Procedures
CREATE OR REPLACE PROCEDURE Add_Doctor (
    p_AadharID          INT,
    p_Name            VARCHAR2,
    p_Specialty       VARCHAR2,
    p_Years_of_Exp    INT
) AS
BEGIN
    INSERT INTO Doctor (AadharID, Name, Specialty, Years_of_Experience)
    VALUES (p_AadharID, p_Name, p_Specialty, p_Years_of_Exp);
END;
/

CREATE OR REPLACE PROCEDURE Update_Doctor (
    p_AadharID          INT,
    p_Name            VARCHAR2,
    p_Specialty       VARCHAR2,
    p_Years_of_Exp    INT
) AS
BEGIN
    UPDATE Doctor
    SET Name = p_Name,
        Specialty = p_Specialty,
        Years_of_Experience = p_Years_of_Exp
    WHERE AadharID = p_AadharID;
END;
/

CREATE OR REPLACE PROCEDURE Delete_Doctor (
    p_AadharID INT
) AS
BEGIN
    DELETE FROM Doctor
    WHERE AadharID = p_AadharID;
END;
/
-------------------------------------------------------------------------------------------------------------
-- Prescription Procedures
CREATE OR REPLACE PROCEDURE Add_Prescription (
    p_Patient INT,
    p_Date    DATE,
    p_Doctor  INT
) AS
BEGIN
    INSERT INTO Prescription (Patient, Date_, Doctor)
    VALUES (p_Patient, p_Date, p_Doctor);
END;
/

CREATE OR REPLACE PROCEDURE Update_Prescription (
    p_Patient INT,
    p_Date    DATE,
    p_Doctor  INT
) AS
BEGIN
    UPDATE Prescription
    SET Doctor = p_Doctor
    WHERE Patient = p_Patient AND Date_ = p_Date;
END;
/

CREATE OR REPLACE PROCEDURE Delete_Prescription (
    p_Patient INT,
    p_Date    DATE
) AS
BEGIN
    DELETE FROM Prescription
    WHERE Patient = p_Patient AND Date_ = p_Date;
END;
/
------------------------------------------------------------------------------------
-- Contract Procedures
CREATE OR REPLACE PROCEDURE Add_Contract (
    p_Pharma_company VARCHAR2,
    p_Pharmacy        VARCHAR2,
    p_Start_date      DATE,
    p_End_date        DATE,
    p_Content         VARCHAR2,
    p_Supervisor      VARCHAR2
) AS
BEGIN
    INSERT INTO Contract (
        Pharma_company, Pharmacy, Start_date, End_date, Content, Supervisor
    )
    VALUES (
        p_Pharma_company, p_Pharmacy, p_Start_date, p_End_date, p_Content, p_Supervisor
    );
END;
/

CREATE OR REPLACE PROCEDURE Update_Contract (
    p_Pharma_company VARCHAR2,
    p_Pharmacy        VARCHAR2,
    p_Start_date      DATE,
    p_End_date        DATE,
    p_Content         VARCHAR2,
    p_Supervisor      VARCHAR2
) AS
BEGIN
    UPDATE Contract
    SET Start_date = p_Start_date,
        End_date = p_End_date,
        Content = p_Content,
        Supervisor = p_Supervisor
    WHERE Pharma_company = p_Pharma_company AND Pharmacy = p_Pharmacy;
END;
/

CREATE OR REPLACE PROCEDURE Delete_Contract (
    p_Pharma_company VARCHAR2,
    p_Pharmacy        VARCHAR2
) AS
BEGIN
    DELETE FROM Contract
    WHERE Pharma_company = p_Pharma_company AND Pharmacy = p_Pharmacy;
END;
/
-------------------------------------------------------------------------------------------------
-- Drug Procedures
CREATE OR REPLACE PROCEDURE Add_Drug (
    p_Company    VARCHAR2,
    p_TradeName VARCHAR2,
    p_Formula    VARCHAR2
) AS
BEGIN
    INSERT INTO Drug (Company, TradeName, Formula)
    VALUES (p_Company, p_TradeName, p_Formula);
END;
/

CREATE OR REPLACE PROCEDURE Update_Drug (
    p_Company    VARCHAR2,
    p_TradeName VARCHAR2,
    p_Formula    VARCHAR2
) AS
BEGIN
    UPDATE Drug
    SET Formula = p_Formula
    WHERE Company = p_Company AND TradeName = p_TradeName;
END;
/

CREATE OR REPLACE PROCEDURE Delete_Drug (
    p_Company    VARCHAR2,
    p_TradeName VARCHAR2
) AS
BEGIN
    DELETE FROM Drug
    WHERE Company = p_Company AND TradeName = p_TradeName;
END;
/

--------------------------------------------------------------------------------

--Procedure3

CREATE OR REPLACE PROCEDURE Get_Prescription_Details (
  p_Patient INT,
  p_Date    DATE
) AS
  v_Doctor INT;
BEGIN
  SELECT Doctor
  INTO v_Doctor
  FROM Prescription
  WHERE Patient = p_Patient AND Date_ = p_Date;

  DBMS_OUTPUT.PUT_LINE('Prescription Details:');
  DBMS_OUTPUT.PUT_LINE('Patient ID: ' || p_Patient);
  DBMS_OUTPUT.PUT_LINE('Date: ' || TO_CHAR(p_Date, 'DD-MON-YYYY'));
  DBMS_OUTPUT.PUT_LINE('Doctor ID: ' || v_Doctor);

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No prescription found for the given patient and date.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

----------------------------------------------------------------------------------------

--procedure 2


CREATE OR REPLACE PROCEDURE GeneratePatientPrescriptionReport (
    p_patient_aadhar_id IN INT,
    p_start_date IN DATE,
    p_end_date IN DATE
)
AS
    CURSOR prescription_cursor IS
        SELECT
            pr.Date_ AS PrescriptionDate,
            d.Name AS DoctorName,
            pd.Company AS DrugCompany,
            pd.TradeName AS DrugTradeName,
            pd.City AS DispensingPharmacyCity
        FROM
            Prescription pr
        JOIN
            Doctor d ON pr.Doctor = d.AadharID
        JOIN
            Prescription_Drug pd ON pr.Patient = pd.Patient AND pr.Date_ = pd.Date_
        WHERE
            pr.Patient = p_patient_aadhar_id
            AND pr.Date_ BETWEEN p_start_date AND p_end_date
        ORDER BY
            pr.Date_;

    v_patient_name Patient.Name%TYPE;
    v_patient_address Patient.Address%TYPE;
    v_prescription_record prescription_cursor%ROWTYPE;

BEGIN
    SELECT Name, Address
    INTO v_patient_name, v_patient_address
    FROM Patient
    WHERE AadharID = p_patient_aadhar_id;

    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('                  Patient Prescription Report           ');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Patient Aadhar ID: ' || p_patient_aadhar_id);
    DBMS_OUTPUT.PUT_LINE('Patient Name:      ' || v_patient_name);
    DBMS_OUTPUT.PUT_LINE('Patient Address:   ' || v_patient_address);
    DBMS_OUTPUT.PUT_LINE('Report Period:     ' || TO_CHAR(p_start_date, 'YYYY-MM-DD') || ' to ' || TO_CHAR(p_end_date, 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');

    OPEN prescription_cursor;
    LOOP
        FETCH prescription_cursor INTO v_prescription_record;
        EXIT WHEN prescription_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Prescription Date:   ' || TO_CHAR(v_prescription_record.PrescriptionDate, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('Prescribing Doctor:  ' || v_prescription_record.DoctorName);
        DBMS_OUTPUT.PUT_LINE('Drug Company:        ' || v_prescription_record.DrugCompany);
        DBMS_OUTPUT.PUT_LINE('Drug Trade Name:     ' || v_prescription_record.DrugTradeName);
        DBMS_OUTPUT.PUT_LINE('Dispensing City:     ' || v_prescription_record.DispensingPharmacyCity);
        DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    END LOOP;
    CLOSE prescription_cursor;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No patient found with Aadhar ID: ' || p_patient_aadhar_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/

--------------------------------------------------------------------
--procedure6

CREATE OR REPLACE PROCEDURE PrintPharmacyCompanyContacts (
    p_pharmacy_name IN VARCHAR2
)
AS
    CURSOR company_cursor IS
        SELECT DISTINCT
            pc.Name AS CompanyName,
            pc.Phone_number AS CompanyPhone
        FROM
            Pharma_company pc
        JOIN
            Contract c ON pc.Name = c.Pharma_company
        WHERE
            c.Pharmacy = p_pharmacy_name;

    v_pharmacy_name Pharmacy.Name%TYPE;
    v_pharmacy_phone Pharmacy.Phone_number%TYPE;
    v_pharmacy_address Pharmacy.Address%TYPE;
    v_company_record company_cursor%ROWTYPE;
    v_company_found BOOLEAN := FALSE;

BEGIN
    SELECT Name, Phone_number, Address
    INTO v_pharmacy_name, v_pharmacy_phone, v_pharmacy_address
    FROM Pharmacy
    WHERE Name = p_pharmacy_name;

    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('                  Contact Details for Pharmacy: ' || v_pharmacy_name);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Pharmacy Name:      ' || v_pharmacy_name);
    DBMS_OUTPUT.PUT_LINE('Pharmacy Phone:     ' || v_pharmacy_phone);
    DBMS_OUTPUT.PUT_LINE('Pharmacy Address:   ' || v_pharmacy_address);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Associated Pharmaceutical Companies:');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');

    OPEN company_cursor;
    LOOP
        FETCH company_cursor INTO v_company_record;
        EXIT WHEN company_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Company Name:    ' || v_company_record.CompanyName);
        DBMS_OUTPUT.PUT_LINE('Company Phone:   ' || v_company_record.CompanyPhone);
        DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
        v_company_found := TRUE;
    END LOOP;
    CLOSE company_cursor;

    IF NOT v_company_found THEN
        DBMS_OUTPUT.PUT_LINE('No associated pharmaceutical companies found for ' || p_pharmacy_name);
        DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Pharmacy not found with name: ' || p_pharmacy_name);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/

-----------------------------------------------------------------------------------------------
