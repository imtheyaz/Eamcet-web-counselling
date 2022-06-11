<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eamcet","root","Imtheyaz@11");
String result="";
String bid = request.getParameter("bid");
String bname = request.getParameter("bname");
PreparedStatement ps=con.prepareStatement("update branches set bid=?,bname=? where bid=?");
ps.setString(1,bid);
ps.setString(2,bname);
ps.setString(3,bid);
int r=ps.executeUpdate();
if(r==0)
out.println("failure");
else
result="Updated Branch Successfully";
con.close();
%>
<div style="text-align:center">
		<form action="UB.jsp">
		 <h1><%=result%></h1><br>
		<input type="submit" value="Back">
		</form><br><br>
		<form action="AdminHome.html">
		<input type="submit" value="Home">
		</form>
</div>
