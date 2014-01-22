<%
AdminInfo = Session("AdminInfo")

If AdminInfo <> "" Then
	AdminInfo = Split(AdminInfo, ",")
	AdminID =  AdminInfo(0)
	AdminName =  AdminInfo(1)
	AdminEmail =  AdminInfo(2)
End If
%>