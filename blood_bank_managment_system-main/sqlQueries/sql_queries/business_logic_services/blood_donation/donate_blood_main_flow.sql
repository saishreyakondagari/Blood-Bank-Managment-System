SET SERVEROUTPUT ON;
-- File: donate_blood_main_flow.sql
CREATE OR REPLACE PROCEDURE donate_blood_main_flow (
    user_id         IN NUMBER,
    location_id     IN NUMBER,
    user_name       IN VARCHAR2,
    email           IN VARCHAR2,
    phone           IN VARCHAR2,
    gender          IN VARCHAR2,
    dob             IN DATE,
    blood_type_id   IN NUMBER,
    blood_bank_id   IN NUMBER,
    user_type_id    IN NUMBER
) AS
    v_status VARCHAR2(50);
BEGIN
    -- Step 1: Add donor if not already present
    add_donor_if_not_exists(
        p_user_id       => user_id,
        p_location_id   => location_id,
        p_name          => user_name,
        p_email         => email,
        p_phone         => phone,
        p_gender        => gender,
        p_dob           => dob,
        p_blood_type_id => blood_type_id,
        p_user_type_id  => user_type_id
    );

    -- Step 2: Check donor eligibility
    v_status := validate_donor_eligibility(user_id);
    IF v_status <> 'VALID' THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || v_status);
        RETURN;
    END IF;

    -- Step 3: Validate donation interval (optional, uncomment if needed)
    -- v_status := validate_donation_interval(user_id);
    -- IF v_status <> 'VALID' THEN
    --     DBMS_OUTPUT.PUT_LINE('Error: ' || v_status);
    --     RETURN;
    -- END IF;

    -- Step 4: Proceed with blood donation
    donate_blood(
        p_user_id       => user_id,
        p_blood_bank_id => blood_bank_id,
        p_blood_type_id => blood_type_id
    );

    DBMS_OUTPUT.PUT_LINE('Donation flow completed successfully.');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END donate_blood_main_flow;
/
