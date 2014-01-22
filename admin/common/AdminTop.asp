	<!doctype html public '-//W3C//DTD HTML 4.0 Transitional//EN'>
	<html>
	<head>
		<title> (주)아이엠제이코리아 관리자모드 </title>
		<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>
		<link rel='stylesheet' type='text/css' href='/mlb/admin/common/common.css'>
	</head>

	<body leftmargin=15 topmargin=15 marginwidth=15 marginheight=15 >

	<table width=100% height=100% cellspacing=0 cellpadding=0 border=0>
	<tr>
		<td align=center valign=top height=100%>




			<table width=870 height=100% cellspacing=1 cellpadding=0 border=0 bgcolor=#000000>
			<tr>

				<td width=170 height=100% align=center valign=top bgcolor=#F4F4F4>
				

					<!-- 로그인 및 메뉴 table -->	
					<table width=170 height=100% cellspacing=0 cellpadding=0 border=0 align=center>
					<tr>
						<td width=170 height=55 align=center bgcolor=#1A3F58 style='line-height:13pt'>
							<font color=#FFFFFF><b>관리자</b> | 전체관리자<br>
							<span class='small'>webmaster@mlb.co.kr</span>
							</font>
						</td>
					</tr>
					<tr>
						<td width=170 height=25 align=center bgcolor=#637F97>
							<a href='/mlb/admin/admin/AdUp.jsp?id=<%=ADMIN_ID%>' class='link'><font color=#FFFFFF>정보변경</font></a> | <a href='/mlb/admin/logout.jsp' class='link'><font color=#FFFFFF>로그아웃</font></a></font>
						</td>
					</tr>
					<tr>
						<td width=170 height=1 bgcolor=#000000></td>
					</tr>
					<tr>
						<td width=170 height=5></td>
					</tr>
		


					<tr>
						<td width=170 height=22>
							<img src='/mlb/admin/img/arrow1.gif' width=10 height=8 border=0 align=absmiddle>
							<a href='/mlb/admin/admin/AdminList.jsp' class='menu'>서브관리자 관리</a>
						</td>
					</tr>
		
		
					<tr>
						<td></td>
					</tr>
					</table>
					<!-- 로그인 및 메뉴 table end -->	

				
					</td>

				</td>

				<td width=700 align=center valign=top bgcolor=#FFFFFF>

					<table width=100% height=7 cellspacing=0 cellpadding=0 border=0 align=center>
					<tr>
						<td width=100% height=7 align=center bgcolor=#1A3F58></td>
					</tr>
					</table>

					<table width=650 border=0 cellspacing=1 cellpadding=0>
					<tr>
						<td colspan=2 height=10></td>
					</tr>
					<tr>
						<td width=450 height=35>
							현재위치 : <span class='ublue'><b>관리자메인</b></span>
						</td>
						<td width=200 height=35 align=right>
							&nbsp;<b>MLB Korea</b>
						</td>
					</tr>
					</table>


<%
if(rsTp!=null) rsTp.close();
if (stmtTp !=null ) stmtTp.close();



if ( con != null ) {
 	pool.freeConnection(con);
} 

%>