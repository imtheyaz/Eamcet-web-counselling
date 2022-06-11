<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import="java.sql.*" %>
  <%@ page import="javax.servlet.http.*" %>
<%ResultSet resultset1 =null;%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body  bgcolor="beige">
<%
String str=request.getParameter("cid");
String str1=request.getParameter("htno");
	try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/eamcet?user=root&password=Imtheyaz@11");
PreparedStatement ps1;
ps1=connection.prepareStatement("select bid from eamcet.seats where cid=?");
ps1.setString(1,str);
resultset1=ps1.executeQuery();
session=request.getSession();
session.setAttribute("uname",resultset1);
%>
<center>
		<div  style="font:700 30pt arial;letter-spacing:5pt;color:white;background-color:red">
				Select Preferences
		</div>
<form action="SelectPreferences2.jsp" method="post">
<table>
<tr>
	<td>
			Hall Ticket No:
	</td>
	<td >
			<input type=text name=htno  value=<%=str1 %> size=10 width="100%">
	</td>
</tr>

<tr>
	<td>
		College ID
	</td>
	<td>
		<input type=text name=cid1  value=<%=str %> size=10 width="100%">
	</td>
</tr>
<tr>
<td>
Branch ID
</td>
<td>
<select name="bid">
<option  value="0">Select Branch</option>
  <%  while(resultset1.next()){ %>
  
        <option><%= resultset1.getString(1)%></option>
      <% } %>
  </select>
</td>
</tr>
</table>
<input type=submit value="Prefer">
<input type="reset" value="Clear All">
</center>
<%
        }
        catch(SQLException e)
        {
             out.println("wrong entry"+e);
        }
%>
</body>
</html>