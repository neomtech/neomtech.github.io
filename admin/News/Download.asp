<!--#include virtual="/common/proc_FileDownload.asp"-->
<%
FileName = Request("FileName")
TableName = Request("TableName")

'DownloadFolder = Server.MapPath("/upload/intra/board_up/"&TableName&"")&"\"
DownloadFolder = Server.MapPath("/upload/")&"\"
Call FileDownload(DownloadFolder,FileName)
%>

