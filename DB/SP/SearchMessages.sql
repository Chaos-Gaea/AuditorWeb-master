IF OBJECT_ID('dbo.SearchMessages', 'P') IS NULL EXEC('Create Procedure dbo.SearchMessages AS SELECT ''Not Implemented...'' ')
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE  [dbo].[SearchMessages]
	@AcceptUserID int,
	@Title nvarchar(50),
	@FromDate datetime,
	@ToDate datetime,
	@Status int,
	@ProjectID int
AS
BEGIN
/*
declare @AcceptUserID int
declare @Title nvarchar(50)
declare @FromDate datetime
declare @ToDate datetime
declare @Status int
set @AcceptUserID=4
set @Title=''
set @FromDate='2017-7-1'
set @ToDate='2017-7-4'
set @Status=NULL
*/

select m.ID, 
isnull(m.ProjectID,0) as ProjectID,
m.Title, 
isnull(uu.UserName,'系统') as FromUserName,
m.RelatedUrl,
bcType.ItemValue as TypeName,
bc.ItemValue as StatusName,
m.CreateTime,
m.[Status]
into #tempResult
from APMessage m
left join APUsers uu on uu.ID=m.FromUserID
left join BusinessConfiguration bcType on bcType.ItemKey=m.TypeID and bcType.ItemDesc='MessageType'
left join BusinessConfiguration bc on bc.ItemKey=m.[Status] and bc.ItemDesc='MessageStatus'
where m.AcceptUserID=@AcceptUserID
and m.Title like '%'+@Title+'%'
and m.CreateTime>=@FromDate
and m.CreateTime<@ToDate
and m.[Status]=isnull(@Status,m.[Status])
order by m.CreateTime desc

if @ProjectID>0
begin
	delete from #tempResult where ProjectID<>@ProjectID
end

select * from  #tempResult

drop table #tempResult

END