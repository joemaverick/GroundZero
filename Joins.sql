  
SELECT Goal.GoalID, Users.UserName, Goal.GoalName
FROM Goal
INNER JOIN Users ON Goal.UserID=Users.UserID;

SELECT Milestone.MilestoneId, Milestone.MilestoneName, Goal.GoalName, KVIType.KVIName 
FROM Milestone 
INNER JOIN Goal on Goal.GoalID = Milestone.GoalId INNER JOIN KVIType on KVIType.KVITypeId = Milestone.KVITypeId

SELECT Milestone.MilestoneId, MilestoneName, Goal.GoalName, Goal.GoalId, Milestone.TargetKVI, Milestone.CurrentKVI 
FROM Milestone 
INNER JOIN Goal on Goal.GoalID = Milestone.GoalId
