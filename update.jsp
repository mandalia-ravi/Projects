<%@ page language="java" contentType="text/html"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
String currentPassword=request.getParameter("password");
String Newpass=request.getParameter("new");
String conpass=request.getParameter("confirm");
String connurl = "jdbc:mysql://localhost:3306/librarydb";
Connection con=null;
String pass="root123";
String fname=null;
try{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(connurl, "root", "root123");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from registration_table where pwd='"+currentPassword+"'");
while(rs.next()){
fname=rs.getString(1);
pass=rs.getString(5);
} System.out.println(fname+ " "+pass);
if(pass.equals(currentPassword)){
Statement st1=con.createStatement();
int i=st1.executeUpdate("update registration_table set pwd='"+Newpass+"' where firstname='"+fname+"'");
out.println("Password changed successfully");
st1.close();
con.close();
}
else{
out.println("Invalid Current Password");
}
}
catch(Exception e){
out.println(e);
}
%>