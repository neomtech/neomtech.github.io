<HTML>
<HEAD>
<TITLE>네오엠텍 어드</TITLE>
<META http-equiv="Content-Type" content="text/html">
<link href="http://www.koreaedu.com/Asp/Guide/ImportFile/guide.css" rel="stylesheet" type="text/css">
</HEAD>
<script language='javascript'>
<!--
	function SetFocus() {
		document.form.login_id.focus();
		return; 
	}

	function keyDown() { 
		var keyValue = event.keyCode; 
		if(keyValue==13) checkForm();
	}

	function checkForm() {
		if (document.form.login_id.value.length == 0) {
			alert('아이디를 입력하세요');
			document.form.login_id.focus();
			return false;
		}
		if (document.form.login_passwd.value.length == 0) {
			alert('비밀번호를 입력하세요');
			document.form.login_passwd.focus();
			return false;
		}
			document.form.submit();
	}
	//-->
</script>
<BODY BGCOLOR="#FFFFFF" leftmargin="0" topmargin="0" marginwidth=0 marginheight=0>

<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=100% HEIGHT=100%>
	<TR>
		<TD align=center>
		<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=434>
			<TR>
				<TD><FONT COLOR="#006699"><B>네오엠텍 어드민</B></FONT></TD>
			</TR>
		</TABLE>
		<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=434>
			<TR>
				<TD COLSPAN=5 WIDTH=146 HEIGHT=7><IMG SRC="image/login2_1.gif" WIDTH=146 HEIGHT=7 BORDER=0></TD>
				<TD COLSPAN=2 WIDTH=281 HEIGHT=7><IMG SRC="image/login2_2.gif" WIDTH=281 HEIGHT=7 BORDER=0></TD>
				<TD WIDTH=7 HEIGHT=7><IMG SRC="image/login2_3.gif" WIDTH=7 HEIGHT=7 BORDER=0></TD>
			</TR>
			<TR>
				<TD ROWSPAN=4 WIDTH=7 HEIGHT=159><IMG SRC="image/login3_1.gif" WIDTH=7 HEIGHT=159 BORDER=0></TD>
				<TD COLSPAN=4 WIDTH=139 HEIGHT=21></TD>
				<TD COLSPAN=2 WIDTH=281 HEIGHT=21></TD>
				<TD ROWSPAN=4 WIDTH=7 HEIGHT=159><IMG SRC="image/login3_4.gif" WIDTH=7 HEIGHT=159 BORDER=0></TD>
			</TR>
			<TR>
				<TD ROWSPAN=3 WIDTH=13 HEIGHT=138></TD>		
				<TD WIDTH=107 HEIGHT=16></TD>		
				<TD ROWSPAN=3 WIDTH=16 HEIGHT=138></TD>
				<TD ROWSPAN=3 WIDTH=3 HEIGHT=138><IMG SRC="image/login4_4.gif" WIDTH=3 HEIGHT=138 BORDER=0></TD>
				<TD ROWSPAN=3 COLSPAN=2 WIDTH=281 HEIGHT=138>
				<form name='form' method='post' action='Admin_LoginOk.asp' onsubmit='return checkForm()'>
				<!-- 로그인 입력창 시작 -->
				<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=2 align=center>
					<TR>
						<TD><IMG SRC="image/id_id.gif" BORDER=0 ALT=""></TD>
						<TD><input type=text size=15 maxlength=15 name=login_id style='width:120;height:18;'></TD>
					</TR>
					<TR>
						<TD><IMG SRC="image/id_pass.gif" BORDER=0 ALT=""></TD>
						<TD><input type=password size=15 maxlength=15 name=login_passwd style='width:120;height:18;'></TD>
					</TR>
					<TR>
						<TD></TD>
						<TD HEIGHT="5" background="image/line_2.gif"></TD>
					</TR>
					<TR>
						<TD></TD>
						<TD><!--<A HREF="list.html"><IMG SRC="image/butt_login.gif" BORDER=0 ALT=""></A>--><input type=submit value="로그인" name=submit1 ></TD>
					</TR>
					</form>
				</TABLE>
				<!-- 로그인 입력창 끝 -->
				
				</TD>
			</TR>
			<TR>
				<TD WIDTH=107 HEIGHT=105><IMG SRC="image/login5_1.gif" WIDTH=107 HEIGHT=105 BORDER=0></TD>
			</TR>
			<TR>
				<TD WIDTH=107 HEIGHT=17></TD>
			</TR>
			<TR>
				<TD WIDTH=7 HEIGHT=21><IMG SRC="image/login7_1.gif" WIDTH=7 HEIGHT=21 BORDER=0></TD>
				<TD COLSPAN=6 WIDTH=420 HEIGHT=21></TD>
				<TD WIDTH=7 HEIGHT=21><IMG SRC="image/login7_3.gif" WIDTH=7 HEIGHT=21 BORDER=0></TD>
			</TR>
			<TR>
				<TD COLSPAN=8 WIDTH=434 HEIGHT=7><IMG SRC="image/login8_1.gif" WIDTH=434 HEIGHT=7 BORDER=0></TD>
			</TR>
		</TABLE><br><br><br><br><br><br><br><br>
		
		</TD>
	</TR>
</TABLE>
</BODY>
</HTML>
