<%
If Session("AdminInfo") = "" Then
	Response.write "<script language=javascript>"& vbCrLf
	Response.write "<!--"& vbCrLf
	Response.write "alert('���� �ð��� ����Ǿ����ϴ�.\n �ٽ� �α��� ���ֽʽÿ�.');"& vbCrLf
	Response.write "window.open('/admin/','_top');"& vbCrLf
	Response.write "//-->"& vbCrLf
	Response.write "</script>"& vbCrLf
	Response.End
End If
%>

