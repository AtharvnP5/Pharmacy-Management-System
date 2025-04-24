-- Create the user
CREATE USER C##testing IDENTIFIED BY "password";

-- Grant privileges to the user so it can connect and access resources.
GRANT CREATE SESSION TO C##testing;
GRANT UNLIMITED TABLESPACE TO C##testing;
-- Or grant specific tablespace quotas as needed.
GRANT CREATE TABLE, CREATE SEQUENCE, CREATE PROCEDURE TO C##testing; 
GRANT CREATE TRIGGER TO C##testing;
