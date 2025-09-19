CREATE OR REPLACE VIEW Donor_Activity_Summary AS
SELECT 
    U.User_ID,
    U.Name AS Donor_Name,
    COUNT(D.Donation_ID) AS Total_Donations,
    MAX(D.Donation_Date) AS Last_Donation_Date
FROM 
    BBMS_User U
JOIN Donation D ON D.User_ID = U.User_ID
JOIN Person_Type PT ON U.Person_Type_ID = PT.Person_Type_ID
WHERE 
    PT.Person_Type = 'Donor' -- Corrected column name
GROUP BY 
    U.User_ID, 
    U.Name;