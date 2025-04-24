CREATE OR REPLACE PROCEDURE ShowDoctorData IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Data from Doctor Table:');
    FOR rec IN (SELECT * FROM Doctor) LOOP
        DBMS_OUTPUT.PUT_LINE('AadharID: ' || rec.AadharID || ', Name: ' || rec.Name || 
                             ', Specialty: ' || rec.Specialty || 
                             ', Years_of_Experience: ' || rec.Years_of_Experience);
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE ShowPatientData IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Data from Patient Table:');
    FOR rec IN (SELECT * FROM Patient) LOOP
        DBMS_OUTPUT.PUT_LINE('AadharID: ' || rec.AadharID || ', Name: ' || rec.Name || 
                             ', Address: ' || rec.Address || ', Age: ' || rec.Age || 
                             ', Primary_physician: ' || rec.Primary_physician);
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE ShowPharmaCompanyData IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Data from Pharma_company Table:');
    FOR rec IN (SELECT * FROM Pharma_company) LOOP
        DBMS_OUTPUT.PUT_LINE('Name: ' || rec.Name || ', Phone_number: ' || rec.Phone_number);
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE ShowPharmacyData IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Data from Pharmacy Table:');
    FOR rec IN (SELECT * FROM Pharmacy) LOOP
        DBMS_OUTPUT.PUT_LINE('Name: ' || rec.Name || ', Phone_number: ' || rec.Phone_number || 
                             ', Address: ' || rec.Address);
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE ShowTreatmentData IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Data from Treatment Table:');
    FOR rec IN (SELECT * FROM Treatment) LOOP
        DBMS_OUTPUT.PUT_LINE('Patient: ' || rec.Patient || ', Doctor: ' || rec.Doctor);
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE ShowDrugData IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Data from Drug Table:');
    FOR rec IN (SELECT * FROM Drug) LOOP
        DBMS_OUTPUT.PUT_LINE('Company: ' || rec.Company || ', TradeName: ' || rec.TradeName || 
                             ', Formula: ' || rec.Formula);
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE ShowContractData IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Data from Contract Table:');
    FOR rec IN (SELECT * FROM Contract) LOOP
        DBMS_OUTPUT.PUT_LINE('Pharma_company: ' || rec.Pharma_company || ', Pharmacy: ' || rec.Pharmacy || 
                             ', Start_date: ' || rec.Start_date || ', End_date: ' || rec.End_date || 
                             ', Content: ' || rec.Content || ', Supervisor: ' || rec.Supervisor);
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE ShowPharmacySalesData IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Data from Pharmacy_Sales Table:');
    FOR rec IN (SELECT * FROM Pharmacy_Sales) LOOP
        DBMS_OUTPUT.PUT_LINE('Company: ' || rec.Company || ', TradeName: ' || rec.TradeName || 
                             ', Pharmacy: ' || rec.Pharmacy || ', Price: ' || rec.Price);
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE ShowPrescriptionData IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Data from Prescription Table:');
    FOR rec IN (SELECT * FROM Prescription) LOOP
        DBMS_OUTPUT.PUT_LINE('Patient: ' || rec.Patient || ', Date_: ' || rec.Date_ || 
                             ', Doctor: ' || rec.Doctor);
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE ShowPrescriptionDrugData IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Data from Prescription_Drug Table:');
    FOR rec IN (SELECT * FROM Prescription_Drug) LOOP
        DBMS_OUTPUT.PUT_LINE('Patient: ' || rec.Patient || ', Date_: ' || rec.Date_ || 
                             ', Company: ' || rec.Company || ', TradeName: ' || rec.TradeName || 
                             ', City: ' || rec.City);
    END LOOP;
END;
/



