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
