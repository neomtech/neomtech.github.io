<%
'/*--------------------------------------------------------
'// ��� �޼���
'--------------------------------------------------------*/
Sub AlertMsg(Message, LocationHref)
	Dim strAlertMsg
	strAlertMsg = "<script language='JavaScript'>"
	strAlertMsg = strAlertMsg & "alert('" & Message & "');"
	strAlertMsg = strAlertMsg & LocationHref
	strAlertMsg = strAlertMsg & "</script>"
	Response.Write strAlertMsg
	Response.End
End Sub

'/*--------------------------------------------------------
'// ���� �߼�
'// ÷������ ����
'--------------------------------------------------------*/

Sub SendMail(sendfrom, sendto, title, content)
Dim ObjMail
	Set ObjMail = Server.CreateObject("CDONTS.NewMail")
	
	'If AttachFile <> "" Then
	'ObjMail.AttachFile(AttachFile)
	'End If
	ObjMail.From = sendfrom
	ObjMail.To = sendto
	ObjMail.Subject = title
	ObjMail.BodyFormat = 0
	ObjMail.MailFormat = 0
	ObjMail.Body = content
	ObjMail.Send
	
	Set ObjMail = Nothing
End Sub
%>