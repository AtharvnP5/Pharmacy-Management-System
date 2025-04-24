--Prevent duplicate prescriptions by same doctor to same patient on same date

CREATE OR REPLACE TRIGGER PreventDuplicatePrescriptions
FOR INSERT OR UPDATE ON Prescription
COMPOUND TRIGGER
    -- Declare a variable to track duplicates
    TYPE PrescriptionKey IS RECORD (
        Patient INT,
        Doctor INT,
        Date_ DATE
    );
    TYPE PrescriptionKeyTable IS TABLE OF PrescriptionKey INDEX BY PLS_INTEGER;
    duplicate_keys PrescriptionKeyTable;
    duplicate_found BOOLEAN := FALSE;

    BEFORE STATEMENT IS
    BEGIN
        -- Initialize the duplicate tracking table
        duplicate_keys := PrescriptionKeyTable();
    END BEFORE STATEMENT;

    BEFORE EACH ROW IS
    BEGIN
        -- Add the current row to the duplicate tracking table
        duplicate_keys(duplicate_keys.COUNT + 1) := PrescriptionKey(
            :NEW.Patient,
            :NEW.Doctor,
            :NEW.Date_
        );
    END BEFORE EACH ROW;

    AFTER STATEMENT IS
    BEGIN
        -- Check for duplicates after all rows are processed
        FOR i IN duplicate_keys.FIRST .. duplicate_keys.LAST LOOP
            DECLARE
                v_count INT;
            BEGIN
                SELECT COUNT(*)
                INTO v_count
                FROM Prescription
                WHERE Patient = duplicate_keys(i).Patient
                  AND Doctor = duplicate_keys(i).Doctor
                  AND Date_ = duplicate_keys(i).Date_;

                -- If a duplicate exists, raise an error
                IF v_count > 1 THEN
                    RAISE_APPLICATION_ERROR(-20001, 'Duplicate prescription: A prescription already exists for this patient, doctor, and date.');
                END IF;
            END;
        END LOOP;
    END AFTER STATEMENT;
END PreventDuplicatePrescriptions;
/


-- filepath: c:\Users\athar\Documents\BITS\2-2\dbms\proj\v1\Pharmacy-Management-System\triggers.sql

--Ensure every doctor always has at least one patient

CREATE OR REPLACE TRIGGER EnsureDoctorHasOnePatient
FOR DELETE ON Patient
COMPOUND TRIGGER
    TYPE DoctorKey IS RECORD (
        Primary_physician INT
    );
    TYPE DoctorKeyTable IS TABLE OF DoctorKey INDEX BY PLS_INTEGER;
    doctor_keys DoctorKeyTable;

    BEFORE STATEMENT IS
    BEGIN
        -- Initialize the doctor tracking table
        doctor_keys := DoctorKeyTable();
    END BEFORE STATEMENT;

    BEFORE EACH ROW IS
    BEGIN
        -- Add the current row's doctor to the tracking table
        doctor_keys(doctor_keys.COUNT + 1) := DoctorKey(
            :OLD.Primary_physician
        );
    END BEFORE EACH ROW;

    AFTER STATEMENT IS
    BEGIN
        -- Check for doctors with no patients after all rows are processed
        FOR i IN doctor_keys.FIRST .. doctor_keys.LAST LOOP
            DECLARE
                v_patient_count INT;
            BEGIN
                SELECT COUNT(*)
                INTO v_patient_count
                FROM Patient
                WHERE Primary_physician = doctor_keys(i).Primary_physician;

                -- If the doctor has no other patients, raise an error
                IF v_patient_count = 0 THEN
                    RAISE_APPLICATION_ERROR(-20003, 'Cannot delete this patient: The doctor must have at least one patient.');
                END IF;
            END;
        END LOOP;
    END AFTER STATEMENT;
END EnsureDoctorHasOnePatient;
/


--Ensure each pharmacy sells at least 10 drugs

CREATE OR REPLACE TRIGGER EnsurePharmacySells10Drugs
FOR DELETE ON Pharmacy_Sales
COMPOUND TRIGGER
    TYPE PharmacyKey IS RECORD (
        Pharmacy INT
    );
    TYPE PharmacyKeyTable IS TABLE OF PharmacyKey INDEX BY PLS_INTEGER;
    pharmacy_keys PharmacyKeyTable;

    BEFORE STATEMENT IS
    BEGIN
        -- Initialize the pharmacy tracking table
        pharmacy_keys := PharmacyKeyTable();
    END BEFORE STATEMENT;

    BEFORE EACH ROW IS
    BEGIN
        -- Add the current row's pharmacy to the tracking table
        pharmacy_keys(pharmacy_keys.COUNT + 1) := PharmacyKey(
            :OLD.Pharmacy
        );
    END BEFORE EACH ROW;

    AFTER STATEMENT IS
    BEGIN
        -- Check for pharmacies with fewer than 10 drugs after all rows are processed
        FOR i IN pharmacy_keys.FIRST .. pharmacy_keys.LAST LOOP
            DECLARE
                v_drug_count INT;
            BEGIN
                SELECT COUNT(*)
                INTO v_drug_count
                FROM Pharmacy_Sales
                WHERE Pharmacy = pharmacy_keys(i).Pharmacy;

                -- If the pharmacy has 10 or fewer drugs, raise an error
                IF v_drug_count < 10 THEN
                    RAISE_APPLICATION_ERROR(-20004, 'Cannot delete this drug: Each pharmacy must sell at least 10 drugs.');
                END IF;
            END;
        END LOOP;
    END AFTER STATEMENT;
END EnsurePharmacySells10Drugs;
/


