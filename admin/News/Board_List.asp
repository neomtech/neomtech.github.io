<!--#include virtual="/admin/common/AdminCheck.asp"-->
<!--#include virtual="/admin/common/admin_info.asp"-->
<!--#include virtual="/admin/common/top.asp"-->
<!--#include virtual="/admin/common/Proc_RecordPaging.asp"-->
<%

Dim PageSize					'Page Size
Dim UniqueField				'unique �ʵ�
Dim TableName				'���̺��
Dim SelectField				'������ Į��
Dim WhereClause				'WHERE ��
Dim OrderBy					'ORDER BY ��
Dim title							'����	
Dim Search						'�˻� ����
Dim keyword					'�˻���

Search=Request("Search")
keyword=Request("keyword")
TableName=Request("tableName")

PageSize = 10

UniqueField = "idx_num"
SelectField = "*"


If Search <> "" Then
	WhereClause = ""& Search &" Like '%"& keyword &"%'"
Else
	WhereClause = "1=1"
End If

OrderBy = "idx_num Desc"

dbcon.open
Call ProcRecord(PageSize, UniqueField, TableName, SelectField, WhereClause, OrderBy )

%>

	<table width=650 border=0 cellspacing=1 cellpadding=0>
	<tr>
		<td width=65 height=23 align=center bgcolor=#637F97><font color=#FFFFFF><b>��ȣ</b></font></td>
		<td width=335 align=center bgcolor=#637F97><font color=#FFFFFF><b>����</b></font></td>
		<td width=80 align=center bgcolor=#637F97><font color=#FFFFFF><b>�̸�</b></font></td>
		<td width=80 align=center bgcolor=#637F97><font color=#FFFFFF><b>�����</b></font></td>
		<td width=45 align=center bgcolor=#637F97><font color=#FFFFFF><b>����</b></font></td>
		<td width=45 align=center bgcolor=#637F97><font color=#FFFFFF><b>����</b></font></td>
	</tr>

<%
	J=1
	Do Until Rs.Eof 
	
		IF j Mod 2 = 0 Then
			bg = "#FFFFFF"
		Else
			bg = "#F4F4F4"
		End IF
		
		Reg_Date = Rs("View_date")

		If DateDiff("h",Rs("reg_date"),Now()) < 25 Then
			new_data = "<img src=/admin/images/new.gif border=0>"
		Else
			new_data = ""
		End If
%>
	<tr align=center>
		<td width=65 height=23 bgcolor=<%=bg%>><b><%=RecordNumber%></b></td>
		<td width=335 bgcolor="<%=bg%>" align="left">
		<a href="Board_Read.asp?TableName=<%=TableName%>&idx_num=<%=Rs("idx_num")%>&Page=<%=Page%>&Search=<%=Search%>&Keyword=<%=Keyword%>"><%=Rs("Title")%>
		</a>&nbsp;<%=new_data%></td>
		<td width=80 bgcolor=<%=bg%>><a href='mailto:<%=Rs("User_mail")%>' class='link'><%=Rs("User_Name")%></a></td>
		<td width=80 align=center bgcolor=<%=bg%>><%=Reg_Date%></td>
		<td width=45 bgcolor=<%=bg%>><a href="Board_Edit.asp?TableName=<%=TableName%>&idx_num=<%=Rs("idx_num")%>&Page=<%=Page%>&Search=<%=Search%>&keyword=<%=keyword%>">[����]</a></td>
		<td width=45 bgcolor=<%=bg%>><a href="Board_Del.asp?TableName=<%=TableName%>&idx_num=<%=Rs("idx_num")%>&Page=<%=Page%>&Search=<%=Search%>&keyword=<%=keyword%>" onClick="return confirm('�����Ͻðڽ��ϱ�?');return true;">[����]</a></td>
	</tr>
<%
		J = J + 1
		RecordNumber = RecordNumber - 1
		Rs.MoveNext
	Loop
	Rs.Close
	Set RS=Nothing
	dbCon.Close
%>


	<table width=650 border=0 cellspacing=1 cellpadding=0>
	<form method='post' name='searchForm' action="Board_List.asp">
	<input type="hidden" name="TableName" value="<%=TableName%>">
	<tr>
		<td colspan=2 height=4 bgcolor='#637F97'></td>
	</tr>
	<tr>
		<td colspan=2 height=4></td>
	</tr>
	<tr>
		<td width=385 height=25>
			<%
				Dim Param
				If Search <> "" Then
					Param = "search="&search&"&TableName="&TableName&"&keyword="&keyword&"&"
				Else
					Param = "TableName="&TableName&"&"
				End If
				
				Call ProcPaging(Param)
			%>
		</td>
		<td width=265 height=25 align=right>
			<select name='Search'>
				<option value='title'>����</option>
				<option value='content'>����</option>
				</select><input type=text size=8 maxlength=30 name='keyword' style='width:100px'>
			<input type=image src='/admin/images/button_search2.gif' width=36 height=19 border=0 align=absmiddle></a>
			&nbsp;<a href='Board_Write.asp?TableName=<%=TableName%>'><img src='/admin/images/icon_regist.gif' width=47 height=19 border=0 align=absmiddle></a>
			
		</td>
	</tr>
	</form>
	</table>

<!--#include virtual="/admin/common/bottom.asp"-->


 
