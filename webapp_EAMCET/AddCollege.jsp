<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eamcet","root","Imtheyaz@11");
String result="";
String cid=request.getParameter("cid");
String cname=request.getParameter("cname");
String caddress=request.getParameter("caddress");
String region=request.getParameter("region");
String email=request.getParameter("email");
PreparedStatement ps=con.prepareStatement("insert into colleges values(?,?,?,?,?)");
ps.setString(1,cid);
ps.setString(2,cname);
ps.setString(3,caddress);
ps.setString(4,region);
ps.setString(5,email);
int r=ps.executeUpdate();
if(r==0)
out.println("failure");
else
result="Added College Successfully";
con.close();
%>
<div style="text-align:center">
		<form action="AddCollege.html">
		 <h1><%=result%></h1><br>
		<input type="submit" value="Back">
		</form><br><br>
		<form action="AdminHome.html">
		<input type="submit" value="Home">
		</form>
</div>
