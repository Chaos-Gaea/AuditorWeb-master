IF OBJECT_ID('dbo.FixQuestionnaireResultAnswers', 'P') IS NULL EXEC('Create Procedure dbo.FixQuestionnaireResultAnswers AS SELECT ''Not Implemented...'' ')
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE  [dbo].[FixQuestionnaireResultAnswers]
	@QuestionnaireID int,
	@QuestionID int,
	@AnswerID int,
	@ResultID int
AS
BEGIN
/*
declare @QuestionnaireID int
declare @QuestionID int
declare @AnswerID int
declare @ResultID int

set @QuestionnaireID=2
set @QuestionID=910
set @AnswerID=802
set @ResultID=71
*/

declare @tempScore decimal(38,18)

select ID,LinkOptionID into #linkQuestions from APQuestions where QuestionnaireID=@QuestionnaireID and LinkQuestionID=@QuestionID and LinkOptionID>0
select OptionID into #answerOptions from APAnswerOptions where AnswerID=@AnswerID

while exists (select ID from #linkQuestions)
begin
	declare @ID int
	declare @LinkOptionID int
	set rowcount 1
	select @ID=ID,@LinkOptionID=LinkOptionID from #linkQuestions
	set rowcount 0
	--�������ָ�����Ŀ�Ĺ���ѡ��ǵ�ǰ��Ŀ�Ĵ�ѡ���ɾ������Ŀ�����
	if not exists(select OptionID from #answerOptions where OptionID=@LinkOptionID)
	begin
		delete from APAnswerOptions
		from APAnswerOptions ao inner join APAnswers aa on ao.AnswerID=aa.ID
		where aa.ResultID=@ResultID and aa.QuestionID=@ID

		delete from APAnswers where ResultID=@ResultID and QuestionID=@ID
		
		--ɾ���������ʾ���ܷ�
		select @tempScore=Sum(TotalScore) from APAnswers where ResultID=@ResultID
		update APQuestionnaireResults set Score=@tempScore where ID=@ResultID
	end

	delete from #linkQuestions where @ID=ID and @LinkOptionID=LinkOptionID
end
drop table #linkQuestions


--��ת�߼����ҵ�����Ŀ�Ĵ�ѡ���Ӧ����ת��Ŀ���
declare @jumpCpde nvarchar(50)
select @jumpCpde=isnull(JumpQuestionCode,'') from APOptions oo
inner join #answerOptions ao on oo.ID=ao.OptionID
where isnull(oo.JumpQuestionCode,'')<>''

if @jumpCpde<>''
begin
	--�����ǰ��Ŀ�Ĵ�ѡ������ת���,�ҵ���Ӧ����Ŀ,Ȼ��ɾ���м�������Ŀ�Ĵ�
	select ROW_NUMBER() over(order by Code) as RowIndex,ID,Code into #tempQuestions from APQuestions where QuestionnaireID=@QuestionnaireID order by Code
	declare @tempDeleteIDs table (ID int)
	declare @tempIndex int
	declare @tempCount int
	declare @tmpCode nvarchar(50)
	select @tempIndex=RowIndex from #tempQuestions where ID=@QuestionID
	
	select ID,Code into #tempSearch from #tempQuestions where RowIndex>@tempIndex

	declare @findJumpFlag bit
	set @findJumpFlag=0
	while exists(select ID from #tempSearch)
	begin
		declare @currentCode nvarchar(50)
			declare @currentID int
			set rowcount 1
			select @currentID=ID, @currentCode=Code from #tempSearch
			set rowcount 0

			if @currentCode=@jumpCpde
			begin
				set @findJumpFlag=1
				break;
			end
			else
			begin
				insert into @tempDeleteIDs
				select @currentID
			end

			delete from #tempSearch where @currentID=ID and @currentCode=Code
	end
	drop table #tempSearch

	if @findJumpFlag=1
	begin
		delete from APAnswerOptions
		from APAnswerOptions ao 
		inner join APAnswers aa on ao.AnswerID=aa.ID
		inner join @tempDeleteIDs que on que.ID=aa.QuestionID
		where aa.ResultID=@ResultID
		delete from APAnswers where ResultID=@ResultID and QuestionID in (select ID from @tempDeleteIDs)

		--ɾ���������ʾ���ܷ�
		select @tempScore=Sum(TotalScore) from APAnswers where ResultID=@ResultID
		update APQuestionnaireResults set Score=@tempScore where ID=@ResultID
	end
	drop table #tempQuestions
end
drop table #answerOptions
END