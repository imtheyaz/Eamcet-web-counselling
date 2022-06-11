<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.SQLException,java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet, java.sql.SQLException "%>;
<%
String email=request.getParameter("email");
String ph_no=request.getParameter("ph_no");
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eamcet","root","Imtheyaz@11");
	PreparedStatement ps=con.prepareStatement("select email,ph_no from eamcet.counsellors where email=? and ph_no=?");
	ps.setString(1,email);
	ps.setString(2,ph_no);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		response.sendRedirect("CounsellorHome.html");													
	}
	else
	{
		response.sendRedirect("CounsellorLogin.html");
	}
	con.close();
	} catch (ClassNotFoundException e) {
			e.printStackTrace();
	}
%>