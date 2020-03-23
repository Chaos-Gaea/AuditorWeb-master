delete from BusinessConfiguration where ItemDesc='ProjectStatus'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 1,'�Ѵ���','ProjectStatus' union
select 2,'ִ����','ProjectStatus' union
select 3,'��ִ��','ProjectStatus'

delete from BusinessConfiguration where ItemDesc='QuestionnaireStatus'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 1,'�Ѵ���','QuestionnaireStatus' union
select 2,'ִ����','QuestionnaireStatus' union
select 3,'��ִ��','QuestionnaireStatus'

delete from BusinessConfiguration where ItemDesc='ProjectType'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 1,'���ڷ���','ProjectType' union
select 2,'��������','ProjectType' union
select 3,'�ز�����','ProjectType' union
select 4,'��������','ProjectType'


delete from BusinessConfiguration where ItemDesc='QuestionType'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 1,'�Ƿ���','QuestionType' union
select 2,'��ѡ��','QuestionType' union
select 3,'��ѡ��','QuestionType' union
select 4,'�����','QuestionType' union
select 5,'����ѡ��','QuestionType' union
select 6,'�����ѡ��','QuestionType' union
select 7,'����','QuestionType' union
select 8,'�ϴ���','QuestionType'


delete from BusinessConfiguration where ItemDesc='CountType'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 1,'��ȷ�÷�','CountType' union
select 2,'����۷�','CountType' union
select 3,'ȫ����ȷ�÷�','CountType' union
select 4,'ѡ����ܺ�','CountType' union
select 5,'���÷ֲ��۷�','CountType' union
select 6,'ѡ����ӿ۷�','CountType' union
select 7,'����ѡ���','CountType'


delete from dbo.APUserRole
insert into dbo.APUserRole (ID,FirstPage,Name,MenuPage, ProjectMenuPage)
select 1,'ProjectList.htm','�ܿ�','CommonLeftMasterUser.htm','CommonProjectLeftMasterUser.htm' union
select 2,'ProjectList.htm','����','CommonLeftAreaUser.htm','CommonProjectLeftAreaUser.htm' union
select 3,'ProjectList.htm','ִ�ж���','CommonLeftCityUser.htm','CommonProjectLeftCityUser.htm' union
select 4,'ProjectList.htm','����Ա','CommonLeftVisitor.htm','CommonProjectLeftVisitor.htm' union
select 5,'ProjectList.htm','�ʿض���','CommonLeftQCLeader.htm','CommonProjectLeftQCLeader.htm' union
select 6,'ProjectList.htm','�ʿ�Ա','CommonLeftQCUser.htm','CommonProjectLeftQCUser.htm' union
select 7,'ProjectList.htm','�о�Ա','CommonLeft.htm','CommonProjectLeft.htm' union
select 8,'ProjectList.htm','ϵͳ����Ա','CommonLeft.htm','CommonProjectLeft.htm' union
select 10,'ProjectList.htm','�ʹ�Ա','CommonLeft.htm','CommonProjectLeftQMUser.htm' union
select 9,'QuestionnaireCheckListClient.htm','�ͻ�',NULL,'CommonProjectLeftClient.htm'


delete from APUsers where LoginName='admin'
insert into APUsers (LoginName,UserName,Password,RoleID,CreateTime,CreateUserID)
select 'admin','ϵͳ����Ա','123456',8,GETDATE(),1

delete from BusinessConfiguration where ItemDesc='FileType'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 1,'ͼƬ','FileType' union
select 2,'¼��','FileType' union
select 3,'¼��','FileType' union
select 4,'�ĵ�','FileType' union
select 5,'����','FileType'

delete from DirectoryMapping where ID=1
insert into DirectoryMapping (ID,PhysicalPath,VituralPath,IsCurrent)
select 1,'D:\Workspace\�˲�ϵͳ\Upload\Files\','../Upload/Files/',1

delete from BusinessConfiguration where ItemDesc='ProjectFrequency'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 1,'ÿ��','ProjectFrequency' union
select 2,'ÿ��','ProjectFrequency' union
select 3,'ÿ����','ProjectFrequency' union
select 4,'ÿ����','ProjectFrequency' union
select 5,'ÿ��','ProjectFrequency' 


delete from BusinessConfiguration where ItemDesc='AreaDivision'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 1,'��������','AreaDivision' union
select 2,'��������','AreaDivision' union
select 3,'���е���','AreaDivision' union
select 4,'���ϵ���','AreaDivision' union
select 5,'���ϵ���','AreaDivision' union
select 6,'��������','AreaDivision' union
select 7,'��������','AreaDivision' union
select 8,'�۰�̨����','AreaDivision'

