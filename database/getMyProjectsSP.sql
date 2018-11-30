DELIMITER //
CREATE PROCEDURE getMyProjects
(IN userId VARCHAR(50))
BEGIN
SELECT DISTINCT projectName, name AS 'projectLead', email, projectDescription, u.id
FROM project p JOIN user u
WHERE p.projectLead = u.id
AND u.id = userId;
END //
DELIMITER ;
