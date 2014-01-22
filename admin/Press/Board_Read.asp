<!--#include virtual="/admin/common/AdminCheck.asp"-->
<!--#include virtual="/admin/common/admin_info.asp"-->
<!--#include virtual="/admin/common/top.asp"-->
<!--#include virtual="/common/proc_ConvertChar.asp"-->

<%
idx_num = Request("idx_num")
Search = Request("Search")
Keyword = Request("Keyword")
TableName = Request("TableName")
Page = Request("Page")

dbCon.Open

'조회수 증가
Set Rs = dbCon.Execute("Update "&TableName&" Set Hit = hit+1 Where idx_num = "& idx_num &" ")

'원글 내용 가져오기
Sql="Select * From "&TableName&" Where idx_num="&idx_num
Set Rs = dbCon.Execute(Sql)

User_Name = Rs("User_Name")
User_Email = Rs("User_Email")
Subject = ReConvertChar(Rs("Subject"))
htmlYn = Rs("HTML_YN")
If htmlYn = "Y" Then
    Content = ReConvertChar2(Rs("Content"))
Else
    Content = ReConvertChar(Rs("Content"))
End IF    
Reg_date = FormatDateTime(Rs("reg_date"),2)
Hit = Rs("Hit")
User_File = Rs("User_File")

Rs.Close
Set Rs = Nothing



'이전글
IF Search > "" Or Keyword > "" Then
	Sql="Select Max(idx_num) From "&TableName&" Where idx_num < "&idx_num&" and "&Search&" like '%"&Keyword&"%' "
	Set Rs = dbCon.Execute(Sql)
	PrevNum = Rs(0)
Else
	Sql="Select Max(idx_num) From "&TableName&" Where idx_num < "&idx_num
	Set Rs = dbCon.Execute(Sql)
	PrevNum = Rs(0)
End IF

Rs.Close
Set Rs = Nothing

IF Isnull(PrevNum) Then
	Prev_View="<img src='/admin/images/icon_prev2.gif' width=47 height=19 border=0 align=absmiddle>"
Else
	Prev_View="<a href=Board_Read.asp?TableName="&TableName&"&idx_num="&PrevNum&"&Page="&Page&"&Search="&Search&"&Keyword="&Keyword&"><img src='/admin/images/icon_prev2.gif' width=47 height=19 border=0 align=absmiddle></a>"
End IF


'다음글
IF Search > "" Or Keyword > "" Then
	Sql="Select Min(idx_num) From "&TableName&" Where idx_num > "&idx_num&" and "&Search&" like '%"&Keyword&"%' "
	Set Rs = dbCon.Execute(Sql)
	NextNum = Rs(0)
Else
	Sql="Select Min(idx_num) From "&TableName&" Where idx_num > "&idx_num
	Set Rs = dbCon.Execute(Sql)
	NextNum = Rs(0)
End IF

Rs.Close
Set Rs = Nothing

IF Isnull(NextNum) Then
	Next_View="<img src='/admin/images/icon_next2.gif' width=47 height=19 border=0 align=absmiddle>"	
Else
	Next_View="<a href=Board_Read.asp?TableName="&TableName&"&idx_num="&NextNum&"&Page="&Page&"&Search="&Search&"&Keyword="&Keyword&"><img src='/admin/images/icon_next2.gif' width=47 height=19 border=0 align=absmiddle></a>"
End IF

dbCon.Close
%>

<table width=650 border=0 cellspacing=1 cellpadding=0 bgcolor=#000000>
<tr>
	<td width=70 height=23 align=center bgcolor=#D0DCE4><b>글쓴이</b></td>
	<td width=255 bgcolor=#FFFFFF>&nbsp; <%=User_Name%></td>
	<td width=70 align=center bgcolor=#D0DCE4><b>등록일시</b></td>
	<td width=255 bgcolor=#FFFFFF>&nbsp; <%=Reg_Date%></td>
</tr>
<tr>
	<td width=70 height=23 align=center bgcolor=#D0DCE4><b>조회수</b></td>
	<td colspan=3 width=580 bgcolor=#FFFFFF>&nbsp; <%=Hit%></td>
	
</tr>
<tr>
	<td width=70 height=23 align=center bgcolor=#D0DCE4><b>제 &nbsp; 목</b></td>
	<td colspan=3 width=580 bgcolor=#FFFFFF><p style='margin:3px;margin-left:8px'><%=Subject%>
</tr>
<tr>
	<td width=70 height=23 align=center bgcolor=#D0DCE4><b>첨부파일</b></td>
	<td colspan=3 width=580 bgcolor=#FFFFFF>
		<p style='margin-top:3px;margin-bottom:3px'>&nbsp; <a href="Download.asp?FileName=<%=User_File%>&TableName=<%=TableName%>"><%=User_File%></a></p></td>
</tr>
<tr>
	<td colspan=4 bgcolor=#FFFFFF>
		<table width=100% border=0 cellspacing=0 cellpadding=15>
		<tr>
			<td height=170 class='content'>
				<%=Content%>
			</td>
		</tr>
		</table>

	</td>
</tr>
</table>

<table width=650 border=0 cellspacing=1 cellpadding=0>
<form name='nonameForm'>
<tr>
	<td colspan=2 height=4></td>
</tr>
<tr>
	<td width=100 height=25></td>
	<td width=550 height=25 align=right>
	<%=Next_View%>&nbsp;
	<%=Prev_View%>
	<a href="Board_Edit.asp?TableName=<%=TableName%>&idx_num=<%=idx_num%>&Page=<%=Page%>
	&Search=<%=Search%>&Keyword=<%=Keyword%>"><img src='/admin/images/icon_modify.gif' width=47 height=19 border=0 align=absmiddle></a>
	<a href="Board_Del.asp?TableName=<%=TableName%>&idx_num=<%=idx_num%>&Page=<%=Page%>&Search=<%=Search%>&Keyword=<%=Keyword%>" onClick="return confirm('삭제하시겠습니까'); return true;"><img src='/admin/images/icon_delete.gif' width=47 height=19 border=0 align=absmiddle></a>
		<!--
		<a href='Board_Ans.php?idx_num=<?echo $idx_num?>&npage=<?echo $npage?><?echo $param?>'><img src='/admin/images/icon_reply.gif' width=47 height=19 border=0 align=absmiddle></a>-->
		<a href="Board_List.asp?TableName=<%=TableName%>&Page=<%=Page%>&Search=<%=Search%>&Keyword=<%=Keyword%>"><img src='/admin/images/icon_list2.gif' width=61 height=19 border=0 align=absmiddle></a>
	</td>
</tr>
</form>
<tr>
	<td colspan=2 height=25></td>
</tr>
</table>
<!--#include virtual="/admin/common/bottom.asp"-->
