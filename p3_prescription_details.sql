--Procedure3
CREATE OR REPLACE PROCEDURE Get_Prescription_Details (
  p_Patient INT,
  p_Date    DATE
) AS
  v_Doctor INT;
BEGIN
  SELECT Doctor
  INTO v_Doctor
  FROM Prescription
  WHERE Patient = p_Patient AND Date_ = p_Date;

  DBMS_OUTPUT.PUT_LINE('Prescription Details:');
  DBMS_OUTPUT.PUT_LINE('Patient ID: ' || p_Patient);
  DBMS_OUTPUT.PUT_LINE('Date: ' || TO_CHAR(p_Date, 'DD-MON-YYYY'));
  DBMS_OUTPUT.PUT_LINE('Doctor ID: ' || v_Doctor);

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No prescription found for the given patient and date.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/