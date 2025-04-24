-- Declare variables to use in the examples
DECLARE
  v_patient_aadhar INT := 289345678901;  
  v_patient_name VARCHAR2(50) := 'Priya Sharma';
  v_patient_address VARCHAR2(100) := '10, MG Road, Bangalore, Karnataka, India';
  v_patient_age INT := 25;
  v_patient_physician INT := 798234567801;  
  v_new_address VARCHAR2(100) := '45, Indira Nagar, Bangalore, Karnataka, India';
  v_new_age INT := 28;
  v_new_physician INT := 889900112233; 

  v_company_name VARCHAR2(50) := 'Patanjali';  
  v_company_phone VARCHAR2(20) := '+91 1334 281100';
  v_new_phone VARCHAR2(20) := '+91 11 23457890';
  v_company_name2 VARCHAR2(50) := 'Pfizer';

  v_pharmacy_name VARCHAR2(50) := 'NOVAMedix';
  v_pharmacy_phone VARCHAR2(20) := '+91 40 66789012';
  v_pharmacy_address VARCHAR2(100) := 'Plot 27, Jubilee Hills, Hyderabad, Telangana, India';
  v_new_pharmacy_phone VARCHAR2(20) := '+91 40 66789123';
  v_new_pharmacy_address VARCHAR2(100) := '8-2-684/2, Road No. 12, Banjara Hills, Hyderabad, Telangana, India';

  v_doctor_aadhar INT := 798234567801;
  v_doctor_name VARCHAR2(50) := 'Dr. Lakshmi Reddy';
  v_doctor_specialty VARCHAR2(50) := 'Cardiology';
  v_doctor_years_exp INT := 12;
  v_new_doctor_name VARCHAR2(50) := 'Dr. Lakshmi Reddy-Sharma';
  v_new_doctor_specialty VARCHAR2(50) := 'Pediatrics';
  v_new_doctor_years_exp INT := 15;

  v_doctor2_aadhar INT := 889900112233;
  v_doctor2_name VARCHAR2(50) := 'Dr. Ravi Kumar';
  v_doctor2_specialty VARCHAR2(50) := 'General Medicine';
  v_doctor2_years_exp INT := 10;


  v_prescription_patient INT := 289345678901;  
  v_prescription_date DATE := DATE '2024-01-15';
  v_prescription_doctor INT := 798234567801;    
  v_prescription_new_doctor INT := 889900112233;

  v_contract_pharma_company VARCHAR2(50) := 'Emcure Pharma';
  v_contract_pharmacy VARCHAR2(50) := 'NOVAMedix';
  v_contract_start_date DATE := DATE '2024-01-01';
  v_contract_end_date DATE := DATE '2024-12-31';
  v_contract_content VARCHAR2(200) := 'Supply Agreement for Medicines';
  v_contract_supervisor VARCHAR2(50) := 'Suresh Kumar';
  v_contract_new_start_date DATE := DATE '2024-02-01';
  v_contract_new_end_date DATE := DATE '2025-01-31';
  v_contract_new_content VARCHAR2(200) := 'Revised Supply Agreement for Medicines';
  v_contract_new_supervisor VARCHAR2(50) := 'Anita Desai';

  v_drug_company VARCHAR2(50) := 'Pfizer';  
  v_drug_trade_name VARCHAR2(50) := 'Azee';
  v_drug_formula VARCHAR2(100) := 'C21H27N7O12';
  v_new_drug_formula VARCHAR2(100) := 'C22H29N7O13';

