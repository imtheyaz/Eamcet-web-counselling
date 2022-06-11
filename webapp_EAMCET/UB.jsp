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
Update branch
</div><br>
<h1>Available Branches</h1>
<table border="6" width="50%">
<tr>
<p>
<th>bid</th>
<th>bname</th>
</p>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String sql ="select * from eamcet.branches";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("bid") %></td>
<td><%=resultSet.getString("bname") %></td>
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
<form method="post" action="UpdateBranch.jsp">
<table>
<tr>
<tr>
<td>Branch ID 
<td><input type="text" name="bid" size="10">
</tr>
<tr>
<td>Branch Name
<td><input type="text" name="bname">
</tr>
</table>
<p>
<input type="submit" value="Update Branch">
<input type="reset" value="Clear All">
</form>
<p>
</center>
</body>
</html>