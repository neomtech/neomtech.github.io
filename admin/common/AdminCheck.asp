<%
If Session("AdminInfo") = "" Then
	Response.write "<script language=javascript>"& vbCrLf
	Response.write "<!--"& vbCrLf
	Response.write "alert('접속 시간이 종료되었습니다.\n 다시 로그인 해주십시요.');"& vbCrLf
	Response.write "window.open('/admin/','_top');"& vbCrLf
	Response.write "//-->"& vbCrLf
	Response.write "</script>"& vbCrLf
	Response.End
End If
%>

