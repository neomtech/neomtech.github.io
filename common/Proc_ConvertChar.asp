<%
'/*--------------------------------------------------------
'// DB Insert �� Ư������ ó��
'--------------------------------------------------------*/
'html ������
Function ConvertChar(CheckValue)
	Dim Str
	Str = CheckValue
	CheckValue = Str
	CheckValue = Replace(CheckValue, "&", "&amp;")
	CheckValue = Replace(CheckValue, chr(34), "&quot;")
	CheckValue = Replace(CheckValue, "'", "''")
	ConvertChar = CheckValue
End Function

'html ���
Function ConvertChar2(CheckValue)
	Dim Str
	Str = CheckValue
	CheckValue = Str
	CheckValue = Replace(CheckValue, "&", "&amp;")
	CheckValue = Replace(CheckValue, "<", "&lt;")
	CheckValue = Replace(CheckValue, ">", "&gt;")
	CheckValue = Replace(CheckValue, chr(34), "&quot;")
	CheckValue = Replace(CheckValue, "'", "''")
	ConvertChar2 = CheckValue
End Function

'/*--------------------------------------------------------
'// DB Select �� Ư������ ó��
'--------------------------------------------------------*/
Function ReConvertChar(CheckValue)
	Dim Str
	Str = CheckValue
	CheckValue = Str
	CheckValue = Replace(CheckValue, "\r", "<br>")
	CheckValue = Replace(CheckValue, "\n", " ")
	CheckValue = Replace(CheckValue, "&amp;", "&")
	CheckValue = Replace(CheckValue, "&quot;", chr(34))
	CheckValue = Replace(CheckValue, Chr(13)&Chr(10), "<br>")
	ReConvertChar = CheckValue
End Function

Function ReConvertChar2(CheckValue)
	Dim Str
	Str = CheckValue
	CheckValue = Str
	CheckValue = Replace(CheckValue, "&amp;", "&")
	CheckValue = Replace(CheckValue, "&quot;", chr(34))
	CheckValue = Replace(CheckValue, "''", "'")
	ReConvertChar2 = CheckValue
End Function


'/*--------------------------------------------------------
'// URL �ڵ� ��ũ
'--------------------------------------------------------*/
Function LinkURLs(str)
	Dim reg
	Set reg = New RegExp

	reg.pattern = "(\w+):\/\/([a-z0-9\_\-\./~@?=%&:\-]+)"
	reg.Global = True
	reg.IgnoreCase = True
	reg.multiline=true
	str = reg.Replace(str, "<a href='$1://$2' target='_blank'>$1://$2</a>")
	reg.pattern = "(\w+)@([\w.\-]+)"
	str = reg.Replace(str, "<a href='mailto:$1@$2'>$1@$2</a>")
	LinkURLs = str
End Function
%>