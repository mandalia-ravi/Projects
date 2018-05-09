<%@ page language="java" contentType="text/html"%>

<%@ page import="java.sql.*" %>
<%@page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@page import="org.json.simple.JSONObject"%>

<%@include file="login.html"%>

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="login.css">
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <body>

<%
	
	//PreparedStatement ps= null;
	Connection conn = null;
	
	String email = request.getParameter("email");
	String pwd = request.getParameter("password");
	
	String sql = "select * from registration_table where email=? and pwd=?";
	
	try {
        Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarydb?autoReconnect=true&useSSL=false", "root", "root123");
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,email);
		ps.setString(2, pwd);
		ResultSet rs = ps.executeQuery();
		
		if (rs.next()) {
        //session.setAttribute("userid", userid);
        //out.println("welcome " + email);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("welcome.html");
        }
        else {
         //out.println("Invalid password <a href='login.jsp'>try again</a>");
   %>
    <div class="container" onclick="Login">
        <div class="alert alert-danger alert-dismissible" fade in>
            <a href="login.jsp" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Danger!</strong> Invalid Email id or Password, try again!
        </div>
    </div>
    <%
       }
   }
		
	catch(Exception e) {
        System.out.print(e);
        e.printStackTrace();
    }    

%>	
    </body>
</html>