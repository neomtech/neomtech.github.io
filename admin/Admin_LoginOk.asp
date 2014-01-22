<!-- #include virtual="/common/dbCon.asp" -->
<!--#include virtual="/common/Proc_ETC.asp"-->
<%
Dim Login_ID,Login_Pwd
Dim Rs,Sql,Ru

Login_ID = Request("Login_ID")
Login_Pwd = Request("Login_Passwd")
'response.write(Login_ID)
'response.write(Login_Pwd)
'response.end
dbCon.Open
Sql="Select * From admin_list Where user_level = 0 and user_id = '"&Login_ID&"' And user_pwd = '"&Login_Pwd&"' "
Set Rs=dbCon.Execute(Sql)

If Rs.Eof Then
	Call AlertMsg("ID와 비밀번호를 확인하세요","location.replace('index.asp');")
Else
	'Sql = "Select * From sawon Where User_id = '"&Rs("User_id")&"' "
	'Set Ru=dbCon.Execute(Sql)

	'Session("AdminInfo") = Ru("User_id") &","& Ru("User_Name") &","& Ru("User_Email")
	'Session("AdminInfo") = "roukie" &","& "지욱진" &","& "jini0519@neomtech.com"
	Session("AdminInfo") = "roukie" &","& "곽채화" &","& "chime@neomtech.com"
	Response.Redirect "Admin_Main.asp"
End If

Rs.Close
Set Rs = Nothing
Ru.Close
Set Ru = Nothing
dbCon.Close
%>