create or replace procedure onboard_user (
   p_location_id    in number,
   p_person_type_id in number,
   p_hospital_id    in number, -- can be NULL
   p_name           in varchar2,
   p_email          in varchar2,
   p_phone          in varchar2,
   p_gender         in varchar2,
   p_dob            in date,
   p_blood_type_id  in number
) as
   v_user_id bbms_user.user_id%type;
   v_exists  number;
begin
    -- Check if user already exists by email or phone
   select count(*)
     into v_exists
     from bbms_user
    where email = p_email
       or phone = p_phone;

   if v_exists = 0 then
      v_user_id := bbms_user_seq.nextval;
      insert into bbms_user (
         user_id,
         location_id,
         person_type_id,
         hospital_id,
         name,
         email,
         phone,
         gender,
         dob,
         blood_type_id
      ) values ( v_user_id,
                 p_location_id,
                 p_person_type_id,
                 p_hospital_id,
                 p_name,
                 p_email,
                 p_phone,
                 p_gender,
                 p_dob,
                 p_blood_type_id );

      dbms_output.put_line('User onboarded with ID: ' || v_user_id);
   else
      dbms_output.put_line('User already exists with same email or phone.');
   end if;

exception
   when others then
      dbms_output.put_line('Error during user onboarding: ' || sqlerrm);
end onboard_user;
/