<%
      Option Explicit

      Dim objDBConn, objRs
      Dim strSQL
      Dim intSeq
      Dim strName, strTitle, strContent
      
      intSeq = Request.QueryString("seq")

      Set objDBConn = Server.CreateObject("ADODB.Connection")
      Set objRs = Server.CreateObject("ADODB.RecordSet")

      objDBConn.Open ("Provider=SQLOLEDB;User ID=aip2roukie;Password=jini0211;Initial Catalog=neomtech_com;Data Source=211.43.212.180")

      strSQL = "Select b_name"                    ' objRs(0) - 이름
      strSQL = strSQL & ",b_title"             ' objRs(1) - 제목
      strSQL = strSQL & ",b_content"            ' objRs(2) - 내용
      strSQL = strSQL & " From board"
      strSQL = strSQL & " Where b_idx = " & intSeq

      objRs.Open strSQL, objDBConn

      strName = objRs(0)
      strTitle = objRs(1)
      strContent = objRs(2)
     
      objRs.Close
      Set objRs = nothing
      objDBConn.Close
      Set objDBConn = nothing
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>네오엠텍 관리자</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel='stylesheet' href='style.css' type='text/css'>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name="editForm" method="post" action="edit_ok.asp?seq=<%=intSeq%>">
<table width="652" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
      <td><img src="image/bar_write.gif" width="652" height="121"></td>
  </tr>
  <tr>
    <td><table width="652" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td background="image/title_bg.gif" width="90" height="40" align="center"><img src="image/write_writer.gif" width="53" height="11"></td>
            <td background="image/title_bg.gif" width="236" height="40"><input name="name" type="text" size="26" value="<%=strName%>"></td>
            <td background="image/title_bg.gif" width="90" height="40" align="center"><img src="image/write_pass.gif" width="66" height="11"></td>
            <td background="image/title_bg.gif" width="236" height="40"><input name="pwd" type="password" size="26"></td>
          </tr>
          <tr> 
            <td background="image/title_bg2.gif" width="90" height="35" align="center"><img src="image/write_subject.gif" width="53" height="11"></td>
            <td background="image/title_bg2.gif" height="35" colspan="3"><input name="subject" type="text" size="91" value="<%=strTitle%>"></td>
          </tr>
          <tr> 
            <td width="90" align="center"><img src="image/write_body.gif" width="53" height="11"></td>
            <td colspan="3"><br><textarea name="content" cols="77" rows="12"><%=strContent%></textarea>
              <br>
            </td>
          </tr>
          <tr> 
            <td colspan="4"><img src="image/line.gif" width="652" height="1"></td>
          </tr>
          <!--<tr> 
            <td width="90" align="center"><img src="image/write_file.gif" width="53" height="11"></td>
            <td height="35" colspan="3"><input name="textfield333" type="text" size="70">
              <a href="#" onFocus="blur()"><img src="image/icon_search2.gif" width="79" height="17" border="0" align="absmiddle"></a> 
            </td>
          </tr> -->
          <tr> 
            <td colspan="4"><img src="image/bottom.gif" width="652" height="12"></td>
          </tr>
        </table></td>
  </tr>
  <tr>
      <td height="40" align="right"><img src="image/icon_modify.gif" width="56" height="23" border="0" onFocus="blur()" onclick="submit()">
      <img src="image/icon_cancel.gif" width="56" height="23" border="0" onFocus="blur()" onClick="javascript:history.back();">
      </td></tr>
</table>
</form>
</body>
</html>
