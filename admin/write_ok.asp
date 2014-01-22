<% Option Explicit

Dim objDBConn
Dim strSQL
Dim strName, strPassword, strSubject, strContent

strName		= Request.Form("name")
strPassword	= Request.Form("pwd")
strSubject	= Request.Form("subject")
strContent	= Request.Form("content")

strSQL = "Insert into board ("
strSQL = strSQL & "b_name"
strSQL = strSQL & ",b_pwd"
strSQL = strSQL & ",b_title"
strSQL = strSQL & ",b_content"
strSQL = strSQL & ",b_readnum"
strSQL = strSQL & ",b_date"

strSQL = strSQL & ") Values ("
strSQL = strSQL & "'" & strName & "',"
strSQL = strSQL & "'" & strPassword & "',"
strSQL = strSQL & "'" & strSubject  & "',"
strSQL = strSQL & "'" & strContent  & "',"
strSQL = strSQL & "0,"
strSQL = strSQL & "getDate())"

Set objDBConn = Server.CreateObject("ADODB.Connection")

objDBConn.Open ("Provider=SQLOLEDB;User ID=aip2roukie;Password=jini0211;Initial Catalog=neomtech_com;Data Source=211.43.212.180")

objDBConn.Execute strSQL
objDBConn.Close
Set objDBConn = nothing
%>
<script language="javascript">
alert("등록되었습니다");
location.href="list1.asp";
</script>