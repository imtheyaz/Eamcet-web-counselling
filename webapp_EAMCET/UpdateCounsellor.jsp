<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eamcet","root","Imtheyaz@11");
String result="";
String name=request.getParameter("name");
String email=request.getParameter("email");
String ph_no=request.getParameter("ph_no");
PreparedStatement ps=con.prepareStatement("update counsellors set name=?,email=?,ph_no=? where email=?");
ps.setString(1,name);
ps.setString(2,email);
ps.setString(3,ph_no);
ps.setString(4,email);
int r=ps.executeUpdate();
if(r==0)
out.println("failure");
else
result="Updated Counsellors Successfully";
con.close();
%>
<div style="text-align:center">
		<form action="UCou.jsp">
		 <h1><%=result%></h1><br>
		<input type="submit" value="Back">
		</form><br><br>
		<form action="AdminHome.html">
		<input type="submit" value="Home">
		</form>
</div>
