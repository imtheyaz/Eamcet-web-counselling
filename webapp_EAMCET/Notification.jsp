<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.SQLException,java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet, java.sql.SQLException "%>;
<%
String htno=request.getParameter("htno");
session.setAttribute("htno55", htno);
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eamcet","root","Imtheyaz@11");
	PreparedStatement ps=con.prepareStatement("select htno from eamcet.allotments where htno=?");
	ps.setString(1,htno);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		response.sendRedirect("Notification2.jsp");													
	}
	else
	{
		response.sendRedirect("Notification.html");
	}
	con.close();
	} catch (ClassNotFoundException e) {
		
		e.printStackTrace();
	}
%>