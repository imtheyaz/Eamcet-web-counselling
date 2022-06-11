<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
 <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String result="";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eamcet","root","Imtheyaz@11");
String htno=request.getParameter("htno");
String cid1=request.getParameter("cid1");
String bid=request.getParameter("bid");
PreparedStatement ps=con.prepareStatement("insert into preferences values(?,?,?)");
ps.setString(1,htno);
ps.setString(2,cid1);
ps.setString(3,bid);
int r=ps.executeUpdate();
if(r==0)
out.println("failure");
else
result="College Prefered Successfully";
con.close();
%>

<div style="text-align:center">
		<form action="SelectPreferences.jsp">
		 <h1><%=result%></h1><br>
		<input type="submit" value="Back">
		</form><br><br>
		
		<form action="StudentHome.html">
		<input type="submit" value="Home">
		</form>
	</div>

</body>
</html>