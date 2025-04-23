CREATE OR REPLACE PROCEDURE PrintPharmacyCompanyContacts (
    p_pharmacy_name IN VARCHAR2
)
AS
    CURSOR company_cursor IS
        SELECT DISTINCT
            pc.Name AS CompanyName,
            pc.Phone_number AS CompanyPhone
        FROM
            Pharma_company pc
        JOIN
            Contract c ON pc.Name = c.Pharma_company
        WHERE
            c.Pharmacy = p_pharmacy_name;

    v_pharmacy_name Pharmacy.Name%TYPE;
    v_pharmacy_phone Pharmacy.Phone_number%TYPE;
    v_pharmacy_address Pharmacy.Address%TYPE;
    v_company_record company_cursor%ROWTYPE;
    v_company_found BOOLEAN := FALSE;

BEGIN
    SELECT Name, Phone_number, Address
    INTO v_pharmacy_name, v_pharmacy_phone, v_pharmacy_address
    FROM Pharmacy
    WHERE Name = p_pharmacy_name;

    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('                  Contact Details for Pharmacy: ' || v_pharmacy_name);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Pharmacy Name:      ' || v_pharmacy_name);
    DBMS_OUTPUT.PUT_LINE('Pharmacy Phone:     ' || v_pharmacy_phone);
    DBMS_OUTPUT.PUT_LINE('Pharmacy Address:   ' || v_pharmacy_address);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Associated Pharmaceutical Companies:');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');

    OPEN company_cursor;
    LOOP
        FETCH company_cursor INTO v_company_record;
        EXIT WHEN company_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Company Name:    ' || v_company_record.CompanyName);
        DBMS_OUTPUT.PUT_LINE('Company Phone:   ' || v_company_record.CompanyPhone);
        DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
        v_company_found := TRUE;
    END LOOP;
    CLOSE company_cursor;

    IF NOT v_company_found THEN
        DBMS_OUTPUT.PUT_LINE('No associated pharmaceutical companies found for ' || p_pharmacy_name);
        DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Pharmacy not found with name: ' || p_pharmacy_name);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
