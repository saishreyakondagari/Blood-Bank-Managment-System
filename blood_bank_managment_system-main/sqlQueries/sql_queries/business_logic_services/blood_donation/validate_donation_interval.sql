SET SERVEROUTPUT ON;
-- File: validate_donation_interval.sql
CREATE OR REPLACE FUNCTION validate_donation_interval(
    p_user_id IN NUMBER
) RETURN VARCHAR2 AS
    v_last_donation DATE;
BEGIN
    -- Get the latest donation date for the user
    SELECT MAX(donation_date)
    INTO v_last_donation
    FROM donation
    WHERE user_id = p_user_id;

    -- Check donation interval
    IF v_last_donation IS NULL OR SYSDATE - v_last_donation > 90 THEN
        RETURN 'VALID';
    ELSE
        RETURN 'Donation interval too short';
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'VALID';
END validate_donation_interval;
