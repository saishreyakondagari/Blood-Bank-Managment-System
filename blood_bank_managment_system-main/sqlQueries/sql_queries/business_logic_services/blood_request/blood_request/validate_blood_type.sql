
CREATE OR REPLACE FUNCTION validate_blood_type (
    p_blood_type_id IN NUMBER
) RETURN VARCHAR2 IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM blood_type WHERE blood_type_id = p_blood_type_id;
    IF v_count = 1 THEN
        RETURN 'VALID';
    ELSE
        RETURN 'Invalid blood type';
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error in validate_blood_type: ' || SQLERRM;
END;