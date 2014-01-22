<%
Dim Sql, Rs
Dim page, TotalRecordCount, TotalPageCount, RecordNumber

Sub ProcRecord(PageSize, UniqueField, TableName, SelectField, WhereClause, OrderBy)

	page = Request.QueryString("page")
	If IsNull(page) Or page = "" Then page = 1

	Set Rs = Server.CreateObject("ADODB.Recordset")

	Sql = "Select Count(*) From " & TableName & " Where (" & WhereClause & ")"

	Rs.Open Sql, dbCon, adOpenForwardOnly, adLockReadOnly, adCmdText
	TotalRecordCount = Rs(0)
	TotalPageCount = Int((TotalRecordCount - 1) / PageSize) + 1
	RecordNumber = TotalRecordCount - ((page - 1) * PageSize)
	Rs.Close

	Sql = "Select Top " & PageSize & " " & SelectField & " From " & TableName & " " & _
		"Where (" & WhereClause & ") And " & UniqueField & " Not In (Select Top " & ((page - 1) * PageSize) & " " & UniqueField & " From " & TableName & " " & _
		"Where (" & WhereClause & ") Order by " & OrderBy & ") Order by " & OrderBy & ""
	Rs.CursorLocation = adUseClient

	Rs.Open Sql, dbCon, adOpenForwardOnly, adLockReadOnly, adCmdText

	Set Rs.ActiveConnection = Nothing

End Sub


Sub ProcPaging(Param) '관리자 페이징 일반적으로 사용함

	Dim PageName, BlockSize, BlockPage, i

	PageName = Request.ServerVariables("URL")
	BlockSize = 10
	BlockPage = Int((page-1)/BlockSize)*BlockSize+1

	If BlockPage > 1 Then
		Response.Write "<a href=" & PageName & "?" & Param & "page=" & BlockPage - BlockSize & "><img src='/admin/images/page_prev10.gif' border=0 width=12 height=11 align=absmiddle></a>&nbsp;&nbsp;"
	Else
		Response.Write "<img src='/admin/images/page_prev10off.gif' border=0 width=12 height=11 align=absmiddle>&nbsp;&nbsp;"
	End If

	If Int(page) > 1 Then
		Response.Write "<a href=" & PageName & "?" & Param & "page=" & page - 1 & "><img src='/admin/images/page_prev.gif' border=0 width=12 height=11 align=absmiddle></a>&nbsp;&nbsp;"
	Else
		Response.Write "<img src='/admin/images/page_prevoff.gif' border=0 width=12 height=11 align=absmiddle>&nbsp;&nbsp;"
	End If

	i=1
	Do Until i > BlockSize Or BlockPage > TotalPageCount
		If BlockPage = Int(page) Then
			Response.Write "<span style='font-size:9pt;color:#595959'><b>"& BlockPage &"</b></font>&nbsp;&nbsp;"
		Else
			Response.Write "<a href=" & PageName & "?" & Param & "page="& BlockPage &"><span style='font-size:9pt;color:#595959'>"& BlockPage &"</a>&nbsp;&nbsp;"
		End If
		BlockPage = BlockPage + 1
		i = i + 1
	Loop

	If Int(page) < TotalPageCount Then
		Response.Write "<a href=" & PageName & "?" & Param & "page="& page + 1 &"><img src='/admin/images/page_next.gif' border=0 width=12 height=11 align=absmiddle></a>&nbsp;&nbsp;"
	Else
		Response.Write "<img src='/admin/images/page_nextoff.gif' border=0 width=12 height=11 align=absmiddle>&nbsp;&nbsp;"
	End If

	If BlockPage <= TotalPageCount Then
		Response.Write "<a href=" & PageName & "?" & Param & "page="& BlockPage &"><img src='/admin/images/page_next10.gif' border=0 width=12 height=11 align=absmiddle></a>"
	Else
		Response.Write "<img src='/admin/images/page_next10off.gif' border=0 width=12 height=11 align=absmiddle>"
	End If
	

End Sub


%>
