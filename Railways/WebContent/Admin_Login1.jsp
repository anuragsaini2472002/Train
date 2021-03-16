<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String USER_NAME=request.getParameter("username");
	String PASSWORD=request.getParameter("password");
	out.print("<h1>"+USER_NAME+"</h1>");
	out.print("<h1>"+PASSWORD+"</h1>");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://tomcat17.hostingraja.org:3306/startupl_indianrailways","bishnu","Bishnu1802011");
		PreparedStatement psmt=con.prepareStatement("SELECT* FROM ADMIN_LOGIN WHERE USERNAME=? AND PASSWORD=?");
		psmt.setString(1, USER_NAME);
		psmt.setString(2, PASSWORD);
		ResultSet rs=psmt.executeQuery();
		if(rs.next())
		{
			response.sendRedirect("Admin_DashBoard.html");
		}
		
	}
	catch(Exception ex)
	{
		out.print("Exception: "+ex);
	}
%>
</body>
</html>