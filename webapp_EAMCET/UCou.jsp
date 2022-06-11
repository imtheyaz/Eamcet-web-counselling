<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
<div  style="font:700 30pt arial;letter-spacing:5pt;color:white;background-color:maroon">
Update Counsellor
</div><br>
<h1>Available Counsellors</h1>
<table border="6" width="50%">
<tr>
<th>name</th>
<th>email</th>
<th>ph_no</th>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String sql ="select * from eamcet.counsellors";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("ph_no") %></td>
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
</center>
<br><br>
<center>
<p>
<form method="post" action="UpdateCounsellor.jsp">
<tr>
<td> Name
<td><input type="text" name="name">
</tr>
<p>
<tr>
<td>Email
<td><input type="text" name="email">
</tr>
<p>
<tr>
<td>Phone Number
<td><input type="phone" name="ph_no">
</tr>
</table>
<p>
<input type="submit" value="Update Counsellor">
<input type="reset" value="Clear All">
</form>
<p>
</center>
</body>
</html>