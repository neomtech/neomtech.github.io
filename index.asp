<!--#include virtual="/common/dbCon.asp"-->
<HTML>
<HEAD>
<TITLE> 네오엠텍 홈페이지에 오신것을 환영합니다.</TITLE>
<LINK HREF="font.css" REL="StyleSheet" TYPE="text/css">


<script language="JavaScript">
<!-- javascript

/*
function notice_getcookie( name ){
    var nameOfcookie = name + "=";
    var x = 0;
    while ( x <= document.cookie.length )
    {
            var y = (x+nameOfcookie.length);
            if ( document.cookie.substring( x, y ) == nameOfcookie ) {
                    if ( (endOfcookie=document.cookie.indexOf( ";", y )) == -1 )
                            endOfcookie = document.cookie.length;
                    return unescape( document.cookie.substring( y, endOfcookie ) );
            }
            x = document.cookie.indexOf( " ", x ) + 1;
            if ( x == 0 )
                    break;
    }
    return "";
}
if ( notice_getcookie( "Notice" ) != "done" )
{
        window.open('popup.html','1','width=414,height=500,top=0,left=0'); // 팝업윈도우의 경로와 크기
}
*/ 
// -->
</script>
</HEAD>

<BODY BGCOLOR="#FFFFFF" topmargin=0 leftmargin=0 marginwidth=0 marginheight=0>


<!-- 탑메뉴 시작 -->
<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=100% class="doc">
	<TR>
		<TD background="images/back_top.gif"><iframe name="header" scrolling="NO" frameborder="NO" noresize src="header.html" width=980 height=99></iframe></TD>
	</TR>
</TABLE>
<!-- 탑메뉴 끝 -->

