<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body bgcolor="beige">
<center>
<h1>Registered Students</h1>
<table border="6">
<tr>
<th>htno</th>
<th>rank</th>
<th>sname</th>
<th>gender</th>
<th>category</th>
<th>region</th>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String sql ="select * from eamcet.students order by 'srank' Desc";
resultSet = statement.executeQuery(sql);
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
<%
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
<p>
<a href="CounsellorHome.html">Counsellor Menu</a>
</center>
</body>
</html>