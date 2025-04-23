BEGIN
    GeneratePatientPrescriptionReport(
        p_patient_aadhar_id => 101,
        p_start_date => DATE '2025-04-15',
        p_end_date => DATE '2025-04-20'
    );
END;
/