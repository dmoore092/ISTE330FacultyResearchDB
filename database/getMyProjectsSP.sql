DELIMITER //
CREATE PROCEDURE getMyProjects
(IN userId VARCHAR(50))
BEGIN
  SELECT projectName, projectLead, projectDescription
  FROM project
 WHERE id = userId;
DELIMITER ;
