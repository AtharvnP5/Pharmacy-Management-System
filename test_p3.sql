DBMS_OUTPUT.PUT_LINE('--- Testing existing prescription for Patient 101 on 19-APR-2025 ---');
EXEC Get_Prescription_Details(101, TO_DATE('19-04-2025', 'DD-MM-YYYY'));

DBMS_OUTPUT.PUT_LINE('--- Testing non-existent prescription for Patient 101 on 20-APR-2025 ---');
EXEC Get_Prescription_Details(101, TO_DATE('20-04-2025', 'DD-MM-YYYY'));

DBMS_OUTPUT.PUT_LINE('--- Testing non-existent patient 999 on 19-APR-2025 ---');
EXEC Get_Prescription_Details(999, TO_DATE('19-04-2025', 'DD-MM-YYYY'));

DBMS_OUTPUT.PUT_LINE('--- Testing valid patient with potentially problematic date (string) ---');
BEGIN
  Get_Prescription_Details(102, 'INVALID_DATE');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Caught expected error due to invalid date format in EXEC call: ' || SQLERRM);
END;
/