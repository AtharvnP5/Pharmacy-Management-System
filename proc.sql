--patient

CREATE OR REPLACE PROCEDURE Add_Patient (
  p_aadhar   NUMBER,
  p_name     VARCHAR2,
  p_address  VARCHAR2,
  p_age      NUMBER,
  p_phys     VARCHAR2
) AS
BEGIN
  INSERT INTO Patient (AadharID, Name, Address, Age, Primary_physician)
  VALUES (p_aadhar, p_name, p_address, p_age, p_phys);
END;
/

CREATE OR REPLACE PROCEDURE Update_Patient (
  p_aadhar    NUMBER,
  new_address VARCHAR2,
  new_age     NUMBER,
  new_phys    VARCHAR2
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
  p_aadhar NUMBER
) AS
BEGIN
  DELETE FROM Patient
  WHERE AadharID = p_aadhar;
END;
/

----------------------------------------------------------------------------------------------------------

--pharma company 

CREATE OR REPLACE PROCEDURE Add_Company (
  c_name         VARCHAR2,
  c_phone_number VARCHAR2
) AS
BEGIN
  INSERT INTO Pharma_company (Name, Phone_number)
  VALUES (c_name, c_phone_number);
END;
/


CREATE OR REPLACE PROCEDURE Update_Company_Phone (
  c_name         VARCHAR2,
  new_phone      VARCHAR2
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

--pharmacies

CREATE OR REPLACE PROCEDURE Add_Pharmacy (
  ph_name     VARCHAR2,
  ph_phone    VARCHAR2,
  ph_address  VARCHAR2
) AS
BEGIN
  INSERT INTO Pharmacy (Name, Phone_number, Address)
  VALUES (ph_name, ph_phone, ph_address);
END;
/

CREATE OR REPLACE PROCEDURE Update_Pharmacy (
  ph_name      VARCHAR2,
  new_phone    VARCHAR2,
  new_address  VARCHAR2
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

--doctor 

CREATE OR REPLACE PROCEDURE Add_Doctor (
  p_AadharID           INT,
  p_Name               VARCHAR2,
  p_Specialty          VARCHAR2,
  p_Years_of_Exp       INT
) AS
BEGIN
  INSERT INTO Doctor (AadharID, Name, Specialty, Years_of_Experience)
  VALUES (p_AadharID, p_Name, p_Specialty, p_Years_of_Exp);
END;
/


CREATE OR REPLACE PROCEDURE Update_Doctor (
  p_AadharID           INT,
  p_Name               VARCHAR2,
  p_Specialty          VARCHAR2,
  p_Years_of_Exp       INT
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

--prescription

CREATE OR REPLACE PROCEDURE Add_Prescription (
  p_Patient INT,
  p_Date    DATE,
  p_Doctor  INT
) AS
BEGIN
  INSERT INTO Prescription (Patient, Date, Doctor)
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
  WHERE Patient = p_Patient AND Date = p_Date;
END;
/

CREATE OR REPLACE PROCEDURE Delete_Prescription (
  p_Patient INT,
  p_Date    DATE
) AS
BEGIN
  DELETE FROM Prescription
  WHERE Patient = p_Patient AND Date = p_Date;
END;
/


------------------------------------------------------------------------------------

--contract 

CREATE OR REPLACE PROCEDURE Add_Contract (
  p_Pharma_company VARCHAR2,
  p_Pharmacy       VARCHAR2,
  p_Start_date     DATE,
  p_End_date       DATE,
  p_Content        VARCHAR2,
  p_Supervisor     VARCHAR2
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
  p_Pharmacy       VARCHAR2,
  p_Start_date     DATE,
  p_End_date       DATE,
  p_Content        VARCHAR2,
  p_Supervisor     VARCHAR2
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
  p_Pharmacy       VARCHAR2
) AS
BEGIN
  DELETE FROM Contract
  WHERE Pharma_company = p_Pharma_company AND Pharmacy = p_Pharmacy;
END;
/


-------------------------------------------------------------------------------------------------

--drugs

CREATE OR REPLACE PROCEDURE Add_Drug (
  p_Company   VARCHAR2,
  p_TradeName VARCHAR2,
  p_Formula   VARCHAR2
) AS
BEGIN
  INSERT INTO Drug (Company, TradeName, Formula)
  VALUES (p_Company, p_TradeName, p_Formula);
END;
/


CREATE OR REPLACE PROCEDURE Update_Drug (
  p_Company   VARCHAR2,
  p_TradeName VARCHAR2,
  p_Formula   VARCHAR2
) AS
BEGIN
  UPDATE Drug
  SET Formula = p_Formula
  WHERE Company = p_Company AND TradeName = p_TradeName;
END;
/

CREATE OR REPLACE PROCEDURE Delete_Drug (
  p_Company   VARCHAR2,
  p_TradeName VARCHAR2
) AS
BEGIN
  DELETE FROM Drug
  WHERE Company = p_Company AND TradeName = p_TradeName;
END;
/

---------------------------------------------------------------------------------------------------