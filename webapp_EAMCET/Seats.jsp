<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eamcet","root","Imtheyaz@11");
String result="";
String cid=request.getParameter("cid");
String bid=request.getParameter("bid");
String totalseats=request.getParameter("totalseats");
String openseats=request.getParameter("openseats");
String reservedseats=request.getParameter("reservedseats");
PreparedStatement ps=con.prepareStatement("insert into seats values(?,?,?,?,?)");
ps.setString(1,cid);
ps.setString(2,bid);
ps.setString(3,totalseats);
ps.setString(4,openseats);
ps.setString(5,reservedseats);
int r=ps.executeUpdate();
if(r==0)
out.println("failure");
else
result="Added Seats Successfully";
con.close();
%>
<div style="text-align:center">
		<form action="Seats.html">
		 <h1><%=result%></h1><br>
		<input type="submit" value="Back">
		</form><br><br>
		<form action="CounsellorHome.html">
		<input type="submit" value="Home">
		</form>
</div>
