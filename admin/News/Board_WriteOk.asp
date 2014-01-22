<!--#include virtual="/admin/common/AdminCheck.asp"-->
<!--#include virtual="/admin/common/admin_info.asp"-->
<!--#include virtual="/admin/common/top.asp"-->
<!--#include virtual="/common/proc_ConvertChar.asp"-->
<!--#include virtual="/common/Proc_FileUpload.asp" -->


<%
Dim User_Name , User_Email , Subject , Content , Add_File , TableName,htmlYn
Dim strFileName, DestinationFile, FileLocation
Dim FileName


Set theForm = Server.CreateObject("ABCUpload4.XForm")
theForm.AbsolutePath = True
theForm.CodePage = 949
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
idYear = theForm("idYear")
idMonth = theForm("idMonth")
idDay = theForm("idDay")
View_Date=idYear&"-"&idMonth&"-"&idDay
User_Ip = Request.ServerVariables("REMOTE_HOST")

Set file = theForm("Add_File")(1)

if file.length > 0 Then

	Call UploadLocation(TableName)		'FileMaxSize, DestinationFolder 호출
	
	If CLng(file.Length) > CLng(FileMaxSize * 1024 * 1024) Then
		Call AlertMsg("파일 크기는 " & FileMaxSize & "Mbyte 이하여야 합니다.", "history.back();")
	End If

	strFileName = file.SafeFileName		'파일 이름
	DestinationFile = DestinationFolder & strFileName		'저장될 경로명, 파일이름
	FileLocation = FileExistsCheck(DestinationFile, DestinationFolder, strFileName)		'파일 중복 체크후 실제 저장될 경로명, 파일이름

	file.Save FileLocation		'파일 업로드
	FileName = Replace(FileLocation, DestinationFolder, "")		'실제 저장된 파일 이름
	FileSize = GetFileSizeConvert(file.Length)	'파일 사이즈
Else
	FileName = ""
	FileSize = 0
End If

Set file = Nothing
Set theForm = Nothing


dbCon.Open

'Sql="Select User_Pwd From sawon Where user_id = '"&AdminID&"' "
'Set Rs=dbCon.Execute(Sql)
'passwd = Rs("user_pwd")
'Rs.Close
'Set Rs=Nothing


'REF 번호 구하기
Set Rs0 = dbCon.Execute("Select Max(qna_ref) From "&TableName)

If Rs0(0)>"" Then
	Ref=Rs0(0)+1
Else
	Ref=1
End IF

Rs0.Close
Set Rs0=Nothing

'IDX_NUM 번호 구하기
Set Rs0=dbCon.Execute("Select Max(idx_num) From "&TableName)
If Rs0(0)>"" Then
	idx_num=Rs0(0)+1
Else
	idx_num=1
End IF

Rs0.Close
Set Rs0=Nothing


Sql = "Insert into "&TableName&" values ("& idx_num &",'"& User_name &"','"& User_Email &"','"& User_home &"','"& Subject &"','"&Content&"',getdate(),1,"& Ref &",1,'"&FileSize&"','"&passwd&"','"& FileName &"','"&user_ip&"',1,1,0,'"&htmlYn&"','"&View_Date&"')"
'response.Write sql
dbCon.Execute Sql ,  , adCmdText + adExecuteNoRecords
		
dbCon.Close 


Response.Redirect "Board_List.asp?TableName="&TableName

%>
