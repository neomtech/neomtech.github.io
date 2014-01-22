<%
'/*--------------------------------------------------------
'// File Upload Size Convert
'--------------------------------------------------------*/
Function GetFileSizeConvert(size)
	Dim intKbyte, intMbyte, strSize

	intKbyte = 1024 
	intMbyte = 1024 * 1024 
	
	If Len(size) > 6 Then
		strSize = Round((size / intMbyte),2) & " Mbyte"
	ElseIf Len(size) > 3 Then 
		strSize = Round((size / intKbyte),2) & " Kbyte"
	Else
		strSize = size & " byte"
	End If

	GetFileSizeConvert = strSize
End Function

'/*--------------------------------------------------------
'// File Upload Exists Check
'--------------------------------------------------------*/
Function FileExistsCheck(DestinationFile, DestinationFolder, strFileName)
	Dim FSO, count, strName, strExt

	Set FSO = Server.CreateObject("Scripting.FileSystemObject")

	If FSO.FileExists (DestinationFile) Then		
		count = 0		
		strName = Mid(strFileName, 1, Instr(strFileName, ".")-1)	'파일명 추출
		strExt = Mid(strFileName, Instr(strFileName,".")+1)			'확장자 추출
		
		Do While FSO.FileExists(DestinationFile)
			count = count + 1
			DestinationFile = DestinationFolder & strName & "(" & CStr(count) & ")" & "." & strExt
		Loop
	End If

	Set FSO = Nothing

	FileExistsCheck = DestinationFile
End Function

'/*--------------------------------------------------------
'// File Upload 최대 크기, 저장 위치
'--------------------------------------------------------*/
Dim FileMaxSize, strDirectory, DestinationFolder

Sub UploadLocation(Folder)
			FileMaxSize = "3"
			'DestinationFolder = Server.mappath("/upload/intra/board_up/"&Folder)&"\"
			DestinationFolder = Server.mappath("/upload/")&"\"
End Sub

'/*--------------------------------------------------------
'// Delete File
'--------------------------------------------------------*/
Sub DeleteFile(FileName , Folder)
	Dim FSO
	Set FSO = Server.CreateObject("Scripting.FileSystemObject")
	'DestinationFolder = Server.mappath("/upload/intra/board_up/"&Folder)&"\"
	DestinationFolder = Server.mappath("/upload/")&"\"
	FSO.DeleteFile (DestinationFolder & FileName)
	Set FSO = Nothing
End Sub

%>