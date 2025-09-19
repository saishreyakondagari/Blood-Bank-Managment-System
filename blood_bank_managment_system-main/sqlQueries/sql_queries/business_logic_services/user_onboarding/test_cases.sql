BEGIN
   onboard_user(
      p_location_id    => 105,
      p_person_type_id => 2, -- Patient
      p_hospital_id    => 206,
      p_name           => 'Jackson Rivera',
      p_email          => 'jackson.rivera12@example.com',
      p_phone          => '9001120334',
      p_gender         => 'Male',
      p_dob            => TO_DATE('1982-07-15','YYYY-MM-DD'),
      p_blood_type_id  => 3
   );
END;
/

BEGIN
   onboard_user(
      p_location_id    => 105,
      p_person_type_id => 2, -- Patient
      p_hospital_id    => 206,
      p_name           => 'Chloe Nguyen',
      p_email          => 'chloe.nguyen88@example.com',
      p_phone          => '9877705432',
      p_gender         => 'Female',
      p_dob            => TO_DATE('1990-04-10','YYYY-MM-DD'),
      p_blood_type_id  => 3
   );
END;
/

BEGIN
   onboard_user(
      p_location_id    => 105,
      p_person_type_id => 2, -- Patient
      p_hospital_id    => 206,
      p_name           => 'Benjamin Patel',
      p_email          => 'ben.patel23@example.com',
      p_phone          => '9123459900',
      p_gender         => 'Male',
      p_dob            => TO_DATE('1975-01-28','YYYY-MM-DD'),
      p_blood_type_id  => 4
   );
END;
/

-- Donors

BEGIN
   onboard_user(
      p_location_id    => 105,
      p_person_type_id => 3, -- Donor
      p_hospital_id    => NULL,
      p_name           => 'Gracce Kim',
      p_email          => 'graceee.kim07@example.com',
      p_phone          => '9117833445',
      p_gender         => 'Male',
      p_dob            => TO_DATE('1993-06-25','YYYY-MM-DD'),
      p_blood_type_id  => 3
   );
END;
/

BEGIN
   onboard_user(
      p_location_id    => 105,
      p_person_type_id => 3, -- Donor
      p_hospital_id    => NULL,
      p_name           => 'Alexxxander Brooks',
      p_email          => 'alexxx.brooks91@example.com',
      p_phone          => '9879123456',
      p_gender         => 'Female',
      p_dob            => TO_DATE('1988-06-23','YYYY-MM-DD'),
      p_blood_type_id  => 3
   );
END;
/

BEGIN
   onboard_user(
      p_location_id    => 105,
      p_person_type_id => 3, -- Donor
      p_hospital_id    => NULL,
      p_name           => 'Zooe Ramirez',
      p_email          => 'zooe.ramirez45@example.com',
      p_phone          => '9226043210',
      p_gender         => 'Male',
      p_dob            => TO_DATE('1992-01-30','YYYY-MM-DD'),
      p_blood_type_id  => 3
   );
END;
/

BEGIN
   onboard_user(
      p_location_id    => 105,
      p_person_type_id => 3, -- Donor
      p_hospital_id    => NULL,
      p_name           => 'Ethhan Shah',
      p_email          => 'ethhan.shah66@example.com',
      p_phone          => '9355678901',
      p_gender         => 'Female',
      p_dob            => TO_DATE('1993-12-12','YYYY-MM-DD'),
      p_blood_type_id  => 4
   );
END;
/
