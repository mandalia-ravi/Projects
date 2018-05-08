<%@ page language="java" contentType="text/html"%>
<%@page import="java.sql.*, java.io.*, java.util.*, javax.servlet.*"%>
<%@ include file="welcome.html"%> 

<%
String fname = request.getParameter("firstname");
String lname = request.getParameter("lastname");
String email = request.getParameter("email");
String phoneNo = request.getParameter("phoneNumber");
String pwd = request.getParameter("password");
int age = Integer.parseInt(request.getParameter("age"));
String gender = request.getParameter("gender");
String profession = request.getParameter("profession");


Connection conn= null;

String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/librarydb?autoReconnect=true&useSSL=false";
String user = "root";
String password = "root123";
     
   try
{
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarydb?autoReconnect=true&useSSL=false", "root", "root123");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into registration_table values('"+fname+"','"+lname+"','"+email+"','"+phoneNo+"','"+pwd+"','"+age+"','"+gender+"','"+profession+"')");
out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>