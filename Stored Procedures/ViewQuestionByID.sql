CREATE PROCEDURE [dbo].[ViewQuestionByID]
@QuestionID int
AS 

BEGIN
SELECT * FROM InstructorTest WHERE QuestionID=@QuestionID

END