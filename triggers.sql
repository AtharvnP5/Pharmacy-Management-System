
--Prevent duplicate prescriptions by same doctor to same patient on same date

CREATE OR REPLACE TRIGGER PreventDuplicatePrescriptionsOnInsert
BEFORE INSERT ON Prescription
FOR EACH ROW
DECLARE
    v_count INT;
BEGIN
    -- Check if a prescription already exists for the same patient, doctor, and date
    SELECT COUNT(*)
    INTO v_count
    FROM Prescription
    WHERE Patient = :NEW.Patient
      AND Doctor = :NEW.Doctor
      AND Date_ = :NEW.Date_;

    -- If a duplicate is found, raise an error
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Duplicate prescription: A prescription already exists for this patient, doctor, and date.');
    END IF;
END;
/

-- filepath: c:\Users\athar\Documents\BITS\2-2\dbms\proj\v1\Pharmacy-Management-System\triggers.sql

CREATE OR REPLACE TRIGGER PreventDuplicatePrescriptionsOnUpdate
BEFORE UPDATE ON Prescription
FOR EACH ROW
DECLARE
    v_count INT;
BEGIN
    -- Check if a prescription already exists for the same patient, doctor, and date
    SELECT COUNT(*)
    INTO v_count
    FROM Prescription
    WHERE Patient = :NEW.Patient
      AND Doctor = :NEW.Doctor
      AND Date_ = :NEW.Date_
      AND ROWID != :OLD.ROWID; -- Exclude the current row being updated

    -- If a duplicate is found, raise an error
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Duplicate prescription: A prescription already exists for this patient, doctor, and date.');
    END IF;
END;
/

--Ensure every doctor always has at least one patient

CREATE OR REPLACE TRIGGER EnsureDoctorHasOnePatient
BEFORE DELETE ON Patient
FOR EACH ROW
DECLARE
    v_patient_count INT;
BEGIN
    -- Count the number of patients associated with the doctor of the patient being deleted
    SELECT COUNT(*)
    INTO v_patient_count
    FROM Patient
    WHERE Primary_physician = :OLD.Primary_physician;

    -- If the doctor has only one patient, raise an error
    IF v_patient_count <= 1 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Cannot delete this patient: The doctor must have at least one patient.');
    END IF;
END;
/

--Ensure each pharmacy sells at least 10 drugs


CREATE OR REPLACE TRIGGER EnsurePharmacySells10Drugs
BEFORE DELETE ON Pharmacy_Sales
FOR EACH ROW
DECLARE
    v_drug_count INT;
BEGIN
    -- Count the number of drugs sold by the pharmacy
    SELECT COUNT(*)
    INTO v_drug_count
    FROM Pharmacy_Sales
    WHERE Pharmacy = :OLD.Pharmacy;

    -- If the pharmacy has only 10 drugs, prevent the deletion
    IF v_drug_count <= 10 THEN
        RAISE_APPLICATION_ERROR(-20004, 'Cannot delete this drug: Each pharmacy must sell at least 10 drugs.');
    END IF;
END;
/


