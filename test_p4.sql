-- Test case 1: Existing Company with drugs
DBMS_OUTPUT.PUT_LINE('--- Testing Company: Pfizer ---');
EXEC GetDrugsByCompany('Pfizer');

-- Test case 2: Non-existent Company
DBMS_OUTPUT.PUT_LINE('--- Testing Company: NonExistentCompany ---');
EXEC GetDrugsByCompany('NonExistentCompany');

