<!-- METADATA TYPE="typelib" NAME="ADODB Type Library" UUID="00000205-0000-0010-8000-00AA006D2EA4" -->
<!-- METADATA TYPE="typelib" FILE="C:\Program Files (x86)\Common Files\System\ado\msado25.tlb" -->
<%
'Option Explicit

Response.Expires = -1 
Response.AddHeader "Pragma", "no-cache" 
Response.AddHeader "cache-control", "no-store"

Const strConnect = "Provider=SQLOLEDB;User ID=aip2roukie;Password=jini0211;Initial Catalog=neomtech_com;Data Source=211.43.212.180"
%>
<OBJECT PROGID=ADODB.Connection ID=dbCon RUNAT=server></OBJECT>
<%
dbCon.ConnectionString = strConnect
%>
