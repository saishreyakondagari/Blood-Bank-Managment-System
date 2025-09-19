
CREATE OR REPLACE PROCEDURE add_blood_request (
    p_request_id         IN NUMBER,
    p_hospital_id        IN NUMBER,
    p_hospital_patient_id IN NUMBER,
    p_user_id            IN NUMBER,
    p_blood_type_id      IN NUMBER,
    p_quantity_requested IN NUMBER,
    p_request_date       IN DATE
) AS
    v_status VARCHAR2(100);
    v_donation_id NUMBER;
BEGIN
    IF validate_patient(p_user_id) <> 'VALID' THEN
        RAISE_APPLICATION_ERROR(-20001, validate_patient(p_user_id));
    END IF;

    IF validate_hospital(p_hospital_id) <> 'VALID' THEN
        RAISE_APPLICATION_ERROR(-20002, validate_hospital(p_hospital_id));
    END IF;

    IF validate_blood_type(p_blood_type_id) <> 'VALID' THEN
        RAISE_APPLICATION_ERROR(-20003, validate_blood_type(p_blood_type_id));
    END IF;

    IF p_quantity_requested <> 1 THEN
        RAISE_APPLICATION_ERROR(-20004, 'Only 1 unit  can be requested');
    END IF;

    v_donation_id := check_blood_availability(p_blood_type_id);
    IF v_donation_id IS NULL THEN
        RAISE_APPLICATION_ERROR(-20005, 'Requested blood type not available');
    END IF;

    INSERT INTO blood_request (
        request_id, hospital_id, hospital_patient_id, blood_type_id,
        quantity_requested, request_date, status
    ) VALUES (
        p_request_id, p_hospital_id, p_hospital_patient_id, p_blood_type_id,
        p_quantity_requested, p_request_date, 'Fulfilled'
    );

    update_inventory_and_status(v_donation_id, p_blood_type_id, p_hospital_patient_id);

    DBMS_OUTPUT.PUT_LINE('Blood request added and processed.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in add_blood_request: ' || SQLERRM);
        RAISE;
END;
