<!-- #include file="Proc_FileUpload.asp" -->
<%
Response.Buffer = False

'�Ϲ� �ٿ�ε�
Sub FileDownload(DownloadFolder, FileName)
	'Call UploadLocation(DownloadFolder)

	Dim objStream, strFileDownload

	Response.ContentType = "application/unknown"
	Response.AddHeader "Content-Disposition","attachment; filename=" & FileName & ""

	Set objStream = Server.CreateObject("ADODB.Stream")
	objStream.Open

	objStream.Type = 1
	'objStream.LoadFromFile DownloadFolder & FileName
	objStream.LoadFromFile DestinationFolder & FileName
	strFileDownload = objStream.Read

	objStream.Close
	Set objStream = Nothing

	Response.BinaryWrite strFileDownload
End Sub

'�Խ��� �ٿ�ε�
Sub BoardDownload(DownloadFolder, FileName)
	Call BoardLocation(DownloadFolder)

	Dim objStream, strFileDownload

	Response.ContentType = "application/unknown"
	Response.AddHeader "Content-Disposition","attachment; filename=" & FileName & ""

	Set objStream = Server.CreateObject("ADODB.Stream")
	objStream.Open

	objStream.Type = 1
	objStream.LoadFromFile DestinationFolder & FileName
	strFileDownload = objStream.Read

	objStream.Close
	Set objStream = Nothing

	Response.BinaryWrite strFileDownload
End Sub
%>