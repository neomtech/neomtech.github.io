<%
Dim Sql, Rs
Dim page, TotalRecordCount, TotalPageCount, RecordNumber

Sub ProcRecord(PageSize, UniqueField, TableName, SelectField, WhereClause, OrderBy)

	page = Request.QueryString("page")
	If IsNull(page) Or page = "" Then page = 1

	Set Rs = Server.CreateObject("ADODB.Recordset")

	Sql = "Select Count(*) From " & TableName & " Where (" & WhereClause & ")"

	'response.write sql
	'response.end

	Rs.Open Sql, dbCon, adOpenForwardOnly, adLockReadOnly, adCmdText
	TotalRecordCount = Rs(0)
	TotalPageCount = Int((TotalRecordCount - 1) / PageSize) + 1
	RecordNumber = TotalRecordCount - ((page - 1) * PageSize)
	Rs.Close

	Sql = "Select Top " & PageSize & " " & SelectField & " From " & TableName & " " & _
		"Where (" & WhereClause & ") And " & UniqueField & " Not In (Select Top " & ((page - 1) * PageSize) & " " & UniqueField & " From " & TableName & " " & _
		"Where (" & WhereClause & ") Order by " & OrderBy & ") Order by " & OrderBy & ""
	Rs.CursorLocation = adUseClient
	'response.write sql
	'response.write sql
	Rs.Open Sql, dbCon, adOpenForwardOnly, adLockReadOnly, adCmdText

	Set Rs.ActiveConnection = Nothing

End Sub


Sub ProcPaging(Param) '사용자 페이징 일반적으로 사용함

	Dim PageName, BlockSize, BlockPage, i

	PageName = Request.ServerVariables("URL")
	BlockSize = 10
	BlockPage = Int((page-1)/BlockSize)*BlockSize+1

	'이전10페이지
	If BlockPage > 1 Then
		Response.Write "<a href=" & PageName & "?" & Param & "page=" & BlockPage - BlockSize & "><img src='img/icon_02.gif' width='6' height='16'> </a>&nbsp;&nbsp;"
	Else
		Response.Write "<img src='img/icon_02.gif' width='6' height='16'>&nbsp;&nbsp;"
	End If

	'이전페이지1개
	If Int(page) > 1 Then
		Response.Write "<a href=" & PageName & "?" & Param & "page=" & page - 1 & ">이전</a>&nbsp;"
	Else
		Response.Write "이전&nbsp;"
	End If

	'페이징[1],[2]..
	i=1
	Do Until i > BlockSize Or BlockPage > TotalPageCount
		If BlockPage = Int(page) Then
			Response.Write "<span style='font-size:9pt;color:#595959'><b>["& BlockPage &"]</b></font>&nbsp;&nbsp;"
		Else
			Response.Write "<a href=" & PageName & "?" & Param & "page="& BlockPage &"><span style='font-size:9pt;color:#595959'>["& BlockPage &"]</a>&nbsp;&nbsp;"
		End If
		BlockPage = BlockPage + 1
		i = i + 1
	Loop

	'다음페이지1개
	If Int(page) < TotalPageCount Then
		Response.Write "<a href=" & PageName & "?" & Param & "page="& page + 1 &">다음</a>&nbsp;&nbsp;"
	Else
		Response.Write "다음&nbsp;"
	End If

	'다음10페이지
	If BlockPage <= TotalPageCount Then
		Response.Write "<a href=" & PageName & "?" & Param & "page="& BlockPage &"><img src='img/icon_03.gif' width='6' height='16'></a>"
	Else
		Response.Write "<img src='img/icon_03.gif' width='6' height='16'>"
	End If
	

End Sub


%>
