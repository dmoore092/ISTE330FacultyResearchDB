DELIMITER //
CREATE PROCEDURE getMyProjects
(IN projLead VARCHAR(50))
BEGIN
  SELECT DISTINCT projectName, projectDescription, project.id AS 'id', name AS 'projectLead', email AS 'email'
  FROM project JOIN user ON project.projectLead = user.id 
 WHERE user.id = projLead AND user.role = 1;
 END //
DELIMITER ;