update dbo.APCity set areaID=1 where Level=1 and Code like '3%'
update dbo.APCity set areaID=2 where Level=1 and Code like '1%'
update dbo.APCity set areaID=7 where Level=1 and Code like '2%'
update dbo.APCity set areaID=5 where Level=1 and Code like '5%'
update dbo.APCity set areaID=6 where Level=1 and Code like '6%'
update dbo.APCity set areaID=3 where Level=1 and Code in (410000,420000,430000)
update dbo.APCity set areaID=4 where Level=1 and Code in (440000,450000,460000)
update dbo.APCity set areaID=8 where Level=1 and Code like '8%' or Code like '7%' 
update dbo.APCity set bDirectCity=1 where Level=1 and Name like '%��'

delete from BusinessConfiguration where ItemDesc='QuestionnaireUploadStatus'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 0,'δ¼��','QuestionnaireUploadStatus' union
select 1,'¼�����','QuestionnaireUploadStatus' union 
select 2,'¼��δ���','QuestionnaireUploadStatus' union
select 3,'�˻ش��޸�','QuestionnaireUploadStatus' union
select 4,'���ύ���','QuestionnaireUploadStatus'

delete from BusinessConfiguration where ItemDesc='QuestionnaireAuditStatus'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 0,'δ���','QuestionnaireAuditStatus' union
select 1,'���ͨ��','QuestionnaireAuditStatus' union 
select 2,'��˲�ͨ��','QuestionnaireAuditStatus' union
select 3,'δ�þ�','QuestionnaireAuditStatus'

delete from BusinessConfiguration where ItemDesc='QuestionnaireClientStatus'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 0,'δ����','QuestionnaireClientStatus' union
select 1,'���ύ����','QuestionnaireClientStatus' union
select 2,'���ͨ��','QuestionnaireClientStatus' union
select 3,'��˲�ͨ��','QuestionnaireClientStatus' union
select 4,'�����Ѵ���','QuestionnaireClientStatus' union
select 6,'����δ�þ�','QuestionnaireClientStatus' union
select 7,'����������','QuestionnaireClientStatus'

delete from BusinessConfiguration where ItemDesc='QuestionnaireStageStatus'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc,ItemOrder)
select 0,'δ��ʼ','QuestionnaireStageStatus',1 union
select 1,'¼����','QuestionnaireStageStatus',2 union 
select 2,'ִ�ж��������','QuestionnaireStageStatus',3 union 
select 3,'���������','QuestionnaireStageStatus',4 union 
select 4,'�ʿ������','QuestionnaireStageStatus',5 union 
select 8,'�ʿض��������','QuestionnaireStageStatus',6 union 
select 5,'������','QuestionnaireStageStatus',7 union 
select 6,'������','QuestionnaireStageStatus',8 union 
select 7,'���','QuestionnaireStageStatus',9

delete from BusinessConfiguration where ItemDesc='PageStatus'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 0,'����','PageStatus' union
select 1,'�鿴','PageStatus' union 
select 2,'�༭','PageStatus'

delete from BusinessConfiguration where ItemDesc='DocumentStatus'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 0,'����','DocumentStatus' union
select 1,'ɾ��','DocumentStatus'
          
delete from BusinessConfiguration where ItemDesc='QuestionnaireAuditType'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 1,'ִ�ж������','QuestionnaireAuditType' union
select 2,'�������','QuestionnaireAuditType' union
select 3,'�ʿ����','QuestionnaireAuditType' union
select 6,'�ʿض������','QuestionnaireAuditType' union
select 7,'�о�Ա���','QuestionnaireAuditType' union
select 4,'�ͻ����','QuestionnaireAuditType' union
select 5,'�ʿض�������','QuestionnaireAuditType'union
select 8,'����þ�','QuestionnaireAuditType' 
          
delete from BusinessConfiguration where ItemDesc='UserStatus'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 0,'����','UserStatus' union
select 1,'ͣ��','UserStatus' union
select 2,'ɾ��','UserStatus' 


delete from BusinessConfiguration where ItemDesc='ContactOnlineEmailServer'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 0,'210.77.136.200','ContactOnlineEmailServer'
delete from BusinessConfiguration where ItemDesc='ContactOnlineEmailServerPort'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 0,'465','ContactOnlineEmailServerPort'
delete from BusinessConfiguration where ItemDesc='ContactOnlineEmailUsername'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 0,'auditonline@ctrchina.cn','ContactOnlineEmailUsername'
delete from BusinessConfiguration where ItemDesc='ContactOnlineEmailPassword'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 0,'cr2017!@#','ContactOnlineEmailPassword'
delete from BusinessConfiguration where ItemDesc='ContactOnlineEmailDisplayName'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 0,'�����˲����߹���ƽ̨','ContactOnlineEmailDisplayName'

delete from BusinessConfiguration where ItemDesc='MessageStatus'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 0,'δ��','MessageStatus' union
select 1,'�Ѷ�','MessageStatus'

