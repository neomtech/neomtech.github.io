<STYLE TYPE="text/css">
 .box     { border:1 solid black; }
 .uline   { border:1 solid black; }
 .noline  { border:1 solid (%cfg.CfgBkCol); }
</STYLE>
<BODY>
<DIV ALIGN="center">
<FORM NAME="MemberList" METHOD="post" ACTION="./ezmem.cgi">
<INPUT TYPE="hidden" NAME="act"  VALUE="">
<INPUT TYPE="hidden" NAME="uid"  VALUE="(%cmd.uid)">
<INPUT TYPE="hidden" NAME="page" VALUE="(%cmd.page)">
<INPUT TYPE="hidden" NAME="db"   VALUE="(%cmd.db)">
<TABLE BGCOLOR="#000000" BORDER="0" CELLSPACING="0" CELLPADDING="0">
  <TR><TD COLSPAN="3">
<TABLE BGCOLOR="#000000" WIDTH="100%" BORDER="0" CELLSPACING="1" CELLPADDING="3">
  <TR BGCOLOR="#FFFFFF">
    <TD ALIGN="center" nowrap>���̵�</TD>
    <TD nowrap>(%user.uid)</TD>
  </TR>
  <TR BGCOLOR="#FFFFFF">
    <TD ALIGN="center" nowrap>��й�ȣ</TD>
    <TD nowrap><INPUT TYPE="text" NAME="upass" VALUE="(%user.upass)" SIZE="8" MAXLENGTH="8" CLASS="box"></TD>
  </TR>
  <TR BGCOLOR="#FFFFFF">
    <TD ALIGN="center" nowrap>�̸�</TD>
    <TD nowrap><INPUT TYPE="text" NAME="uname" VALUE="(%user.uname)" SIZE="16" CLASS="box"></TD>
  </TR>
  <TR BGCOLOR="#FFFFFF">
    <TD ALIGN="center" WIDTH="50%">�̸���</TD>
    <TD nowrap><INPUT TYPE="text" NAME="umail" VALUE="(%user.umail)" SIZE="24" CLASS="box"></TD>
  </TR>
  <TR BGCOLOR="#FFFFFF">
    <TD ALIGN="center" WIDTH="50%">Ȩ������</TD>
    <TD nowrap><INPUT TYPE="text" NAME="uhome" VALUE="(%user.uhome)" SIZE="24" CLASS="box"></TD>
  </TR>
  <TR BGCOLOR="#FFFFFF">
    <TD ALIGN="center" WIDTH="50%">��Ÿ</TD>
    <TD nowrap><TEXTAREA NAME="urest" COLS="22" ROWS="5" CLASS="box">(%user.urest)</TEXTAREA></TD>
  </TR>
  <TR BGCOLOR="#FFFFFF">
    <TD ALIGN="right" COLSPAN="2">
      &nbsp;<A HREF="JavaScript:SubMit('save','(%user.uid)')">����</A> |
      <A HREF="JavaScript:SubMit('del','(%user.uid)')">����</A> |
      <A HREF="JavaScript:this.history.go(-1)">���</A>&nbsp;
    </TD>
  </TR>
</TABLE>
  </TD></TR>
</TABLE>
</FORM>
</DIV>
</BODY>
