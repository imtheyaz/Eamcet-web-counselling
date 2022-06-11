<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eamcet","root","Imtheyaz@11");
String str33=(session.getAttribute("q1")).toString();
String str44=(session.getAttribute("q2")).toString();
String str55=(session.getAttribute("q3")).toString();
String str66=(session.getAttribute("q4")).toString();
String str77=(session.getAttribute("q5")).toString();
String str88=(session.getAttribute("q6")).toString();
String message=request.getParameter("message");
String cid=(session.getAttribute("next")).toString();
String bid=(session.getAttribute("next1")).toString();
String ts=request.getParameter("totalseats");
String os=request.getParameter("openseats");
String rs=request.getParameter("reservedseats");
String result = "";
String result1 ="";
String sql = "UPDATE eamcet.seats SET totalseats = ?, openseats = ?,reservedseats=?  WHERE (cid = ?) and (bid = ?)";
PreparedStatement ps;
ps = con.prepareStatement(sql);
ps.setString(1,ts);
ps.setString(2,os);
ps.setString(3,rs);
ps.setString(4,cid);
ps.setString(5,bid);
int r=ps.executeUpdate();
if(r==0)
out.println("failure");
else
result="Seats Updated Successfully";
String sql1 = "insert into eamcet.allotments values(?,?,?,?,?,?,?,?,?)";
PreparedStatement ps1;
ps1 = con.prepareStatement(sql1);
ps1.setString(1,str33 );
ps1.setString(2,str44);
ps1.setString(3,str55);
ps1.setString(4,str66);
ps1.setString(5,str77);
ps1.setString(6,str88);
ps1.setString(7,cid);
ps1.setString(8,bid);
ps1.setString(9,message);
int s=ps1.executeUpdate();
if(s==0)
out.println("failure");
else
result1="Alloted Seat Successfully";
 %>
 <div style="text-align:center">
		<form action="AllotingSeat.html">
		 <h1><%=result%></h1><br>
		 <h1><%=result1%></h1><br>
		<input type="submit" value="Back">
		</form>
		<form action="CounsellorHome.html">
		<input type="submit" value="Home">
		</form>
</div>
</body>
</html>