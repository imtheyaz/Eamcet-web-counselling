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
Update College
</div><br>
<h1>Available Colleges</h1>
<table border="6" width="50%">
<tr>
<th>cid</th>
<th>cname</th>
<th>caddress</th>
<th>region</th>
<th>email</th>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String sql ="select * from eamcet.colleges";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("cid") %></td>
<td><%=resultSet.getString("cname") %></td>
<td><%=resultSet.getString("caddress") %></td>
<td><%=resultSet.getString("region") %></td>
<td><%=resultSet.getString("email") %></td>
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
<form  action="UpdateCollege.jsp">
<table>
<tr>
<td>Collge ID
<td><input type="text" name="cid" size="10">
</tr>
<tr>
<td>Collge Name
<td><input type="text" name="cname" size="20">
</tr>
<tr>
<td>Collge Address
<td><textarea row="3" cols="30"  name="caddress"></textarea>
</tr>
<tr>
<td>Region
<td><select name="region">
<option value=au>Andhra University
<option value=ou>Osmania University
<option value=jntu>JNTU University
</select>
</tr>
<tr>
<td>College Email Address
<td><input type="text" size="50" name="email">
</tr>
</table>
<p>
<input type="submit" value="Update College">
<input type="reset" value="Clear All">
</center>
</form>
</body>
</html>