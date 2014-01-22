<!--#include virtual="/admin/common/AdminCheck.asp"-->
<!--#include virtual="/admin/common/admin_info.asp"-->
<!--#include virtual="/admin/common/top.asp"-->
<%
Dim TableName

TableName = Request("TableName")

%>
<SCRIPT LANGUAGE="JavaScript">
<!--

function SubmitCheck()
{
	if(document.form1.user_name.value == ""){
		alert("이름을 입력하세요");
		document.form1.user_name.focus();
		return false;
	}

	if(document.form1.user_email.value == ""){
		alert("이메일을 입력하세요");
		document.form1.user_email.focus();
		return false;
	}
	if(document.form1.media.value == ""){
		alert("Media를 입력하세요");
		document.form1.media.focus();
		return false;
	}

	if(document.form1.subject.value == ""){
		alert("제목을 입력하세요");
		document.form1.subject.focus();
		return false;
	}

	if(document.form1.content.value == ""){
		alert("내용을 입력하세요");
		document.form1.content.focus();
		return false;
	}

	return true;
}
//-->
</SCRIPT>



<table width=650 border=0 cellspacing=1 cellpadding=0 bgcolor=#000000>
<form name="form1" method="post" action="Board_WriteOk.asp" onsubmit="return SubmitCheck(this.form);" enctype="multipart/form-data">
<input type="hidden" name="TableName" value="<%=TableName%>">
<tr>
	<td width=70 height=28 align=center bgcolor=#D0DCE4><b>작성자</b></td>
	<td width=580 bgcolor=#FFFFFF>&nbsp; <input type="text" name="user_name"></td>
</tr>

<tr>
	<td width=70 height=28 align=center bgcolor=#D0DCE4><b>E-Mail</b></td>
	<td width=580 bgcolor=#FFFFFF>
		&nbsp; <input type=text name='user_email' size=15 maxlength=50 style='width:250px'></td>
</tr>
<tr>
	<td width=70 height=28 align=center bgcolor=#D0DCE4><b>Media</b></td>
	<td width=580 bgcolor=#FFFFFF>
		&nbsp; <input type=text name='media' size=15 maxlength=50 style='width:250px'></td>
</tr>
<tr>
	<td width=70 height=28 align=center bgcolor=#D0DCE4><b>제목</b></td>
	<td width=580 bgcolor=#FFFFFF>
		&nbsp; <input type=text name='subject' size=15 style='width:300px'>
		</td>
</tr>
<tr>
	<td width=70 height=28 align=center bgcolor=#D0DCE4><b>등록형식</b></td>
	<td width=580 bgcolor=#FFFFFF>
		&nbsp; <input type=radio name='html_yn' value="Y"> HTML
		&nbsp; <input type=radio name='html_yn' value="N" checked> TEXT
		</td>
</tr>
<tr>
	<td width=70 height=28 align=center bgcolor=#D0DCE4><b>내용</b></td>
	<td width=580 bgcolor=#FFFFFF>
		&nbsp; <textarea name='content' cols=40 rows=8 style='width:500px;height:230px'></textarea></td>
</tr>

<tr>
	<td width=70 height=28 align=center bgcolor=#D0DCE4><b>첨부파일</b></td>
	<td width=580 bgcolor=#FFFFFF>
		&nbsp; <input type=file name='add_file' size=15 style='width:250px'>
		</td>
</tr>
 
</table>

<table width=650 border=0 cellspacing=1 cellpadding=0>
<tr>
	<td colspan=3 height=4></td>
</tr>
<tr>
	<td width=650 height=25 align=right>
		<input type=image src='/admin/images/icon_regist.gif' width=47 height=19 border=0 align=absmiddle></a>
		<a href='javascript:document.form1.reset()'><img src='/admin/images/icon_reset.gif' width=47 height=19 border=0 align=absmiddle></a>
		<a href='javascript:history.go(-1)'><img src='/admin/images/icon_back.gif' width=61 height=19 border=0 align=absmiddle></a>
		<a href='Board_List.asp?TableName=<%=TableName%>'><img src='/admin/images/icon_list2.gif' width=61 height=19 border=0 align=absmiddle></a>
	</td>
</tr>
</form>
</table>

<!--#include virtual="/admin/common/bottom.asp"-->
