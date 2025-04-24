BEGIN
-- Test case 1: Existing Doctor with patients
DBMS_OUTPUT.PUT_LINE('--- Testing Doctor ID: 201 (Dr. Venkat) ---');
GetPatientsByDoctor(201);

-- Test case 2: Non-existent Doctor ID
DBMS_OUTPUT.PUT_LINE('--- Testing Doctor ID: 999 (Non-existent) ---');
GetPatientsByDoctor(999);
END;
/