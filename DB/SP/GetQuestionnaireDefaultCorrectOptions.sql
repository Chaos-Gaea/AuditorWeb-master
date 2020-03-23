IF OBJECT_ID('dbo.GetQuestionnaireDefaultCorrectOptions', 'P') IS NULL EXEC('Create Procedure dbo.GetQuestionnaireDefaultCorrectOptions AS SELECT ''Not Implemented...'' ')
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE  [dbo].[GetQuestionnaireDefaultCorrectOptions]
	@QuestionnaireID int
AS
BEGIN

/*
declare @QuestionnaireID int
set @QuestionnaireID=15
*/

select ID,Code,TotalScore,LinkQuestionID,LinkOptionID,QuestionType into #tempQuestions from APQuestions where QuestionnaireID=@QuestionnaireID order by Code
select oo.*,que.Code into #tempOptions from APOptions oo
inner join #tempQuestions que on que.ID=oo.QuestionID
where oo.bCorrectOption=1
order by que.Code,oo.ID

declare @tempDeleteIDs table (ID int)


--��ת�߼�����
select ID,QuestionID,JumpQuestionCode into #options from #tempOptions
where isnull(JumpQuestionCode,'')<>''

select ROW_NUMBER() over(order by Code) as RowIndex,*
into #jumpTempResult
from #tempQuestions

while exists(select ID from #options)
begin
	declare @tmpID int
	declare @tmpQuestionID int
	declare @tmpCode nvarchar(50)
	set rowcount 1
	select @tmpID=ID,@tmpQuestionID=QuestionID,@tmpCode=JumpQuestionCode from #options
	set rowcount 0

	--��ת��Ŀ��֤��4����1��ȷ�ϵ�ǰ��Ŀ�Ĵ��Ƿ�ѡ����Ҫ��ת��ѡ�� 2���ӵ�ǰ��Ŀ��ʼ�����ҵ���ת����Ŀ 3����¼�ӵ�ǰ��Ŀ���ҵ�����ת��Ŀ�м��������Ŀ 4��ɾ����¼���м���Ŀ
	declare @tempIndex int
	select @tempIndex=RowIndex from #jumpTempResult where ID=@tmpQuestionID
	select ID,Code into #tempSearch from #jumpTempResult where RowIndex>@tempIndex
	
	declare @findJumpFlag bit
	set @findJumpFlag=0
	while exists(select ID from #tempSearch)
	begin
		declare @currentCode nvarchar(50)
		declare @currentID int
		set rowcount 1
		select @currentID=ID, @currentCode=Code from #tempSearch
		set rowcount 0

		if @currentCode=@tmpCode
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
		delete from #tempQuestions where ID in (select ID from @tempDeleteIDs)
		delete from #tempOptions where QuestionID in (select ID from @tempDeleteIDs)
	end

	delete from @tempDeleteIDs
	delete from #options where ID=@tmpID
end

drop table #options
drop table #jumpTempResult

--�����߼�����
select ID,LinkQuestionID,LinkOptionID into #linkQuestions from #tempQuestions
where LinkOptionID>0

while exists(select ID from #linkQuestions)
begin
	declare @tempID int
	declare @tempQuestionID int
	declare @tempOptionID int
	
	set rowcount 1
	select @tempID=ID,@tempQuestionID=LinkQuestionID,@tempOptionID=LinkOptionID from #linkQuestions
	set rowcount 0

	declare @deleteFlag bit
	set @deleteFlag=0
	--������Ŀ��֤����֤��������Ŀ�Ƿ���Ĭ����ȷ�Ľ���д���
	if not exists(select ID from #tempOptions where ID=@tempOptionID and QuestionID=@tempQuestionID)
	begin
		insert into @tempDeleteIDs
		exec [dbo].[GetAllSubQuestionsByID] @tempID

		insert into @tempDeleteIDs
		select @tempID
	end

	delete from #linkQuestions where ID=@tempID
end
delete from #tempQuestions where ID in (select ID from @tempDeleteIDs)
delete from #tempOptions where QuestionID in (select ID from @tempDeleteIDs)
delete from @tempDeleteIDs
drop table #linkQuestions


select * from #tempQuestions where QuestionType in (1,2,3)
select * from #tempOptions

drop table #tempQuestions
drop table #tempOptions

END