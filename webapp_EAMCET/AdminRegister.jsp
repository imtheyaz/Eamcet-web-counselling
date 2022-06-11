<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eamcet","root","Imtheyaz@11");
String result="";
String aname=request.getParameter("aname");
String password=request.getParameter("password");
String email=request.getParameter("email");
String ph_no=request.getParameter("ph_no");
PreparedStatement ps=con.prepareStatement("insert into admins values(?,?,?,?)");
ps.setString(1,aname);
ps.setString(2,password);
ps.setString(3,email);
ps.setString(4,ph_no);
int r=ps.executeUpdate();
if(r==0)
out.println("failure");
else
result="Admin Registered Successfully";
con.close();
%>
<div style="text-align:center">
		<form action="AdminLogin.html">
		 <h1><%=result%></h1><br>
		<input type="submit" value="Go To Login Page">
		</form><br><br>
</div>
