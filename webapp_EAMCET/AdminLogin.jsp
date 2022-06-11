<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.SQLException,java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet, java.sql.SQLException "%>;
<%
String email=request.getParameter("email");
String password=request.getParameter("password");
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eamcet","root","Imtheyaz@11");
	PreparedStatement ps=con.prepareStatement("select email,password from eamcet.admins where email=? and password=?");
	ps.setString(1,email);
	ps.setString(2,password);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		response.sendRedirect("AdminHome.html");													
	}
	else
	{
		response.sendRedirect("AdminLogin.html");
	}
	con.close();
	} catch (ClassNotFoundException e) {
		
		e.printStackTrace();
	}
%>