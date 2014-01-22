<STYLE TYPE="text/css">
 .lined   { border:1 solid black; }
</STYLE>
<BODY>
<DIV ALIGN="center">
<FORM NAME="UserGroup(%cmd.db)" METHOD="post" ACTION="./ezmem.cgi">
<INPUT TYPE="hidden" NAME="act"  VALUE="save">
<TABLE BGCOLOR="#000000" BORDER="0" CELLSPACING="1" CELLPADDING="0"><TR><TD>
<TABLE BGCOLOR="#000000" WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="3">
  <TR>
    <TD><FONT COLOR="#FFFFFF"><INPUT TYPE="text" NAME="db" VALUE="(%cmd.db)" SIZE="12" CLASS="lined"> : <B>(@.user)</B> line(s)</FONT></TD>
    <TD ALIGN="right"><INPUT TYPE="submit" VALUE=" Àú  Àå " CLASS="lined"></TD>
  </TR>
</TABLE>
<TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0"><TR><TD>
  <TR><TD>
    <TEXTAREA NAME="userlist" COLS="40" ROWS="20" WRAP="off" CLASS="lined">(@user.)</TEXTAREA>
  </TD></TR>
</TABLE>
</TD></TR></TABLE>
</FORM>
</DIV>
</BODY>
