<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.SQLException,java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet, java.sql.SQLException "%>;

<%

String sname=request.getParameter("sname");
String htno=request.getParameter("htno");
session.setAttribute("send",htno);

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eamcet","root","Imtheyaz@11");
		PreparedStatement ps=con.prepareStatement("select sname,htno from eamcet.students where sname=? and htno=?");
		ps.setString(1,sname);
		ps.setString(2,htno);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			response.sendRedirect("StudentHome.html");													
		}
		else
		{
			response.sendRedirect("StudentLogin.html");
		}
		con.close();
	} catch (ClassNotFoundException e) {
		
		e.printStackTrace();
	}
	
	
	
	
%>