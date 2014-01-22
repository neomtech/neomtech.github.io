<%
Response.CacheControl = "no-cache" 
Response.AddHeader "Pragma", "no-cache" 
Response.Expires = -1 

Session("AdminInfo") = ""
Session.Abandon

Response.Redirect "/admin/"
%>