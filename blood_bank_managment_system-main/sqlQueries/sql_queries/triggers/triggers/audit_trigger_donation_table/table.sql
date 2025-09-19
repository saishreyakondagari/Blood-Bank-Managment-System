DROP TRIGGER trg_log_donation_insert;
DROP TABLE donation_audit;


CREATE TABLE DONATION_AUDIT 
    (audit_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, donation_id NUMBER, user_id NUMBER,
     blood_bank_id NUMBER, blood_type_id NUMBER, donation_date DATE, inserted_by VARCHAR2(100), 
     inserted_on DATE );


CREATE OR REPLACE TRIGGER trg_log_donation_insert 
    AFTER INSERT ON DONATION 
    FOR EACH ROW BEGIN INSERT INTO DONATION_AUDIT 
    ( donation_id, user_id, blood_bank_id, blood_type_id, donation_date, inserted_by, inserted_on ) 
    VALUES ( :NEW.donation_id, :NEW.user_id, :NEW.blood_bank_id, :NEW.blood_type_id, :NEW.donation_date,
    USER, SYSDATE );
    END; 

