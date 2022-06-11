<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
PreparedStatement ps=null;
ResultSet resultSet = null;
PreparedStatement ps1=null;
ResultSet resultSet1 = null;
%>
<!DOCTYPE html>
<html>
<body bgcolor="beige">
<%
String str=request.getParameter("cid11");
String str1=request.getParameter("bid11");
session.setAttribute("next",str);
session.setAttribute("next1",str1);
String ptr=(session.getAttribute("k")).toString();
%>
<center>
<h1>Registered Students</h1>
<form action="AllotingSeat3.jsp">
<table border="6">
<tr>
<th>College Id</th>
<th>Branch Id</th>
<th>Total Seats</th>
<th>Open Seats</th>
<th>Reserved Seats</th>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
ps=connection.prepareStatement("SELECT * FROM eamcet.seats where cid=? and bid=?");
ps.setString(1,str);
ps.setString(2,str1);
resultSet=ps.executeQuery();
ps1=connection.prepareStatement("select * from eamcet.students where srank=?");
ps1.setString(1,ptr);
resultSet1 = ps1.executeQuery();
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("cid") %></td>
<td><%=resultSet.getString("bid") %></td>
<td><input type="text" value="<%=resultSet.getString("totalseats") %>" name="totalseats"></td>
<td><input type="text" value="<%=resultSet.getString("openseats") %>"  name="openseats"></td>
<td><input type="text" value="<%=resultSet.getString("reservedseats") %>"  name="reservedseats"></td>
</tr>
<%
}
%>
</table><br><br>
<table border="6">
<tr>
<th>Hall Ticket Number</th>
<th>Rank</th>
<th>Name</th>
<th>Gender</th>
<th>category</th>
<th>region</th>
<th>College Id</th>
<th>Branch Id</th>
<th>Message</th>
</tr>
<%
while(resultSet1.next()){
	String q1=resultSet1.getString("htno");
	String q2=resultSet1.getString("srank");
	String q3=resultSet1.getString("sname");
	String q4=resultSet1.getString("gender");
	String q5=resultSet1.getString("category");
	String q6=resultSet1.getString("region");
%>
<tr>
<td><%=q1 %></td>
<td><%=q2 %></td>
<td><%=q3 %></td>
<td><%=q4 %></td>
<td><%=q5 %></td>
<td><%=q6 %></td>
<td><%=str %></td>
<td><%=str1 %></td>
<td><input type="text" name="message" > </td>
</tr>
<%
session.setAttribute("q1",q1);
session.setAttribute("q2",q2);
session.setAttribute("q3",q3);
session.setAttribute("q4",q4);
session.setAttribute("q5",q5);
session.setAttribute("q6",q6);
}
%>
</table>
<input type="submit" value="Submit">
</form><br><br>
<form action="AllotingSeat.html">
<input type="submit" value="Back">
</form><br><br>
<form action="CounsellorHome.html">
<input type="submit" value="Home">
</form>
</center>
<%
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>