delete from BusinessConfiguration where ItemDesc='MessageType'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 1,'����֪ͨ','MessageType' union
select 2,'����֪ͨ','MessageType' union
select 3,'�������','MessageType' union
select 4,'���֪ͨ','MessageType' union
select 5,'����֪ͨ','MessageType' union
select 6,'���߲ö�','MessageType' union
select 7,'���߹ر�','MessageType' union
select 8,'ɾ��֪ͨ','MessageType'


delete from BusinessConfiguration where ItemDesc='Sex'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 1,'��','Sex' union
select 2,'Ů','Sex'

delete from BusinessConfiguration where ItemDesc='Degree'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 1,'Сѧ������','Degree' union
select 2,'����','Degree' union
select 3,'����','Degree' union
select 4,'��ר','Degree' union
select 5,'����','Degree' union
select 6,'˶ʿ','Degree' union
select 7,'��ʿ������','Degree'

delete from BusinessConfiguration where ItemDesc='HouseHold'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 1,'��ũ����','HouseHold' union
select 2,'ũҵ����','HouseHold'

delete from BusinessConfiguration where ItemDesc='ProtocolType'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 1,'ȫְ','ProtocolType' union
select 2,'��ְ','ProtocolType'

delete from BusinessConfiguration where ItemDesc='DocumentType'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 1,'�ͻ��б�','DocumentType' union
select 2,'�ʾ�ģ��','DocumentType' union
select 3,'ִ���ϴ�','DocumentType' union
select 4,'����ϴ�','DocumentType' union
select 5,'�ͻ��ϴ�','DocumentType' union
select 6,'�û��ϴ�','DocumentType' union
select 7,'ִ��ȫ��¼��','DocumentType' union
select 8,'�ϴ�ִ�мƻ�','DocumentType' union
select 9,'�ϴ�����������','DocumentType' union
select 10,'��������״̬','DocumentType'

delete from BusinessConfiguration where ItemDesc='UploadType'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 1,'����¼��','UploadType' union
select 2,'ͳһ¼��(����ʽ)','UploadType' union
select 3,'ͳһ¼��(�޵���ʽ)','UploadType' union
select 4,'��ͼƬ�ϴ���ʽ','UploadType'

delete from BusinessConfiguration where ItemDesc='QuestionAppealStatus'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 0,'δ����','QuestionAppealStatus' union
select 1,'��ά�ֿ۷�','QuestionAppealStatus' union
select 2,'�ѻ���','QuestionAppealStatus' union
select 3,'δ�þ�','QuestionAppealStatus'

delete from BusinessConfiguration where ItemDesc='Region'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 1,'����','Region' union
select 2,'�ɹ���','Region' union
select 3,'����','Region' union
select 4,'����','Region' union
select 5,'ά�����','Region' union
select 6,'����','Region' union
select 7,'����','Region' union
select 8,'׳��','Region' union
select 9,'������','Region' union
select 10,'������','Region' union
select 11,'����','Region' union
select 12,'����','Region' union
select 13,'����','Region' union
select 14,'����','Region' union
select 15,'������','Region' union
select 16,'������','Region' union
select 17,'��������','Region' union
select 18,'����','Region' union
select 19,'����','Region' union
select 20,'������','Region' union
select 21,'����','Region' union
select 22,'���','Region' union
select 23,'��ɽ��','Region' union
select 24,'������','Region' union
select 25,'ˮ��','Region' union
select 26,'������','Region' union
select 27,'������','Region' union
select 28,'������','Region' union
select 29,'�¶�������','Region' union
select 30,'����','Region' union
select 31,'���Ӷ���','Region' union
select 32,'������','Region' union
select 33,'Ǽ��','Region' union
select 34,'������','Region' union
select 35,'������','Region' union
select 36,'ë����','Region' union
select 37,'������','Region' union
select 38,'������','Region' union
select 39,'������','Region' union
select 40,'������','Region' union
select 41,'��������','Region' union
select 42,'ŭ��','Region' union
select 43,'���α����','Region' union
select 44,'����˹��','Region' union
select 45,'���¿���','Region' union
select 46,'������','Region' union
select 47,'������','Region' union
select 48,'ԣ����','Region' union
select 49,'����','Region' union
select 50,'��������','Region' union
select 51,'������','Region' union
select 52,'���״���','Region' union
select 53,'������','Region' union
select 54,'�Ű���','Region' union
select 55,'�����','Region' union
select 56,'��ŵ��','Region' union
select 57,'����','Region' union
select 58,'���Ѫͳ','Region'

delete from BusinessConfiguration where ItemDesc='TrainingType'
insert into BusinessConfiguration (ItemKey,ItemValue,ItemDesc)
select 1,'����Ա��ѵ','TrainingType' union
select 2,'ִ�ж�����ѵ','TrainingType' union
select 3,'�ʿ���ѵ','TrainingType' 
