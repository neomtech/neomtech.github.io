<!--#include virtual="/admin/common/AdminCheck.asp"-->
<!--#include virtual="/admin/common/admin_info.asp"-->
<!--#include virtual="/admin/common/top.asp"-->
<!--#include virtual="/common/proc_ConvertChar.asp"-->
<!--#include virtual="/common/Proc_FileUpload.asp" -->


<%
Dim User_Name , User_Email , Subject , Content , Add_File , TableName
Dim strFileName, DestinationFile, FileLocation
Dim FileName

Set theForm = Server.CreateObject("ABCUpload4.XForm")
theForm.AbsolutePath = True
theForm.ID = Request.QueryString("ID")

User_Name = theForm("User_Name")
User_Email = theForm("User_Email")
htmlYn = theForm("html_yn")
Subject = ConvertChar(theForm("Subject"))
If htmlYn = "N" Then
    Content = ConvertChar2(theForm("Content"))
Else
    Content = ConvertChar(theForm("Content"))
End If
TableName = theForm("TableName")
Media = theForm("Media")

Set file = theForm("Add_File")(1)

if file.length > 0 Then

	Call UploadLocation(TableName)		'FileMaxSize, DestinationFolder ȣ��
	
	If CLng(file.Length) > CLng(FileMaxSize * 1024 * 1024) Then
		Call AlertMsg("���� ũ��� " & FileMaxSize & "Mbyte ���Ͽ��� �մϴ�.", "history.back();")
	End If

	strFileName = file.SafeFileName		'���� �̸�
	DestinationFile = DestinationFolder & strFileName		'����� ��θ�, �����̸�
	FileLocation = FileExistsCheck(DestinationFile, DestinationFolder, strFileName)		'���� �ߺ� üũ�� ���� ����� ��θ�, �����̸�

	file.Save FileLocation		'���� ���ε�
	FileName = Replace(FileLocation, DestinationFolder, "")		'���� ����� ���� �̸�
	FileSize = GetFileSizeConvert(file.Length)	'���� ������
Else
	FileName = ""
	FileSize = 0
End If

Set file = Nothing
Set theForm = Nothing


dbCon.Open

'IDX_NUM ��ȣ ���ϱ�
Set Rs0=dbCon.Execute("Select Max(idx_num) From "&TableName)
If Rs0(0)>"" Then
	idx_num=Rs0(0)+1
Else
	idx_num=1
End IF

Rs0.Close
Set Rs0=Nothing


Sql = "Insert into "&TableName&" Values ("& idx_num &",'"& User_name &"','"& User_Email &"','"& Subject &"','"&Content&"',getdate(),0,'"& htmlYn&"','"& Media&"','"&FileName&"')"

dbCon.Execute Sql,  , adCmdText + adExecuteNoRecords
		
dbCon.Close 


Response.Redirect "Board_List.asp?TableName="&TableName

%>
