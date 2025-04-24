-- Create the user
CREATE USER C##test IDENTIFIED BY "password";

-- Grant privileges to the user so it can connect and access resources.
GRANT CREATE SESSION TO C##test;
GRANT UNLIMITED TABLESPACE TO C##test;
-- Or grant specific tablespace quotas as needed.
GRANT CREATE TABLE, CREATE SEQUENCE, CREATE PROCEDURE TO C##test; 
GRANT CREATE TRIGGER TO C##test;