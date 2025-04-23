CREATE OR REPLACE PROCEDURE GetPatientsByDoctor (
    DoctorID IN INT
)
IS
BEGIN
    -- Retrieve and display the list of patients for the given doctor
    FOR patient_record IN (
        SELECT 
            P.AadharID AS PatientID,
            P.Name AS PatientName,
            P.Age AS PatientAge,
            P.Address AS PatientAddress
        FROM 
            Patient P
        JOIN 
            Treatment T ON P.AadharID = T.Patient
        WHERE 
            T.Doctor = DoctorID
    )
    LOOP
        -- Print each patient's details
        DBMS_OUTPUT.PUT_LINE('Patient ID: ' || patient_record.PatientID);
        DBMS_OUTPUT.PUT_LINE('Name: ' || patient_record.PatientName);
        DBMS_OUTPUT.PUT_LINE('Age: ' || patient_record.PatientAge);
        DBMS_OUTPUT.PUT_LINE('Address: ' || patient_record.PatientAddress);
        DBMS_OUTPUT.PUT_LINE('-----------------------------');
    END LOOP;
END;
/

