<!--#include virtual="/common/dbCon.asp"-->
<!--#include virtual="/common/proc_ConvertChar.asp"-->
<%
Dim idx_num,Ctext,Cmenu,Re,prevnum,nextnum
Dim User_Mail,sql,Rs,Ref,nPage,User_Name,Title,Reg_date,Hits,Content

Idx_Num=Request("Idx_Num")
nPage=Request("nPage")
Ctext=Request("Ctext")
Cmenu=Request("Cmenu")

dbCon.Open
'조회수 증가
Set Rs = dbCon.Execute("Update neo_press Set Hit = Hit+1 Where idx_num = "&idx_num&" ")


'리스트페이지에서 클릭한 제목과 같은글의 내용
Set Rs = dbCon.Execute("Select * From neo_press Where  Idx_Num = "&Idx_Num&" ")

User_Name=Rs("User_Name")
User_Mail=Rs("User_EMail")
Title=Rs("Subject")
Reg_date=Rs("Reg_date")
Hits=Rs("Hit")
htmlYn = Rs("HTML_YN")
If htmlYn = "Y" Then
    Content = ReConvertChar2(Rs("Content"))
Else
    Content = ReConvertChar(Rs("Content"))
End IF    
Media=Rs("Media")
User_File = Rs("User_File")

Rs.Close
Set Rs=Nothing

'이전글 쿼리
Sql="Select Max(idx_num) From neo_press where idx_num < "&idx_num
Set Rs=dbCon.Execute(Sql)
PrevNum=Rs(0)
Rs.Close
Set Rs=Nothing


'다음글 쿼리
Sql="Select Min(idx_num) From neo_press where idx_num > "&idx_num
Set Rs=dbCon.Execute(Sql)
NextNum=Rs(0)
Rs.Close
Set Rs=Nothing

dbCon.Close
%>
<HTML>
<HEAD>
<TITLE> 네오엠텍 홈페이지에 오신것을 환영합니다.</TITLE>
<LINK HREF="../font.css" REL="StyleSheet" TYPE="text/css">
</HEAD>

<BODY BGCOLOR="#FFFFFF" topmargin=0 leftmargin=0 marginwidth=0 marginheight=0>


<!-- 탑메뉴 시작 -->
<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=100% class="doc">
	<TR>
		<TD background="../images/back_top.gif"><iframe name="header" scrolling="NO" frameborder="NO" noresize src="../header.html" frameborder="NO" width=980 height=99 scrolling="no"></iframe></TD>
	</TR>
</TABLE>
<!-- 탑메뉴 끝 -->

<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=100% class="doc">
	<TR>
		<TD HEIGHT=5 BGCOLOR="#E7E7E7"></TD>
	</TR>
	<TR>
		<TD background="images/back_body.gif">
		<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=980 class="doc">
			<TR>
				<TD WIDTH=80 background="../images/back_s_left.gif" align=center valign=bottom><IMG SRC="../images/menu_left.gif" WIDTH="60" BORDER=0 ALT="" usemap="#left_menu"><br><br></TD>

<map name="left_menu" id="left_menu">
  <area shape="rect" coords="2,6,58,23" href="/partner/list.html" alt="파트너">