BEGIN
  DBMS_OUTPUT.PUT_LINE('--- Doctor Procedures ---');
  -- Add the doctors.
  Add_Doctor(v_doctor_aadhar, v_doctor_name, v_doctor_specialty, v_doctor_years_exp);
  DBMS_OUTPUT.PUT_LINE('Doctor 1 added.');
  Add_Doctor(v_doctor2_aadhar, v_doctor2_name, v_doctor2_specialty, v_doctor2_years_exp);
  DBMS_OUTPUT.PUT_LINE('Doctor 2 added.');



  DBMS_OUTPUT.PUT_LINE('--- Patient Procedures ---');
  Add_Patient(v_patient_aadhar, v_patient_name, v_patient_address, v_patient_age, v_patient_physician);
  DBMS_OUTPUT.PUT_LINE('Patient added.');



  DBMS_OUTPUT.PUT_LINE('--- Pharmacy Procedures ---');
  Add_Pharmacy(v_pharmacy_name, v_pharmacy_phone, v_pharmacy_address);
  DBMS_OUTPUT.PUT_LINE('Pharmacy added.');


  DBMS_OUTPUT.PUT_LINE('--- Contract Procedures ---');
  Add_Contract(v_contract_pharma_company, v_contract_pharmacy, v_contract_start_date, v_contract_end_date, v_contract_content, v_contract_supervisor);
  DBMS_OUTPUT.PUT_LINE('Contract added.');

  Update_Contract(v_contract_pharma_company, v_contract_pharmacy, v_contract_new_start_date, v_contract_new_end_date, v_contract_new_content, v_contract_new_supervisor);
  DBMS_OUTPUT.PUT_LINE('Contract updated.');

  Delete_Contract(v_contract_pharma_company, v_contract_pharmacy);
  DBMS_OUTPUT.PUT_LINE('Contract deleted.');


  DBMS_OUTPUT.PUT_LINE('--- Prescription Procedures ---');
  Add_Prescription(v_prescription_patient, v_prescription_date, v_prescription_doctor);
  DBMS_OUTPUT.PUT_LINE('Prescription added.');

  Update_Prescription(v_prescription_patient, v_prescription_date, v_prescription_new_doctor);
  DBMS_OUTPUT.PUT_LINE('Prescription updated.');

  Delete_Prescription(v_prescription_patient, v_prescription_date);
  DBMS_OUTPUT.PUT_LINE('Prescription deleted.');



  DBMS_OUTPUT.PUT_LINE('--- Patient Procedures ---');
  --moved down
  --Add_Patient(v_patient_aadhar, v_patient_name, v_patient_address, v_patient_age, v_patient_physician);
  DBMS_OUTPUT.PUT_LINE('Patient already added.');

  Update_Patient(v_patient_aadhar, v_new_address, v_new_age, v_new_physician);
  DBMS_OUTPUT.PUT_LINE('Patient updated.');

  Delete_Patient(v_patient_aadhar);
  DBMS_OUTPUT.PUT_LINE('Patient deleted.');

  DBMS_OUTPUT.PUT_LINE('--- Pharma Company Procedures ---');
  Add_Company(v_company_name, v_company_phone);
  DBMS_OUTPUT.PUT_LINE('Patanjali added.');
  Delete_Company(v_company_name);
  DBMS_OUTPUT.PUT_LINE('Patanjali deleted.');


  DBMS_OUTPUT.PUT_LINE('--- Pharmacy Procedures ---');
  --Add_Pharmacy(v_pharmacy_name, v_pharmacy_phone, v_pharmacy_address);
  DBMS_OUTPUT.PUT_LINE('Pharmacy already added.');

  Update_Pharmacy(v_pharmacy_name, v_new_pharmacy_phone, v_new_pharmacy_address);
  DBMS_OUTPUT.PUT_LINE('Pharmacy updated.');

  Delete_Pharmacy(v_pharmacy_name);
  DBMS_OUTPUT.PUT_LINE('Pharmacy deleted.');



  DBMS_OUTPUT.PUT_LINE('--- Doctor Procedures ---');
  --  The doctors are added before patient and prescription
  --Add_Doctor(v_doctor_aadhar, v_doctor_name, v_doctor_specialty, v_doctor_years_exp);
  DBMS_OUTPUT.PUT_LINE('Doctor 1 already added.');

  Update_Doctor(v_doctor_aadhar, v_new_doctor_name, v_new_doctor_specialty, v_new_doctor_years_exp);
  DBMS_OUTPUT.PUT_LINE('Doctor updated.');

  Delete_Doctor(v_doctor_aadhar);
  DBMS_OUTPUT.PUT_LINE('Doctor deleted.');

  DELETE FROM Doctor WHERE AadharID = v_doctor2_aadhar;
  DBMS_OUTPUT.PUT_LINE('Doctor 2 deleted.');



  DBMS_OUTPUT.PUT_LINE('--- Drug Procedures ---');
  Add_Drug(v_drug_company, v_drug_trade_name, v_drug_formula);
  DBMS_OUTPUT.PUT_LINE('Drug added.');

  Update_Drug(v_drug_company, v_drug_trade_name, v_new_drug_formula);
  DBMS_OUTPUT.PUT_LINE('Drug updated.');

  Delete_Drug(v_drug_company, v_drug_trade_name);
  DBMS_OUTPUT.PUT_LINE('Drug deleted.');

END;
/
