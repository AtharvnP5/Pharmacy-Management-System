CREATE OR REPLACE PROCEDURE GetStockAtPharmacy (
    p_PharmacyName IN VARCHAR2
)
IS
BEGIN
    -- Cursor to fetch stock details
    FOR stock_record IN (
        SELECT 
            d.Company,
            d.TradeName,
            d.Formula,
            s.Price
        FROM 
            Pharmacy_Sales s
        JOIN 
            Drug d ON s.Company = d.Company AND s.TradeName = d.TradeName
        WHERE 
            s.Pharmacy = p_PharmacyName
        ORDER BY
            d.TradeName
    )
    LOOP
        -- Print each stock record
        DBMS_OUTPUT.PUT_LINE('Company: ' || stock_record.Company);
        DBMS_OUTPUT.PUT_LINE('Trade Name: ' || stock_record.TradeName);
        DBMS_OUTPUT.PUT_LINE('Formula: ' || stock_record.Formula);
        DBMS_OUTPUT.PUT_LINE('Price: ' || stock_record.Price);
        DBMS_OUTPUT.PUT_LINE('-----------------------------');
    END LOOP;
END;
/
