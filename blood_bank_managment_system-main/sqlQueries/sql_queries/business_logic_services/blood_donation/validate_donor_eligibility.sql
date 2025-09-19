SET SERVEROUTPUT ON;
-- File: validate_donor_eligibility.sql
CREATE OR REPLACE FUNCTION validate_donor_eligibility(
    p_user_id IN NUMBER
) RETURN VARCHAR2 AS
    v_dob DATE;
    v_age NUMBER;
BEGIN
    -- Retrieve donor's date of birth
    SELECT dob
    INTO v_dob
    FROM bbms_user
    WHERE user_id = p_user_id;

    -- Calculate age
    v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);

    -- Check eligibility
    IF v_age >= 18 THEN
        RETURN 'VALID';
    ELSE
        RETURN 'Donor must be at least 18 years old';
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Donor not found';
END validate_donor_eligibility;
