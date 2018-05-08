<%@ page language="java" contentType="text/html"%>

<%@ page import="java.sql.*" %>
<%@page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="login.html"%>

<%
	
	//PreparedStatement ps= null;
	Connection conn = null;
	
	String email = request.getParameter("email");
	String pwd = request.getParameter("password");
	
	String sql = "select * from registration_table where email=? and password=?";
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarydb?autoReconnect=true&useSSL=false", "root", "root123");
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,email);
		ps.setString(2, pwd);
		ResultSet rs = ps.executeQuery();
		
		if (rs.next()) {
       // session.setAttribute("userid", userid);
        //out.println("welcome " + email);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("welcome.html");
    } else {
         out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
		
	}
	catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}

%>	

