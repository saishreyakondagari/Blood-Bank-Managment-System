-- CREATE OR REPLACE VIEW Top_Donors AS
-- WITH DonorRanking AS (
--     SELECT 
--         U.User_ID,
--         U.Name AS Donor_Name,
--         COUNT(D.Donation_ID) AS Total_Donations,
--         DENSE_RANK() OVER (ORDER BY COUNT(D.Donation_ID) DESC) AS Donor_Rank
--     FROM 
--         BBMS_User U
--     JOIN Donation D ON D.User_ID = U.User_ID
--     JOIN Person_Type PT ON U.Person_Type_ID = PT.Person_Type_ID
--     WHERE 
--         PT.Person_Type = 'Donor' -- Corrected column
--     GROUP BY 
--         U.User_ID, 
--         U.Name
-- )
-- SELECT 
--     User_ID,
--     Donor_Name,
--     Total_Donations,
--     Donor_Rank
-- FROM 
--     DonorRanking
-- WHERE 
--     Donor_Rank <= 2;



-- Drop the view if it already exists
DROP VIEW Top_Donors;

-- Create the updated Top_Donors view
CREATE OR REPLACE VIEW Top_Donors AS
WITH DonorRanking AS (
    SELECT 
        U.Name AS Donor_Name,
        COUNT(D.Donation_ID) AS Total_Donations,
        DENSE_RANK() OVER (ORDER BY COUNT(D.Donation_ID) DESC) AS Donor_Rank
    FROM 
        BBMS_User U
    JOIN Donation D ON D.User_ID = U.User_ID
    JOIN Person_Type PT ON U.Person_Type_ID = PT.Person_Type_ID
    WHERE 
        PT.Person_Type = 'Donor'
    GROUP BY 
        U.Name
)
SELECT 
    Donor_Name,
    Total_Donations,
    Donor_Rank
FROM 
    DonorRanking
WHERE 
    Donor_Rank <= 2;
