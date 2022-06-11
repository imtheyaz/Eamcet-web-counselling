<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement,java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>    
 <%
String id = request.getParameter("userid");
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/eamcet";
String userid = "root";
String password = "Imtheyaz@11";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
PreparedStatement ps=null;
PreparedStatement ps1=null;
ResultSet resultSet = null;
ResultSet resultSet1 = null;
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="LightGoldenRodYellow">
<%
String str=request.getParameter("rank");
session.setAttribute("k", str);
%>
<center>
<div  style="font:700 30pt arial;letter-spacing:5pt;color:black;background-color:AliceBlue">
Student Details
</div><br><br>
<table border="6" width="50%">
<tr>
<p  style="color:red;">
<th >htno</th>
<th>rank</th>
<th>sname</th>
<th>gender</th>
<th>category</th>
<th>region</th>
</p>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
ps=connection.prepareStatement("select * from eamcet.students where srank=?");
ps.setString(1,str);
resultSet = ps.executeQuery();
ps1=connection.prepareStatement("select htno,cid,bid from eamcet.preferences where htno=(select htno from eamcet.students where srank=?)");
ps1.setString(1,str);
resultSet1 = ps1.executeQuery();
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("htno") %></td>
<td><%=resultSet.getString("srank") %></td>
<td><%=resultSet.getString("sname") %></td>
<td><%=resultSet.getString("gender") %></td>
<td><%=resultSet.getString("category") %></td>
<td><%=resultSet.getString("region") %></td>
</tr>
<%
}
%>
</table>
</center><br><br>
<center>
<div  style="font:700 30pt arial;letter-spacing:5pt;color:black;background-color:AliceBlue">
Student Preferences
</div><br><br>
<table border="6" width="50%">
<tr>
<p  style="color:red;">
<th >Hallticket No.</th>
<th>College Id</th>
<th>Branch Id</th>
</p>
</tr>
<%
while(resultSet1.next()){
%>
<tr>
<td><%=resultSet1.getString("htno") %></td>
<td><%=resultSet1.getString("cid") %></td>
<td><%=resultSet1.getString("bid") %></td>
</tr>
<%
}
%>
</table>
<p>
<form action="AllotingSeat2.jsp" method="post">
Enter Cid : <input type="text" name="cid11">
Enter Bid : <input type="text" name="bid11">
<input type="submit" value="Search">
</form>
</p>
</center>
<%
connection.close();
} catch (SQLException e) {
e.printStackTrace();
}
%>
</body>
</html>