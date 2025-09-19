
CREATE OR REPLACE PROCEDURE update_inventory_and_status (
    p_donation_id   IN NUMBER,
    p_blood_type_id IN NUMBER,
    p_hospital_patient_id IN NUMBER
) AS
    v_blood_bank_id NUMBER;
BEGIN
    SELECT blood_bank_id INTO v_blood_bank_id FROM donation WHERE donation_id = p_donation_id;

    UPDATE donation SET status = 'Consumed' WHERE donation_id = p_donation_id;

    UPDATE donation SET hospital_patient_id = p_hospital_patient_id WHERE donation_id = p_donation_id;

    UPDATE blood_bank
    SET capacity = capacity - 1
    WHERE blood_bank_id = v_blood_bank_id;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in update_inventory_and_status: ' || SQLERRM);
        RAISE;
END;


