<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<%ResultSet resultset1 =null;%>
<%
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/eamcet?user=root&password=Imtheyaz@11");
Statement statement = connection.createStatement() ;
resultset =statement.executeQuery("SELECT * FROM eamcet.colleges ") ;
%>
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<body bgcolor="beige">
<%
session.getAttribute("send");
%>
<center>
<div  style="font:700 30pt arial;letter-spacing:5pt;color:white;background-color:red">
Select Preferences
</div>
<form action="SelectPreferences1.jsp" method="post">
<table>
<tr>
<td>
Hall Ticket No:
</td>
<td>
<input type=text name=htno value="${send}"  readonly size=10 width="100%">
</td>
</tr>
<tr>
<td>
College ID
</td>
<td>
<select name="cid">
<option  value="0">Select College</option>
<%  while(resultset.next()){ %>
<option><%= resultset.getString(1)%></option>
<% } %>
</select>
</td>
</tr>
</table>
<input type=submit value="next">
<input type="reset" value="Clear All">
</form>
</center>
<%
}
        catch(SQLException e)
        {
             out.println("wrong entry"+e);
        }
%>
</BODY>
</HTML>