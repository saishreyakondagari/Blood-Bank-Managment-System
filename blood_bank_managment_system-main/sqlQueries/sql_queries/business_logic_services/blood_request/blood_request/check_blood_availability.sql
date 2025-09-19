
CREATE OR REPLACE FUNCTION check_blood_availability (
    p_blood_type_id IN NUMBER
) RETURN NUMBER IS
    v_donation_id NUMBER;
BEGIN
    SELECT donation_id INTO v_donation_id
    FROM donation
    WHERE status = 'Available'
      AND blood_type_id = p_blood_type_id
      AND ROWNUM = 1;

    RETURN v_donation_id;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
    WHEN OTHERS THEN
        RETURN NULL;
END;

