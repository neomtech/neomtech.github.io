<!--#include virtual="/admin/common/AdminCheck.asp"-->
<!--#include virtual="/admin/common/admin_info.asp"-->
<!--#include virtual="/admin/common/top.asp"-->
<!--#include virtual="/common/proc_ConvertChar.asp"-->
<!--#include virtual="/common/Proc_FileUpload.asp" -->


<%
Dim User_Name , User_Email , Subject , Content , Add_File , TableName , idx_num
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
idx_num = theForm("idx_num")
Search = theForm("Search")
SearchText = theForm("SearchText")
Page = theForm("Page")

idYear = theForm("idYear")
idMonth = theForm("idMonth")
idDay = theForm("idDay")
View_Date=idYear&"-"&idMonth&"-"&idDay

dbCon.Open

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

	Sql = "Update "&TableName&" Set User_File = '"&FileName&"' Where idx_num = "&idx_num&" "
	dbCon.Execute Sql,  , adCmdText + adExecuteNoRecords
Else
	FileName = ""
	FileSize = 0
End If

Set file = Nothing
Set theForm = Nothing


Sql = "Update "&TableName&" Set User_Name = '"&User_Name&"' , User_mail = '"&User_Email&"' , Title = '"&Subject&"' , "&_
		"Content = '"&Content&"' , View_Date = '"&View_Date&"' , HTML_YN = '" & htmlYn & "' Where idx_num="&idx_num&" "
dbCon.Execute Sql,  , adCmdText + adExecuteNoRecords
dbCon.Close 

Response.Redirect "Board_List.asp?TableName="&TableName&"&Page="&Page&"&Search="&Search&"&SearchText="&SearchText

%>
