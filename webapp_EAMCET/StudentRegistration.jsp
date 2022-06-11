<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eamcet","root","Imtheyaz@11");
String result="";
String htno=request.getParameter("htno");
String srank=request.getParameter("srank");
String sname=request.getParameter("sname");
String gender=request.getParameter("gender");
String category=request.getParameter("category");
String region=request.getParameter("region");
PreparedStatement ps=con.prepareStatement("insert into students values(?,?,?,?,?,?)");
ps.setString(1,htno);
ps.setString(2,srank);
ps.setString(3,sname);
ps.setString(4,gender);
ps.setString(5,category);
ps.setString(6,region);
int r=ps.executeUpdate();
if(r==0)
out.println("failure");
else
result="Student Registered Successfully";
con.close();
%>
<div style="text-align:center">
		<form action="StudentLogin.html">
		 <h1><%=result%></h1><br>
		<input type="submit" value="Go To Login Page">
		</form><br><br>
</div>
