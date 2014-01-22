<!--#include virtual="/common/dbCon.asp"-->
<%
Dim PageSize,nPage,Ctext,TotalCount,Count,index,Cmenu,Rs,sql,Totalpage,i,Title,blockpage,wid

Cmenu=Request("Cmenu")
Ctext=Request("Ctext")

PageSize = 8

nPage = Request("nPage")
If nPage = "" Then
	nPage = 1
Else
	nPage = CInt(nPage)
End If
dbCon.Open
'#################총갯수 구하기#####################
If Ctext = "" Then '검색어가 없으면

	sql="Select Count(idx_num) From neo_notice"

Else '검색어가 있으면
	sql="Select Count(idx_num) From neo_notice where "&Request("Cmenu")&" like '%"&Ctext&"%' "
End if

Set Rs = dbCon.Execute(sql)

TotalCount = Rs(0)
Count = PageSize * nPage
index = TotalCount - Count + PageSize
Rs.Close
Set Rs = Nothing



If Ctext = "" Then '검색어가 없으면

sql="Select Top "&Count&" * From neo_notice Order by View_Date Desc"

Else'검색어가 있으면
	sql="Select Top "& Count &" * From neo_notice where "&Request("Cmenu")&" like '%"&Ctext&"%' Order by View_Date Desc"
End if

Set Rs=Server.CreateObject("ADODB.Recordset")
Rs.Open Sql,dbCon,1
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
				<TD WIDTH="79" valign=top><br><br>
				<!--<a href="http://www.neomtech.com/solution/dc.html" onClick="javascript:{window.open('../popup.html','1','width=414,height=570,top=0,left=0')};">
					<img src="images/maindc.gif" border =0></a>&nbsp;
					--></TD>
				<TD WIDTH="1" BGCOLOR="#E7E7E7"></TD>
				<TD WIDTH="900">
				 
				<TABLE WIDTH="900" BORDER=0 CELLPADDING=0 CELLSPACING=0>
					<TR>
						<TD HEIGHT=5></TD>
					</TR>
					<TR>
						<TD HEIGHT=28 align=right> HOME > Notice & News > News</TD>
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
										<TD><A HREF="/news/news_list.asp?nPage=1"><IMG SRC="images/me_title_01_1.gif" BORDER=0 ALT=""></A></TD>
									</TR>
									<TR>
										<TD><A HREF="/news/notice_list.asp?nPage=1"><IMG SRC="images/me_title_02.gif" BORDER=0 ALT=""></A></TD>
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
								<TD><IMG SRC="images/stitle_01.gif" WIDTH="647" HEIGHT="53" BORDER=0 ALT=""></TD>
							</TR>
							<TR>
								<TD HEIGHT="30"></TD>
							</TR>
						</TABLE>
						<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=600 class="doc" align=center>
							<TR>
								<TD HEIGHT="2" bgcolor="#AAAAAA" colspan=7></TD>
							</TR>
							<TR HEIGHT="30" align=center>
								<TD WIDTH=60><B>번호</B></TD>
								<TD WIDTH=1 valign=bottom><IMG SRC="images/point.gif" WIDTH="1" HEIGHT="10" BORDER=0 ALT=""></TD>
								<TD WIDTH=87>날짜</TD>
								<TD WIDTH=1 valign=bottom><IMG SRC="images/point.gif" WIDTH="1" HEIGHT="10" BORDER=0 ALT=""></TD>
								<TD WIDTH=400>제목</TD>
								<TD WIDTH=1 valign=bottom><IMG SRC="images/point.gif" WIDTH="1" HEIGHT="10" BORDER=0 ALT=""></TD>
								<TD WIDTH=50>조회</TD>
							</TR>
							<TR>
								<TD HEIGHT="2" bgcolor="#AAAAAA" colspan=7></TD>
							</TR>
							<%
							If Not Rs.EOF Then
								Rs.Move PageSize * (nPage - 1)
								TotalPage = TotalCount \ PageSize
									 
								If TotalPage * PageSize <> TotalCount Then
									TotalPage = TotalPage + 1
								End If
							End if


							i=1
							Do Until Rs.eof or i > PageSize

							'Reg_Date = FormatDateTime(Rs("View_date"),2)

							If DateDiff("h",Rs("View_date"),Now()) < 25 Then
								new_data = "<img src='../img/ico_new.gif' width='20' height='9' border='0'>"
							Else
								new_data = ""
							End If

							'################긴제목 처리  #####################
							If len(Rs("Title")) > 29 Then
								Title = Left(Rs("Title"),27) + "..."
							Else
								Title=Rs("Title")
							End if
							%> 
							<TR HEIGHT="28" align=center>
							<TD><%=index%></TD>
							<TD valign=bottom><IMG SRC="images/point.gif" WIDTH="1" HEIGHT="10" BORDER=0 ALT=""></TD>
							<TD><%=Rs("View_Date")%></TD>
							<TD valign=bottom><IMG SRC="images/point.gif" WIDTH="1" HEIGHT="10" BORDER=0 ALT=""></TD>
							<TD style="padding-left:10;" align=left><a href='news_view.asp?idx_num=<%=Rs("idx_num")%>&nPage=<%=nPage%>'><%=Title%></a>&nbsp;&nbsp;<%=new_data%>
							</TD>
							<TD valign=bottom><IMG SRC="images/point.gif" WIDTH="1" HEIGHT="10" BORDER=0 ALT=""></TD>
							<TD><%=Rs("hits")%></TD>
							</TR>
							<%
							i=i+1
							index=index-1
							Rs.Movenext
							Loop
							Rs.Close
							Set Rs=Nothing
							dbCon.Close()
							%> 
							<TR>
								<TD HEIGHT="2" bgcolor="#AAAAAA" colspan=7></TD>
							</TR>
						</TABLE>
						<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=650 class="doc" align=center>
							<TR>
								<TD HEIGHT="20"></TD>
							</TR>
							<TR>
								<TD align=center>
								<%
					'이전10개
					blockpage=int((nPage-1)/10)*10+1
					IF blockpage <> 1 Then
					%>
						<a href="news_list.asp?nPage=<%=blockpage-10%>"><img src="../img/ico_pre.gif" width="32" height="7" border="0"></a>
					<%
					Else
					%>
						<img src="../img/ico_pre.gif" width="32" height="7" border="0">
					<%
					End IF
					%>
					&nbsp;&nbsp;&nbsp;
					<%
					'페이지 바로가기 [1][2][3]
					i=1
					do until i>10 or blockpage >totalpage
						IF blockpage=int(npage) Then
					%> 
							<b><%=blockpage%></b>
						<%
						Else
						%>
							<a href="news_list.asp?npage=<%=blockpage%>"><%=blockpage%></a> 
						<%
						End if

					blockpage=blockpage+1
					i=i+1
					Loop
					%>
							
					&nbsp;&nbsp;&nbsp;
					<%
					'다음10개
					IF blockpage < totalpage Then
					%>
						<a href="news_list.asp?nPage=<%=blockpage%>"><img src="../img/ico_next.gif" width="32" height="7" border="0"></a>
					<%
					Else
					%>
						<img src="../img/ico_next.gif" width="32" height="7" border="0">
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
