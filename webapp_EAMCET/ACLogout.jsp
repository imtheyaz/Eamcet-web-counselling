<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eamcet","root","Imtheyaz@11");
session.setAttribute("email",null);
session.invalidate();
response.sendRedirect("EamcetHome.html");
con.close();
%>
