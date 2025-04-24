BEGIN

-- Test case 1: Existing Pharmacy with stock
DBMS_OUTPUT.PUT_LINE('--- Testing Pharmacy: NOVAHealthPlus ---');
 GetStockAtPharmacy('NOVAHealthPlus');

-- Test case 2: Non-existent Pharmacy
DBMS_OUTPUT.PUT_LINE('--- Testing Pharmacy: NonExistentPharmacy ---');
 GetStockAtPharmacy('NonExistentPharmacy');

END;
/