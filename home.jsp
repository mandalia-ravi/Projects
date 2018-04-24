<%@ page import="java.sql.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Home</title>
    </head>
<body>
<%

Connection conn= null;
PreparedStatement ps = null;
ResultSet rs = null;

String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/librarydb";
String user = "root";
String password = "root123";
   
String sql = "select book_name, price from book_table";

try {
   Class.forName(driverName);
   conn = DriverManager.getConnection(url, user, password);
   Statement stmt=conn.createStatement();
   rs=stmt.executeQuery(sql);

   
   //ps = con.prepareStatement(sql);
   //rs = ps.executeQuery(sql); 


    while(rs.next())
       {
   %>
    <table>
           <tr><td><%= rs.getString("book_name") %></td></tr>
           <tr><td><%= rs.getInt("price") %></td></tr>
            

        </table>
   <%
       }
   %>
   
   <%
        rs.close();
        stmt.close();
        conn.close();
   }
   catch(Exception e)
   {
        e.printStackTrace();
   }
   %>
       
    </body>
</html>