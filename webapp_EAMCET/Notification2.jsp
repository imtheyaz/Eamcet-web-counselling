<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
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
PreparedStatement ps1=null;
ResultSet resultSet1 = null;
String ptr=(session.getAttribute("htno55")).toString();
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
ps1=connection.prepareStatement("select message from eamcet.allotments where htno=?");
ps1.setString(1,ptr);
resultSet1 = ps1.executeQuery();
while(resultSet1.next()){
%>
<center>
<h1><%=resultSet1.getString("message") %></h1>
</center>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>