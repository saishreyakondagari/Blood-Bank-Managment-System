
CREATE OR REPLACE FUNCTION validate_hospital (
    p_hospital_id IN NUMBER
) RETURN VARCHAR2 IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM hospital WHERE hospital_id = p_hospital_id;
    IF v_count = 1 THEN
        RETURN 'VALID';
    ELSE
        RETURN 'Invalid hospital ID';
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error in validate_hospital: ' || SQLERRM;
END;
