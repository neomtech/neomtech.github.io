<!--#include virtual="/admin/common/AdminCheck.asp"-->
<!--#include virtual="/admin/common/admin_info.asp"-->
<!--#include virtual="/admin/common/top.asp"-->
<%
Dim TableName , idx_num , Search , Keyword , Page

TableName = Request("TableName")
Page = Request("Page")
Search = Request("Search")
Keyword = Request("Keyword")
idx_num = Request("idx_num")

dbCon.Open
Sql = "Select * From "&TableName&" Where idx_num = "&idx_num
Set Rs = dbCon.Execute(Sql)

User_Name = Rs("User_Name")
User_Email = Rs("User_mail")
Subject = Rs("Title")
htmlYn = Rs("HTML_YN")
Content = Rs("Content")
View_Date = Split(Rs("View_Date"),"-")

Rs.Close
Set Rs = Nothing
dbCon.Close

%>
<SCRIPT LANGUAGE="JavaScript">
<!--

var frm;
	
	function window.onload()
	{
		frm = document.frmDiary;
	}
	
	function SelectChage()
	{
		var ssMonth;
		var ssYear;
		var ssDay;
		var sfsDay;
		
		ssYear = frm.idYear.value;
		ssMonth = frm.idMonth.value;
		
		if(ssMonth==4 || ssMonth==6 || ssMonth==9 || ssMonth==11)
		{
			// 4월 6월 9월 11월이면 월말값은 30일
			ssDay=30;
		}else
		{
			if(ssMonth==2 && ((ssYear % 4) != 0))
			{
				//2월이고  년도를 4로 나눈 값이 0이 아니면 28일
				ssDay=28;
			}else
			{
				if(ssMonth==2 && ((ssYear % 4) == 0))
				{
					//윤달 계산
					if((ssYear % 100) == 0)
					{
						if((ssYear % 400) == 0){ssDay = 29;}else{ssDay = 28;}	
					}else
					{
						ssDay = 29;
					}
				}else
				{
					ssDay = 31;
				}
			}
		}

		sfsDay = frm.idDay.length
		if(sfsDay < ssDay)
		{
			for(i=1;i<(ssDay-sfsDay+1);i++)
			{
				addselect(sfsDay+i);
			}
		}else
		{
			frm.idDay.length=ssDay;	//날짜를 맞춘다.
		}
	}

	function reseted()
	{
		frm.reset();
		return false;
	}

	function SubmitCheck(){
		if (frm.user_name.value == ""){
			alert("이름을 입력해 주세요.");
			frm.user_name.focus();
			return false;
		}

		if (frm.user_email.value == ""){
			alert("이메일을 입력해 주세요.");
			frm.user_email.focus();
			return false;
		}

		if (frm.subject.value == ""){
			alert("제목을 입력해 주세요.");
			frm.subject.focus();
			return false;
		}
		
		if(frm.content.value==""){
			alert("내용을 입력해 주세요.");
			frm.content.focus();
			return false;
		}
		
		//frm.action="processDiary.asp";
		//frm.submit();
		//return false;
		return true;
	}

	function addselect(iDay){
		var oOption = document.createElement("OPTION");
			oOption.text="" + iDay + "일";
			oOption.value="" + iDay;
			document.all.frmDiary.idDay.add(oOption);
	}





/*
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
*/
//-->
</SCRIPT>



<table width=650 border=0 cellspacing=1 cellpadding=0 bgcolor=#000000>
<form name="frmDiary" method="post" action="Board_EditOk.asp" onsubmit="return SubmitCheck(this.form);" enctype="multipart/form-data">
<input type="hidden" name="TableName" value="<%=TableName%>">
<input type="hidden" name="idx_num" value="<%=idx_num%>">
<input type="hidden" name="Search" value="<%=Search%>">
<input type="hidden" name="Keyword" value="<%=Keyword%>">
<input type="hidden" name="Page" value="<%=Page%>">


<tr>
	<td width=70 height=28 align=center bgcolor=#D0DCE4><b>작성자</b></td>
	<td width=580 bgcolor=#FFFFFF>&nbsp; <input type="text" size=30 name="user_name" value="<%=User_Name%>"></td>
</tr>

<tr>
	<td width=70 height=28 align=center bgcolor=#D0DCE4><b>E-Mail</b></td>
	<td width=580 bgcolor=#FFFFFF>
		&nbsp; <input type=text name='user_email' size=40 maxlength=50 value="<%=User_Email%>"></td>
</tr>
<tr>
	<td width=70 height=28 align=center bgcolor=#D0DCE4><b>등록형식</b></td>
	<td width=580 bgcolor=#FFFFFF>
		&nbsp; <input type=radio name='html_yn' value="Y" <% If htmlYn = "Y" Then Response.Write("checked") End If%>> HTML
		&nbsp; <input type=radio name='html_yn' value="N" <% If htmlYn = "N" Then Response.Write("checked") End If%>> TEXT
		</td>
