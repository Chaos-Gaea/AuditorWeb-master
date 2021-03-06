IF OBJECT_ID('dbo.GetGongjiaoResultID', 'P') IS NULL EXEC('Create Procedure dbo.GetGongjiaoResultID AS SELECT ''Not Implemented...'' ')
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE  [dbo].[GetGongjiaoResultID]
	@projectID int,
	@questionnaireID int,
	@clientID int,
	@questionID_Line int,
	@questionID_Stop int,
	@answer_Line nvarchar(50),
	@answer_Stop nvarchar(50)
AS
BEGIN
/*
 declare @projectID int
 declare @questionnaireID int
 declare @clientID int
 declare @questionID_Line int
 declare @questionID_Stop int
 declare @answer_Line nvarchar(50)
 declare @answer_Stop nvarchar(50)

 set @projectID=37
 set @questionnaireID=1127
 set @clientID=401999
 set @questionID_Line=20117
 set @questionID_Stop=20118
 set @answer_Line='运通104'
 set @answer_Stop='安贞桥西'
*/

 select rr.ID,rr.OtherPlatformID from APQuestionnaireResults rr
 inner join APAnswers aa1 on aa1.ResultID=rr.ID and aa1.QuestionID=@questionID_Line
 inner join APAnswers aa2 on aa2.ResultID=rr.ID and aa2.QuestionID=@questionID_Stop
 inner join APAnswerOptions ao1 on aa1.ID=ao1.AnswerID and ao1.OptionID=-1
 inner join APAnswerOptions ao2 on aa2.ID=ao2.AnswerID and ao2.OptionID=-1
 where rr.ProjectID=@projectID
 and rr.QuestionnaireID=@questionnaireID
 and rr.ClientID=@clientID
 and rr.Status=8
 and ao1.OptionText=@answer_Line 
 and ao2.OptionText=@answer_Stop

END

