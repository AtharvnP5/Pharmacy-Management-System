-- filepath: c:\Users\athar\Documents\BITS\2-2\dbms\proj\v1\Pharmacy-Management-System\p4_drug_by_company.sql

CREATE OR REPLACE PROCEDURE GetDrugsByCompany (
    p_CompanyName IN VARCHAR2
)
IS
BEGIN
    -- Cursor to fetch drug details for the given company
    FOR drug_record IN (
        SELECT 
            TradeName,
            Formula
        FROM 
            Drug
        WHERE 
            Company = p_CompanyName
        ORDER BY 
            TradeName
    )
    LOOP
        -- Print each drug's details
        DBMS_OUTPUT.PUT_LINE('Trade Name: ' || drug_record.TradeName);
        DBMS_OUTPUT.PUT_LINE('Formula: ' || drug_record.Formula);
        DBMS_OUTPUT.PUT_LINE('-----------------------------');
    END LOOP;
END;
/