</tr>
<tr>
	<td width=70 height=28 align=center bgcolor=#D0DCE4><b>등록일 <br>선택</b></td>
	<td width=580 bgcolor=#FFFFFF>&nbsp; 
			<select name="idYear" onchange="javascript: SelectChage();">
			<%
			For i = 2004 To 2020
			%>
				<option value="<%=i%>" <%IF Trim(i) = trim(View_date(0)) Then%>selected<%End IF%>><%=i%>년 </option>
			<%
			Next
			%>

			</select>

			<select name="idMonth" onchange="javascript: SelectChage();">
			<%
			For j = 1 To 12
				IF j < 10 Then
					j = "0"&j
				End IF
			%>
				<option value="<%=j%>" <%IF Trim(j) = Trim(View_Date(1)) Then%>selected<%End IF%>><%=j%>월 </option>

			<%
			Next
			%>
			</select>

			<select name="idDay">
				<option value="01" <%IF Trim(View_Date(2)) = "01" Then%>selected<%End IF%>>1일 </option>
				<option value="02" <%IF Trim(View_Date(2)) = "02" Then%>selected<%End IF%>>2일 </option>
				<option value="03" <%IF Trim(View_Date(2)) = "03" Then%>selected<%End IF%>>3일 </option>
				<option value="04" <%IF Trim(View_Date(2)) = "04" Then%>selected<%End IF%>>4일 </option>
				<option value="05" <%IF Trim(View_Date(2)) = "05" Then%>selected<%End IF%>>5일 </option>
				<option value="06" <%IF Trim(View_Date(2)) = "06" Then%>selected<%End IF%>>6일 </option>
				<option value="07" <%IF Trim(View_Date(2)) = "07" Then%>selected<%End IF%>>7일 </option>
				<option value="08" <%IF Trim(View_Date(2)) = "08" Then%>selected<%End IF%>>8일 </option>
				<option value="09" <%IF Trim(View_Date(2)) = "09" Then%>selected<%End IF%>>9일 </option>
				<option value="10" <%IF Trim(View_Date(2)) = "10" Then%>selected<%End IF%>>10일 </option>
				<option value="11" <%IF Trim(View_Date(2)) = "11" Then%>selected<%End IF%>>11일 </option>
				<option value="12" <%IF Trim(View_Date(2)) = "12" Then%>selected<%End IF%>>12일 </option>
				<option value="13" <%IF Trim(View_Date(2)) = "13" Then%>selected<%End IF%>>13일 </option>
				<option value="14" <%IF Trim(View_Date(2)) = "14" Then%>selected<%End IF%>>14일 </option>
				<option value="15" <%IF Trim(View_Date(2)) = "15" Then%>selected<%End IF%>>15일 </option>
				<option value="16" <%IF Trim(View_Date(2)) = "16" Then%>selected<%End IF%>>16일 </option>
				<option value="17" <%IF Trim(View_Date(2)) = "17" Then%>selected<%End IF%>>17일 </option>
				<option value="18" <%IF Trim(View_Date(2)) = "18" Then%>selected<%End IF%>>18일 </option>
				<option value="19" <%IF Trim(View_Date(2)) = "19" Then%>selected<%End IF%>>19일 </option>
				<option value="20" <%IF Trim(View_Date(2)) = "20" Then%>selected<%End IF%>>20일 </option>
				<option value="21" <%IF Trim(View_Date(2)) = "21" Then%>selected<%End IF%>>21일 </option>
				<option value="22" <%IF Trim(View_Date(2)) = "22" Then%>selected<%End IF%>>22일 </option>
				<option value="23" <%IF Trim(View_Date(2)) = "23" Then%>selected<%End IF%>>23일 </option>
				<option value="24" <%IF Trim(View_Date(2)) = "24" Then%>selected<%End IF%>>24일 </option>
				<option value="25" <%IF Trim(View_Date(2)) = "25" Then%>selected<%End IF%>>25일 </option>
				<option value="26" <%IF Trim(View_Date(2)) = "26" Then%>selected<%End IF%>>26일 </option>
				<option value="27" <%IF Trim(View_Date(2)) = "27" Then%>selected<%End IF%>>27일 </option>
				<option value="28" <%IF Trim(View_Date(2)) = "28" Then%>selected<%End IF%>>28일 </option>
				<option value="29" <%IF Trim(View_Date(2)) = "29" Then%>selected<%End IF%>>29일 </option>
				<option value="30" <%IF Trim(View_Date(2)) = "30" Then%>selected<%End IF%>>30일 </option>
				<option value="31" <%IF Trim(View_Date(2)) = "31" Then%>selected<%End IF%>>31일 </option>
			</select>


	</td>
</tr>
<tr>
	<td width=70 height=28 align=center bgcolor=#D0DCE4><b>제목</b></td>
	<td width=580 bgcolor=#FFFFFF>
		&nbsp; <input type=text name='subject' size=50 value="<%=Subject%>">
		</td>
</tr>
<tr>
	<td width=70 height=28 align=center bgcolor=#D0DCE4><b>내용</b></td>
	<td width=580 bgcolor=#FFFFFF>
		&nbsp; <textarea name='content' cols=40 rows=8 style='width:500px;height:230px'><%=Content%></textarea></td>
</tr>

<tr>
	<td width=70 height=28 align=center bgcolor=#D0DCE4><b>첨부파일</b></td>
	<td width=580 bgcolor=#FFFFFF>
		&nbsp; <input type=file name='add_file' style='width:300px'> (수정시에만 선택)
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
		<a href='Board_List.asp?TableName=<%=TableName%>&Page=<%=Page%>&Search=<%=Search%>&Keyword=<%=Keyword%>'><img src='/admin/images/icon_list2.gif' width=61 height=19 border=0 align=absmiddle></a>
	</td>
</tr>
</form>
</table>

<!--#include virtual="/admin/common/bottom.asp"-->
