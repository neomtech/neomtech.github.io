<%
    Option Explicit
 
    Dim objDBConn
    Dim objRs
 
    Dim strSQL
	
	Dim intNowPage, intTotalCount, intTotalPage, intBlockPage, intPageSize
    Dim intTemp, intLoop

    intNowPage = Request.QueryString("page")    
    intPageSize = 10
    intBlockPage = 10

    If Len(intNowPage) = 0 Then
        intNowPage = 1
    End If
 
    strSQL = "Select Count(*)"
    strSQL = strSQL & ",CEILING(CAST(Count(*) AS FLOAT)/" & intPageSize & ")"
    strSQL = strSQL & " from board"

    Set objDBConn = Server.CreateObject("ADODB.Connection")
    Set objRs = Server.CreateObject("ADODB.RecordSet")
 
    objDBConn.Open ("Provider=SQLOLEDB;User ID=aip2roukie;Password=jini0211;Initial Catalog=neomtech_com;Data Source=211.43.212.180")
	
	objRs.Open strSQL, objDBConn
    intTotalCount = objRs(0)
    intTotalPage = objRs(1)
    objRs.Close 
 
    strSQL = "Select Top "& intNowPage * intPageSize & "b_idx"                                     
    strSQL = strSQL & ",b_name"                                  
    strSQL = strSQL & ",b_title"                                  
    strSQL = strSQL & ",b_readnum"                              
    strSQL = strSQL & ",b_date"                                
    strSQL = strSQL & " FROM board"
    strSQL = strSQL & " ORDER BY b_idx desc"
 
    
 
    objRs.Open strSQL, objDBConn
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>네오엠텍 관리자</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel='stylesheet' href='style.css' type='text/css'>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="652" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="image/bar_list.gif" width="652" height="121"></td>
  </tr>
  <tr>
    <td><table width="652" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="66" background="image/title_bg.gif"><img src="image/title_no.gif" width="66" height="40"></td>
            <td width="62" background="image/title_bg.gif"><img src="image/title_form.gif" width="62" height="40"></td>
            <td width="278" align="center" background="image/title_bg.gif"><img src="image/title_subject.gif" width="38" height="40"></td>
            <td width="91" background="image/title_bg.gif"><img src="image/title_name.gif" width="91" height="40"></td>
            <td width="90" background="image/title_bg.gif"><img src="image/title_date.gif" width="90" height="40"></td>
            <td width="65" background="image/title_bg.gif"><img src="image/title_hit.gif" width="65" height="40"></td>
          </tr> 
		  <% If objRs.BOF or objRs.EOF Then %>
  		 <tr align="center">
    				<td colspan="5">등록된 게시가 없습니다</td>
  		 </tr>

<%
         Else
		 	  objRs.Move (intNowPage - 1) * intPageSize
              Do Until objRs.EOF
%>
         <tr> 
            <td height="25" align="center"><%=objRs(0)%></td>
            <td align="center"><img src="image/icon_form.gif" width="11" height="13"></td>
            <td ><a href="view.asp?seq=<%=objRs(0)%>"><%=objRs(2)%></a></td>
            <td align="center" ><%=objRs(1)%></td>
            <td align="center" ><%=left(objRs(4),10)%></td>
            <td align="center" ><%=objRs(3)%></td>
      </tr>
		  <tr> 
            <td colspan="6"><img src="image/line.gif" width="652" height="1"></td>
          </tr>
		  
<%
                  objRs.MoveNext
              Loop
        End If
%>
<table  width="652">
<tr>
    <td align="center">
    <%
            intTemp = Int((intNowPage - 1) / intBlockPage) * intBlockPage + 1

            If intTemp = 1 Then
	%>
                <img src="image/icon_back.gif" width="11" height="11" border="0" align="absmiddle">
	<%
            Else 
	%>
                <a href="list1.asp?page=<%= intTemp - intBlockPage %> "><img src="image/icon_back.gif" width="11" height="11" border="0" align="absmiddle"></a>
	<%
                
            End If

            intLoop = 1

            Do Until intLoop > intBlockPage Or intTemp > intTotalPage
                If intTemp = CInt(intNowPage) Then
                    Response.Write "<font size= 3><b>" & intTemp &"</b></font>&nbsp;" 
                Else
                    Response.Write"<a href=list1.asp?page=" & intTemp & ">" & intTemp & "</a>&nbsp;"
                End If
                intTemp = intTemp + 1
                intLoop = intLoop + 1
            Loop

            If intTemp > intTotalPage Then
	%>
                <img src="image/icon_next.gif" width="11" height="11" border="0" align="absmiddle">
	<%
            Else 
	%>
               <a href="list1.asp?page=<%= intTemp %> "><img src="image/icon_next.gif" width="11" height="11" border="0" align="absmiddle"></a>
	<%
            End If
    %>
    </td>
  </tr>
</table>
<!--
		  <tr>
            <td height="30" colspan="6" align="center"><a href="#" onFocus="blur()"><img src="image/icon_back.gif" width="11" height="11" border="0" align="absmiddle"></a> 
              &lt; 1 2 3 <font color="#0099CC">4</font> 5 6 7 8 9 10 &gt; <a href="#" onFocus="blur()"><img src="image/icon_next.gif" width="11" height="11" border="0" align="absmiddle"></a></td>
          </tr>
		 -->
         <tr>
		 <tr> 
            <td colspan="6"><p><img src="image/bottom.gif" width="652" height="12"></p></td>
         </tr>
		 
		 </table>
        <table width="652" border="0" cellpadding="0" cellspacing="0" align="center">

          <tr>
            <td width="365" height="25" align="left" bgcolor="#F9F9F9"><a href="list1.asp"><img src="image/icon_list.gif"  width="56" height="23" border="0"></a> <a href="write.html"><img src="image/icon_write.gif" width="56" height="23" border="0"></a></td>
            <td width="103" bgcolor="#F9F9F9"><img src="image/search_name.gif" width="31" height="23"><img src="image/search_subject.gif" width="31" height="23"> <img src="image/search_body.gif" width="31" height="23"></td>
			<td width="140">
                    <input name="textfield" type="text" size="23"> 
            </td>
			<td width="44"><img src="image/icon_search.gif"></td> 
          </tr>
   
  
<%
        objRs.Close
        Set objRs = nothing
        objDBConn.Close
       Set objDBConn = nothing
%>
 
      </table>         
    </body>
</html> 

