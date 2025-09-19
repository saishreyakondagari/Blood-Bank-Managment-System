SET SERVEROUTPUT ON;
-- File: donate_blood.sql
CREATE OR REPLACE PROCEDURE donate_blood(
    p_user_id       IN NUMBER,
    p_blood_bank_id IN NUMBER,
    p_blood_type_id IN NUMBER
) AS
    v_capacity NUMBER;
BEGIN
    -- Step 1: Check if Blood Bank exists and lock row for update
    SELECT capacity
    INTO v_capacity
    FROM blood_bank
    WHERE blood_bank_id = p_blood_bank_id
    FOR UPDATE;

    -- Step 2: Update Capacity
    UPDATE blood_bank
    SET capacity = capacity + 1
    WHERE blood_bank_id = p_blood_bank_id;

    -- Step 3: Record the Donation
    INSERT INTO donation (
        donation_id,
        blood_bank_id,
        user_id,
        blood_type_id,
        quantity,
        donation_date,
        status
    ) VALUES (
        bbms_donation_seq.nextval,
        p_blood_bank_id,
        p_user_id,
        p_blood_type_id,
        1,              
        SYSDATE,
        'Available'
    );

    DBMS_OUTPUT.PUT_LINE('Blood donation recorded successfully.');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Blood bank ID ' || p_blood_bank_id || ' not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END donate_blood;
