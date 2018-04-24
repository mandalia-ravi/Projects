<%@ page import="java.sql.*" %>

<%
String fname = request.getParameter("firstname");
String lname = request.getParameter("lastname");
String email = request.getParameter("email");
int phno = Integer.parseInt(request.getParameter("phoneNumber"));
String pwd = request.getParameter("password");
int age = Integer.parseInt(request.getParameter("age"));
String gender = request.getParameter("gender");
String profession = request.getParameter("profession");


Connection conn= null;

//String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/librarydb";
String user = "root";
String password = "root123";
     
   try
{
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarydb", "root", "root123");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into registeration_table values('"+fname+"','"+lname+"','"+email+"','"+phno+"','"+pwd+"','"+age+"','"+gender+"','"+profession+"')");
//out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>