<!--#include virtual="/admin/common/AdminCheck.asp"-->
<!--#include virtual="/admin/common/admin_info.asp"-->
<!--#include virtual="/admin/common/top.asp"-->
<!--#include virtual="/common/Proc_FileUpload.asp" -->


<%
Dim idx_num , Search , Keyword , Page , TableName

idx_num = Request("idx_num")
Search = Request("Search")
keyword = Request("keyword")
Page = Request("Page")
TableName = Request("TableName")

dbCon.Open

Sql="Select User_File From "&TableName&" Where idx_num = "&idx_num&" "
Set Rs = dbCon.Execute(Sql)
Add_File = Rs("User_File")
Rs.Close
Set Rs = Nothing

IF Add_File <> "" Or Add_File > "" Then
	Call DeleteFile (Add_File , TableName)
End IF

Sql="Delete From "&TableName&" Where idx_num = "& idx_num &" "
dbCon.Execute(Sql)

Response.Redirect "Board_List.asp?TableName="&TableName&"&Page="&Page&"&Search="&Search&"&keyword="&keyword

dbCon.Close


%>