<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=100% class="doc">
	<TR>
		<TD HEIGHT=5 BGCOLOR="#E7E7E7"></TD>
	</TR>
	<TR>
		<TD background="images/back_m_left_1.gif">
		<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=980 class="doc">
			<TR>
				<TD WIDTH=80 background="images/back_m_left.gif" align=center valign=bottom><IMG SRC="images/menu_left.gif" ALT="" WIDTH="60" BORDER=0 usemap="#left_menu"><br><br></TD>
				<TD WIDTH=900><IMG SRC="images/m_img.gif" WIDTH="900" HEIGHT="328" BORDER=0 ALT=""></TD>
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
				<br>

				<TD WIDTH="79" valign="top"><br>
				<!--
					<a href="http://www.neomtech.com/solution/dc.html" onClick="javascript:{window.open('popup.html','1','width=414,height=570,top=0,left=0')};">
					<img src="images/maindc.gif" border =0></a>&nbsp;
					--> 
				</TD>
				<TD WIDTH="1" BGCOLOR="#E7E7E7"></TD>
				<TD WIDTH="900">
				
				<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0>
					<TR>
						<TD HEIGHT=20></TD>
					</TR>
				</TABLE>
				<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=900 class="doc">
					<TR>
						<TD WIDTH="317" align=center valign=top>
						<!-- 공지사항 시작 -->
						<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=280 class="doc">
							<TR>
								<TD><a href="/news/news_list.asp?nPage=1">
								<!--
								<IMG SRC="images/m_title_01.gif" WIDTH="280" HEIGHT="29" BORDER=0 ALT="">
								--> 
								<IMG SRC="images/notice.jpg" WIDTH="280" HEIGHT="29" BORDER=0 ALT="">
								</a></TD>
							</TR>
							<TR>
								<TD HEIGHT="15"></TD>
							</TR>
							<TR>
								<TD><IMG SRC="images/m_title_01_1.gif" WIDTH="280" HEIGHT="80" BORDER=0 ALT=""></TD>
							</TR>
							<TR>
								<TD HEIGHT="10"></TD>
							</TR>
							<TR>
								<TD valign=top>
			<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=280 class="doc">
			<%
			dbCon.Open
			Sql="Select Top 5 * From neo_notice Order by View_Date Desc"
			Set Rs=dbCon.Execute(Sql)
			%>
			<%
			If Rs.Eof Then
			%>
			<tr>
				<TD HEIGHT="24" WIDTH="15"><IMG SRC="images/m_bull_01.gif" WIDTH="4" HEIGHT="4" BORDER=0 ALT=""></TD>										
					 <TD>공지사항이 없습니다.</TD>
			</tr>
			<%
			Else 
			Do Until Rs.eof or i > PageSize
				'################긴제목 처리  #####################
				If len(Rs("Title")) > 29 Then
					Title = Left(Rs("Title"),27) + "..."
				Else
					Title=Rs("Title")
				End if
			%> 
				<TR>
					<TD HEIGHT="24" WIDTH="15"><IMG SRC="images/m_bull_01.gif" WIDTH="4" HEIGHT="4" BORDER=0 ALT=""></TD>										
					 <TD><a href="/news/news_view.asp?idx_num=<%=Rs("idx_num")%>&nPage=1"><%=Title%></a>
					 <!--
					 [<%=Formatdatetime(Rs("reg_date"),2)%>] --> 
					 </TD>
				</TR>
			<%			
			Rs.Movenext
			Loop
			End If
			Rs.Close
			Set Rs=Nothing
			dbCon.Close()
			%> 
			</TABLE>
								</TD>
							</TR>
						</TABLE>
						<!-- 공지사항 끝 -->

						</TD>
						<TD WIDTH="3"><IMG SRC="images/m_line_02.gif" WIDTH="3" HEIGHT="267" BORDER=0 ALT=""></TD>
						<TD WIDTH="317" align=center valign=top>

						<!-- 공지사항 시작 -->
						<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=280 class="doc">
							<TR>
								<TD><a href="/news/notice_list.asp?nPage=1">
								<!--
								<IMG SRC="images/m_title_02.gif" WIDTH="280" HEIGHT="29" BORDER=0 ALT="">
								--> 
								<IMG SRC="images/news.jpg" WIDTH="280" HEIGHT="29" BORDER=0 ALT="">
								
								</a></TD>
							</TR>
							<TR>
								<TD HEIGHT="15"></TD>
							</TR>
							<TR>
								<TD><IMG SRC="images/m_title_02_1.gif" WIDTH="280" HEIGHT="80" BORDER=0 ALT=""></TD>
							</TR>
							<TR>
								<TD HEIGHT="10"></TD>
							</TR>
							<TR>
								<TD valign=top>
			<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH=280 class="doc">
			<%
			dbCon.Open
			Sql="Select Top 5 * From neo_press Order by reg_date Desc"
			Set Rs=dbCon.Execute(Sql)
			%>
			<%
			If Rs.Eof Then
			%>
			<tr>
				<TD HEIGHT="24" WIDTH="15"><IMG SRC="images/m_bull_01.gif" WIDTH="4" HEIGHT="4" BORDER=0 ALT=""></TD>										
					 <TD>보도자료가 없습니다.</TD>
			</tr>
			<%
			Else
			Do Until Rs.eof or i > PageSize
				'################긴제목 처리  #####################
				If len(Rs("subject")) > 29 Then
					Title = Left(Rs("subject"),27) + "..."
				Else
					Title=Rs("subject")
				End if
			%> 
				<TR>
					<TD HEIGHT="24" WIDTH="15"><IMG SRC="images/m_bull_01.gif" WIDTH="4" HEIGHT="4" BORDER=0 ALT=""></TD>
					<TD><a href='/news/notice_view.asp?idx_num=<%=Rs("idx_num")%>&nPage=1'>
			<%=Title%></a>
			<!--
			[<%=Formatdatetime(Rs("reg_date"),2)%>] --> 
			</TD>
				</TR>
			<%
			Rs.Movenext
			Loop
			End IF
			Rs.Close
			Set Rs=Nothing
			dbCon.Close()
			%> 
			</TABLE>
								</TD>
							</TR>
						</TABLE>
						<!-- 공지사항 끝 -->
						
						</TD>
						<TD WIDTH="3"><IMG SRC="images/m_line_02.gif" WIDTH="3" HEIGHT="267" BORDER=0 ALT=""></TD>
						<TD WIDTH="260" align=right>
						<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH="243">
							<TR>
								<TD><IMG SRC="images/m_ss_title.gif" WIDTH="243" HEIGHT="29" BORDER=0 ALT=""></TD>
							</TR>
							<TR>
								<TD><a href="solution/mts.html"><IMG SRC="images/m_ss_01.gif" BORDER=0 ALT=""></a></TD>
							</TR>
							<TR>
								<TD><a href="solution/study.html"><IMG SRC="images/m_ss_02.gif" BORDER=0 ALT=""></a></TD>
							</TR>
							<TR>
								<TD><a href="solution/face.html"><IMG SRC="images/m_ss_03_1.gif" BORDER=0 ALT=""></TD>
							</TR>
							<TR>
								<TD><IMG SRC="images/m_ss_line.gif" BORDER=0 ALT=""></TD>
							</TR>

							<TR>
								<TD HEIGHT="10"></TD>
							</TR>
							<TR>
								<TD><a href="service/bank.html"><IMG SRC="images/m_ss_04.gif" BORDER=0 ALT=""></a></TD>
							</TR>
							<TR>
								<TD HEIGHT="5"></TD>
							</TR>
							<TR>
								<TD><a href="service/giro.html"><IMG SRC="images/m_ss_05.gif" BORDER=0 ALT=""></a></TD>
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
		<TD><iframe name="footer" scrolling="NO" frameborder="NO" noresize src="footer.html" width=980 height=50></iframe></TD>
	</TR>
</TABLE>
<!-- 하단메뉴 끝 -->
<map name="left_menu" id="left_menu">
  <area shape="rect" coords="2,6,58,23" href="partner/list.html" alt="파트너">
</map>
</BODY>
</HTML>
