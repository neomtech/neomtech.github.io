<%
      Option Explicit

      Dim intSeq 

      intSeq = Request.QueryString("seq")
%>
<html>
<head>
<title>�ۻ����ϱ�</title>
</head>
<body>
<form name="deleteForm" method="post" action="delete_ok.asp?seq=<%=intSeq%>"> 
<table border cellspacing="0" width="500">
  <tr>
    <td colspan="2" align="center"><b>���� �����մϴ�</b></td>
  </tr>
  <tr>
    <td align="center">��й�ȣ</td>
    <td>
      <input type="password" name="userPwd" size="15">
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <input type="submit" value="����">&nbsp;&nbsp;
      <input type="button" onClick="javascript:history.back();" value="��������">
    </td>
  </tr>
</table>
</form>
</body>
</html>
