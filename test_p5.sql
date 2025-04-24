BEGIN

-- Test case 1: Existing Pharmacy with stock
DBMS_OUTPUT.PUT_LINE('--- Testing Pharmacy: NOVAHealthPlus ---');
EXEC GetStockAtPharmacy('NOVAHealthPlus');

-- Test case 2: Non-existent Pharmacy
DBMS_OUTPUT.PUT_LINE('--- Testing Pharmacy: NonExistentPharmacy ---');
EXEC GetStockAtPharmacy('NonExistentPharmacy');

END;
/