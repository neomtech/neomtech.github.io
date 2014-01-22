<LINK rel="STYLESHEET" TYPE="text/css" NAME="test" HREF="(%url.ezSys)/image/newpds_msg2/pass.css">
<FORM NAME="PassForm" METHOD="post" ACTION="./ezmem.cgi">
<INPUT TYPE="hidden" NAME="act" VALUE="(%cmd.act)">
<INPUT TYPE="hidden" NAME="db"  VALUE="(%cmd.db)">


<TABLE WIDTH=95% BORDER=0 CELLPADDING=0 CELLSPACING=0>

<TR><TD>
<TABLE WIDTH='300' BORDER=0 CELLPADDING=0 CELLSPACING=0 ALIGN=CENTER>
<TR><TD HEIGHT=20>
<IMG SRC=(%url.ezSys)/image/newpds_msg2/blank.gif border=0 width=1 height=1>
</TD></TR>
<TR><TD BGCOLOR=#5265A5><IMG SRC=(%url.ezSys)/image/newpds_msg2/blank.gif border=0 width=1 height=1></TD></TR>
<TR><TD HEIGHT=30>
<P>
&nbsp;&nbsp;&nbsp;
<b>(%cfg.Title)</b>
</P>
</TD></TR>
<TR><TD BGCOLOR=#5265A5><IMG SRC=(%url.ezSys)/image/newpds_msg2/blank.gif border=0 width=1 height=1></TD></TR>
<TR><TD HEIGHT=100 BGCOLOR=#E1E4F6 align=center>
<TABLE BORDER=0 CELLSPACING=1 CELLPADDING=2>
  <TR>
    <TD ALIGN=right height=10 NOWRAP>비밀번호</TD>
    <TD height=10>
      <INPUT TYPE='password' NAME='pass' VALUE='' SIZE='20' MAXLENGTH='50' CLASS=input>
    </TD>
  </TR>
  <TR>
    <TD ALIGN=right height=10 NOWRAP></TD>
  </TR>
<tr><td colspan=2 align=right height=30>
      <INPUT TYPE=image src='(%url.ezSys)/image/newpds_msg2/ok-bn.gif'>
      <INPUT TYPE=image src='(%url.ezSys)/image/newpds_msg2/back-bn.gif' onclick='javascript:history.back()'>
</td></tr>
</TABLE>
</td></tr>
</TABLE>
</FORM>


<SCRIPT LANGUAGE="JavaScript">
  setTimeout( 'document.PassForm.pass.focus()', 10 );
</SCRIPT>


