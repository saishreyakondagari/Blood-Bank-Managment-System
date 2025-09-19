
SET SERVEROUTPUT ON;

BEGIN
    add_blood_request(
        p_request_id         => bbms_blood_req_seq.nextval,
        p_hospital_id        => 206,
        p_hospital_patient_id => 1, -- change always
        p_user_id            => 1, -- change always
        p_blood_type_id      => 3,
        p_quantity_requested => 1,
        p_request_date       => SYSDATE
    );
END;
/
