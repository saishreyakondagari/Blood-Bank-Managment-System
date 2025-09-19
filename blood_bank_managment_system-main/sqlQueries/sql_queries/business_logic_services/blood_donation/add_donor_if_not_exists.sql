SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE add_donor_if_not_exists (
    p_user_id        IN NUMBER,
    p_location_id    IN NUMBER,
    p_name           IN VARCHAR2,
    p_email          IN VARCHAR2,
    p_phone          IN VARCHAR2,
    p_gender         IN VARCHAR2,
    p_dob            IN DATE,
    p_blood_type_id  IN NUMBER,
    p_user_type_id   IN NUMBER
) AS
    v_exists         NUMBER;
    v_last_donation  DATE;
BEGIN
    -- Check if the user already exists
    SELECT COUNT(*) INTO v_exists
    FROM BBMS_USER
    WHERE user_id = p_user_id;

    IF v_exists = 0 THEN
        -- Insert the new donor record
        INSERT INTO BBMS_USER (
            user_id, location_id, person_type_id, hospital_id,
            name, email, phone, gender, dob, blood_type_id
        ) VALUES (
            p_user_id, p_location_id, p_user_type_id, NULL,
            p_name, p_email, p_phone, p_gender, p_dob, p_blood_type_id
        );
        DBMS_OUTPUT.PUT_LINE('New donor inserted into BBMS_USER.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('User already exists. Checking donation history...');
        -- Check latest donation date
        SELECT MAX(donation_date)
        INTO v_last_donation
        FROM donation
        WHERE user_id = p_user_id;

        IF v_last_donation IS NOT NULL THEN
            IF SYSDATE - v_last_donation < 90 THEN
                DBMS_OUTPUT.PUT_LINE('Error: Donation too soon. Must wait at least 90 days.');
                RAISE_APPLICATION_ERROR(-20001, 'Donation too soon. Last donation was on ' || TO_CHAR(v_last_donation, 'YYYY-MM-DD'));
            ELSE
                DBMS_OUTPUT.PUT_LINE('Eligible: Last donation was on ' || TO_CHAR(v_last_donation, 'YYYY-MM-DD'));
            END IF;
        ELSE
            DBMS_OUTPUT.PUT_LINE('User has no previous donations. Proceeding.');
        END IF;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in add_donor_if_not_exists: ' || SQLERRM);
END add_donor_if_not_exists;
/
