BEGIN

-- Test case 1: Existing Company with drugs
DBMS_OUTPUT.PUT_LINE('--- Testing Company: Pfizer ---');
 GetDrugsByCompany('Pfizer');

-- Test case 2: Non-existent Company
DBMS_OUTPUT.PUT_LINE('--- Testing Company: NonExistentCompany ---');
 GetDrugsByCompany('NonExistentCompany');

END;
/