<!-- #include virtual="/admin/common/AdminCheck.asp" -->
<!-- #include virtual="/admin/common/admin_info.asp" -->
<!-- #include virtual="/common/dbCon.asp" -->
	<html>
	<head>
		<title> 관리자</title>
		<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>
		<meta name='Generator' content='EditPlus'>
		<meta name='Author' content=''>
		<meta name='Keywords' content=''>
		<meta name='Description' content=''>
		<link rel='stylesheet' type='text/css' href='/admin/common/common.css'>
		<script language='javascript' src='/common/js/openwin.js'></script>
	</head>

	<body leftmargin=15 topmargin=15 marginwidth=15 marginheight=15>

	<table width=100% height=100% cellspacing=0 cellpadding=0 border=0>
	<tr>
		<td align=center valign=top height=100%>

			<table width=870 height=100% cellspacing=1 cellpadding=0 border=0 bgcolor=#000000>
			<tr>


				<td width=170 height=100% align=center valign=top bgcolor=#F4F4F4>

					<table width=170 height=100% cellspacing=0 cellpadding=0 border=0 align=center>
					<tr>
						<td width=170 height=55 align=center bgcolor=#1A3F58 style='line-height:13pt'>
							<font color=#FFFFFF><b><%=AdminName%></b><br>
							<span class='small'><%=AdminEmail%></span>
							</font>
						</td>
					</tr>
					<tr>
						<td width=170 height=25 align=center bgcolor=#637F97>
							<a href='/admin/common/Logout.asp' class='link'><font color=#FFFFFF>로그아웃</font></a></font>
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
							<img src='/admin/images/arrow.gif' width=15 height=9 border=0 align=absmiddle>
							<a href='/admin/News/Board_List.asp?tableName=neo_notice' class='menu'>공지사항 관리</a>
						</td>
					</tr>
					<tr>
						<td width=170 height=22>
							<img src='/admin/images/arrow.gif' width=15 height=9 border=0 align=absmiddle>
							<a href='/admin/Press/Board_List.asp?tableName=neo_press' class='menu'>보도자료 관리</a>
						</td>
					</tr>
					<tr>
						<td></td>
					</tr>
					</table>

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
							현재위치 : <span class='ublue'><b>관리자 메뉴</b></span>
						</td>
						<td width=200 height=35 align=right>
						</td>
					</tr>
					</table>

					<!-- CONTENT --------------------------------------------------------------------->