</map>

				<TD WIDTH=900><IMG SRC="images/news_visual.gif" WIDTH="900" HEIGHT="212" BORDER=0 ALT=""></TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
	<TR>
		<TD HEIGHT=5 BGCOLOR="#E7E7E7"></TD>
	</TR>
	<TR>
		<TD>
		<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=980 class="doc">
			<TR>
				<TD WIDTH="79" valign=top><br><br><!--<a href="http://www.neomtech.com/solution/dc.html" onClick="javascript:{window.open('../popup.html','1','width=414,height=570,top=0,left=0')};">
					<img src="images/maindc.gif" border =0></a>&nbsp;--></TD>
				<TD WIDTH="1" BGCOLOR="#E7E7E7"></TD>
				<TD WIDTH="900">
				 
				<TABLE WIDTH="900" BORDER=0 CELLPADDING=0 CELLSPACING=0>
					<TR>
						<TD HEIGHT=5></TD>
					</TR>
					<TR>
						<TD HEIGHT=28 align=right> HOME > Notice & News > Notice</TD>
					</TR>
					<TR>
						<TD HEIGHT=5></TD>
					</TR>
				</TABLE>
				<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=900 class="doc">
					<TR>
						<TD WIDTH="200" align=center valign=top>
						<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=200 class="doc">
							<TR>
								<TD WIDTH=15 valign=top><IMG SRC="images/line_01.gif" WIDTH="15" HEIGHT="200" BORDER=0 ALT=""></TD>
								<TD WIDTH=184 valign=top>
								<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=148 class="doc">
									<TR>
										<TD><IMG SRC="images/me_title_00.gif" WIDTH="148" HEIGHT="36" BORDER=0 ALT=""></TD>
									</TR>
									<TR>
										<TD><A HREF="/news/news_list.asp?nPage=1"><IMG SRC="images/me_title_01.gif" BORDER=0 ALT=""></A></TD>
									</TR>
									<TR>
										<TD><A HREF="/news/notice_list.asp?nPage=1"><IMG SRC="images/me_title_02_1.gif" BORDER=0 ALT=""></A></TD>
									</TR>
								</TABLE>
								</TD>
								<TD WIDTH=1 background="images/line_02.gif"></TD>
							</TR>
						</TABLE>
						</TD>
						<TD WIDTH="700" align=center valign=top>

						<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=650 class="doc">
							<TR>
								<TD><IMG SRC="images/stitle_02.gif" WIDTH="647" HEIGHT="53" BORDER=0 ALT=""></TD>
							</TR>
							<TR>
								<TD HEIGHT="30"></TD>
							</TR>
						</TABLE>
						<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=600 class="doc" align=center>
							<TR>
								<TD HEIGHT="2" bgcolor="#AAAAAA"></TD>
							</TR>
							<TR>
								<TD>
								<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=600 class="doc" align=center>
									<TR HEIGHT="30">
										<TD>&nbsp;&nbsp;<B>미디어</B> : <%=Media%></TD>
										<TD align=right><B>날짜</B> : <%=Formatdatetime(Reg_date,2)%></TD>
									</TR>
								</TABLE>
								</TD>
							</TR>
							<TR>
								<TD HEIGHT="1" bgcolor="#E6E6E6"></TD>
							</TR>
							<TR>
								<TD>
								<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=600 class="doc" align=center>
									<TR HEIGHT="30">
										<TD>&nbsp;&nbsp;<B>제목</B> : <%=Title%></TD>
									</TR>
								</TABLE>
								</TD>
							</TR>
							<TR>
								<TD HEIGHT="2" bgcolor="#AAAAAA"></TD>
							</TR>
							<TR HEIGHT="28">
								<TD align=center>
								<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=560 class="doc" align=center>
									<TR>
										<TD HEIGHT="15"></TD>
									</TR>
									<TR>
										<TD><%=Content%></TD>
									</TR>
									<TR>
										<TD HEIGHT="15"></TD>
									</TR>
								</TABLE>
								</TD>
							</TR>
							<TR>
								<TD HEIGHT="2" bgcolor="#AAAAAA"></TD>
							</TR>
						</TABLE>
						<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=600 class="doc" align=center>
							<TR>
								<TD HEIGHT="10"></TD>
							</TR>
							<TR>
								<TD align=right><!--<IMG SRC="images/icon_list.gif" WIDTH="61" HEIGHT="22" BORDER=0 ALT="">-->
							<%
							IF PrevNum > "" Then
							%>
								<a href="notice_view.asp?idx_num=<%=PrevNum%>&nPage=<%=nPage%>"><img src="../img/but_prev.gif" width="55" height="19" border="0"> </a>
							<%
							Else
							%>
								<img src="../img/but_prev.gif" width="55" height="19" border="0">
							<%
							End IF
							%>
							<a href="notice_list.asp?nPage=<%=nPage%>"><img src="../img/but_list.gif" width="55" height="19" border="0"></a>
							<%
							IF NextNum > "" Then
							%>
								<a href="notice_view.asp?idx_num=<%=NextNum%>&nPage=<%=nPage%>"><img src="../img/but_next.gif" width="55" height="19" border="0"></a>
							<%
							Else
							%>
								<img src="../img/but_next.gif" width="55" height="19" border="0">
							<%
							End IF
							%>

								</TD>
							</TR>
						</TABLE>
						</TD>
					</TR>
				</TABLE>
				




				<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0>
					<TR>
						<TD HEIGHT=40></TD>
					</TR>
				</TABLE>
				
				</TD>
			</TR>
		</TABLE>

		</TD>
	</TR>
</TABLE>

<!-- 하단메뉴 시작 -->
<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=100% class="doc">
	<TR>
		<TD HEIGHT=1 BGCOLOR="#E7E7E7"></TD>
	</TR>
	<TR>
		<TD><iframe name="footer" scrolling="NO" frameborder="NO" noresize src="../footer.html" frameborder="NO" width=980 height=50 scrolling="no"></iframe></TD>
	</TR>
</TABLE>
<!-- 하단메뉴 끝 -->




</BODY>
</HTML>
