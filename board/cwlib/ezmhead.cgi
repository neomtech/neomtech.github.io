<STYLE TYPE="text/css">
 .box     { border:1 solid black; }
 .uline   { border:1 solid black; }
 .noline  { border:1 solid (%cfg.CfgBkCol); }
</STYLE>
<BODY>
<DIV ALIGN="center">
<FORM NAME="MemberList" METHOD="post" ACTION="./ezmem.cgi">
<INPUT TYPE="hidden" NAME="act"  VALUE="">
<INPUT TYPE="hidden" NAME="uid"  VALUE="">
<INPUT TYPE="hidden" NAME="page" VALUE="(%cmd.page)">
<INPUT TYPE="hidden" NAME="db"   VALUE="(%cmd.db)">
<TABLE BGCOLOR="#000000" WIDTH="95%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
  <TR BGCOLOR="#FFFFFF">
    <TD>(%cmd.db)</TD>
    <TD ALIGN="right" COLSPAN="2">(%user.allow) 명 승인 / (%.member) 명 대기중</TD>
  </TR>
  <TR><TD COLSPAN="3">
<TABLE BGCOLOR="#000000" WIDTH="100%" BORDER="0" CELLSPACING="1" CELLPADDING="3">
  <TR BGCOLOR="#CCCCFF">
    <TD ALIGN="center" nowrap>번호</TD>
    <TD BGCOLOR="#000099" ALIGN="center" nowrap><FONT COLOR="#FFFFFF"><B>아이디</B></FONT></TD>
    <TD ALIGN="center" nowrap>비밀번호</TD>
    <TD ALIGN="center" nowrap>이름</TD>
    <TD ALIGN="center" WIDTH="50%">이메일</TD>
    <TD ALIGN="center" WIDTH="50%">홈페이지</TD>
    <TD ALIGN="center" nowrap>&nbsp;</TD>
  </TR>
