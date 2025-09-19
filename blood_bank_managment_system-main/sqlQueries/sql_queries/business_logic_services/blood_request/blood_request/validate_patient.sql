
CREATE OR REPLACE FUNCTION validate_patient (
    p_user_id IN NUMBER
) RETURN VARCHAR2 IS
    v_type_name VARCHAR2(30);
BEGIN
    SELECT pt.person_type
    INTO v_type_name
    FROM bbms_user u
    JOIN person_type pt ON u.person_type_id = pt.person_type_id
    WHERE u.user_id = p_user_id;

    IF v_type_name = 'Patient' THEN
        RETURN 'VALID';
    ELSE
        RETURN 'User is not a Patient';
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'User does not exist';
    WHEN OTHERS THEN
        RETURN 'Error in validate_patient: ' || SQLERRM;
END;
