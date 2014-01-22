<%
        Option Explicit

        Dim objDBConn
        Dim objRs

        Dim strSQL

        Dim intSeq, strName, strTitle, strContent
        Dim intReadnum, dtmReg_Date

        intSeq = Request.QueryString("seq")

        Set objDBConn = Server.CreateObject("ADODB.Connection")
        Set objRs = Server.CreateObject("ADODB.RecordSet")

        objDBConn.Open ("Provider=SQLOLEDB;User ID=aip2roukie;Password=jini0211;Initial Catalog=neomtech_com;Data Source=211.43.212.180")

        strSQL = "Update board Set b_Readnum = b_Readnum + 1"
        strSQL = strSQL & " Where b_idx = " & intSeq

        objDBConn.Execute strSQL

        strSQL = "Select b_name"                ' objRs(0) - 이름
        strSQL = strSQL & ",b_title"         ' objRs(1) - 제목
        strSQL = strSQL & ",b_content"        ' objRs(2) - 내용
        strSQL = strSQL & ",b_readnum"           ' objRs(3) - 조회수
        strSQL = strSQL & ",b_date"    ' objRs(4) - 작성일
        strSQL = strSQL & " From board"
        strSQL = strSQL & " Where b_idx = " & intSeq

        objRs.Open strSQL, objDBConn

        strName = objRs(0)
        strTitle = objRs(1)
        strContent = objRs(2)
        intReadnum = objRs(3)
        dtmReg_Date = objRs(4)

        objRs.Close
        Set objRs = nothing

        objDbConn.Close
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
<table width="652" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td><img src="image/bar_view.gif" width="652" height="121"></td>
  </tr>
  <tr> 
    <td><table width="652" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="90" height="40" align="center" background="image/title_bg.gif"><img src="image/view_wirter.gif" width="53" height="12"></td>
            <td width="380" height="40" background="image/title_bg.gif"> <font color="#0099CC"><%=strName%> &nbsp;
              &lt;<%=dtmReg_Date%>&gt; </font></td>
            <td width="90" height="40" align="center" background="image/title_bg.gif"><img src="image/view_file.gif" width="66" height="12"></td>
            <td width="92" height="40" align="center" background="image/title_bg.gif"><img src="image/icon_form.gif" width="11" height="13"></td>
          </tr>
          <tr> 
            <td width="90" height="35" align="center" background="image/title_bg2.gif"><img src="image/view_subject.gif" width="53" height="12"></td>
            <td height="35" colspan="3" background="image/title_bg2.gif"><%=strTitle%></td>
          </tr>
          <tr> 
            <td colspan="4"><table width="652" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="90">&nbsp;</td>
                  <td width="562" valign="top"><br><%=strContent%>
                  </td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td colspan="4"><img src="image/bottom.gif" width="652" height="12"></td>
          </tr>
        </table></td>
  </tr>
 
  <tr> 
    <td height="40"><table width="652" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46"><a href="#" onFocus="blur()"><img src="image/icon_back2.gif" width="43" height="11" border="0"></a></td>
            <td width="46"><a href="#" onFocus="blur()"><img src="image/icon_next2.gif" width="43" height="11" border="0"></a></td>
            <td>&nbsp;</td>
            <td width="60"><a href="list1.asp" onFocus="blur()"><img src="image/icon_list.gif" width="56" height="23" border="0"></a></td>
            <td width="60"><a href="delete.asp?seq=<%=intSeq%>" onFocus="blur()"><img src="image/icon_del.gif" width="56" height="23" border="0"></a></td>
            <td width="60"><a href="edit.asp?seq=<%=intSeq%>" onFocus="blur()"><img src="image/icon_modify.gif" width="56" height="23" border="0"></a></td>
            <td width="60"><a href="#" onFocus="blur()"><img src="image/icon_reply.gif" width="56" height="23" border="0"></a></td>
            <td width="60"><a href="write.html" onFocus="blur()"><img src="image/icon_write.gif" width="56" height="23" border="0"></a></td>
          </tr>
        </table></td>
  </tr>
  <!--
  <tr> 
    <td><table width="652" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td colspan="5"><img src="image/line.gif" width="652" height="1"></td>
          </tr>
          <tr> 
            <td width="100" align="center"><strong>도토리</strong></td>
            <td width="30" align="center"><img src="image/dot.gif" width="5" height="30"></td>
            <td width="382">요즘 홍길동님이 무언가에 빠져서 작업을 안한데여.. ^^</td>
            <td width="20" align="center"><a href="#" onFocus="blur()"><img src="image/icon_del2.gif" width="11" height="11" border="0"></a></td>
            <td width="140" align="center"><font color="#0099CC">2004-06-14 23:41:07</font></td>
          </tr>
          <tr> 
            <td colspan="5"><img src="image/line.gif" width="652" height="1"></td>
          </tr>
          <tr> 
            <td width="100" align="center"><strong>그림일기</strong></td>
            <td width="30" align="center"><img src="image/dot.gif" width="5" height="30"></td>
            <td width="382">아마도 슬럼프가 아닌가 싶네여... 근데 사진은 올리쥐....</td>
            <td align="center"><a href="#" onFocus="blur()"><img src="image/icon_del2.gif" width="11" height="11" border="0"></a></td>
            <td align="center"><font color="#0099CC">2004-06-14 23:41:07</font></td>
          </tr>
          <tr> 
            <td colspan="5"><img src="image/line.gif" width="652" height="1"></td>
          </tr>
        </table></td>
  </tr>
  -->
  <tr> 
    <td>&nbsp;</td>
  </tr>

</table>
</body>
</html>
