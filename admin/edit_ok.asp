<%
      Option Explicit

      Dim objDBConn, objRs
      Dim strSQL 
      Dim intSeq 
      Dim strName, strTitle, strContent
      Dim strRealPassword, strPassword
    
      intSeq = Request.QueryString("seq")
      strName = Request.Form("name")
      strTitle = Request.Form("subject")
      strContent = Request.Form("content")
      strPassword = Request.Form("pwd")
     
      Set objDBConn = Server.CreateObject("ADODB.Connection")
      Set objRs = Server.CreateObject("ADODB.RecordSet")

      objDBConn.Open ("Provider=SQLOLEDB;User ID=aip2roukie;Password=jini0211;Initial Catalog=neomtech_com;Data Source=211.43.212.180")

      strSQL = "Select b_pwd"
      strSQL = strSQL & " from board"
      strSQL = strSQL & " Where b_idx = " & intSeq

      objRs.Open strSQL, objDBConn
      strRealPassword = objRs("b_pwd")
      objRs.Close
      Set objRs = nothing

      If strRealPassword <> strPassword Then
%>
<script language="javascript">
<!--
      alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�");
      history.back();
//-->
</script>
<%
      Response.End
      End If

      strSQL = "Update board Set"
      strSQL = strSQL & " b_name = '" & strName & "',"
      strSQL = strSQL & " b_title = '" & strTitle & "',"
      strSQL = strSQL & " b_content = '" & strContent & "',"
      strSQL = strSQL & " b_date = getDate()"
      strSQL = strSQL & " Where b_idx = " & intSeq

      objDBConn.Execute strSQL
      objDBConn.Close
      Set objDBConn = nothing
%>
<script language="javascript">
<!--
      alert("�����Ǿ����ϴ�");
      location.href="list1.asp";
//-->
</script>


	
		  
	  