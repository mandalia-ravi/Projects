<%@ page language="java" contentType="text/html"%>
<%@page import="java.sql.*, java.io.*, java.util.*, javax.servlet.*"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Book Details</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" type="text/css" href="display.css">
        <!-- Bootstrap CSS -->
    	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <style>
            @import url(https://fonts.googleapis.com/css?family=Oswald);
        	.table-bordered > tbody > tr > td, .table-bordered > tbody > tr > th, .table-bordered > thead > tr > td, .table-bordered > thead > tr > th {
    			border: 2px solid #66a6ff;
				}
            #myThead {
                font-size: 20px;
                font-family: 'Oswald', monospace;
            }
            #myTable {
                font-size: 17px;
                font-family: cursive;
            }
		</style>
    </head>
        <body>

            <div class="container">
                <h2>List of Books</h2>
                    <input class="form-control" id="myInput" type="text" placeholder="Search..">
                    <br>
                    <table class="table table-bordered table-striped">
                        <thead id="myThead">
                            <tr>
                                <td><mark><b>Book Name</b></mark></td>
                                <td><mark><b>Author Name</b></mark></td>
                                <td><mark><b>Category</b></mark></td>
                                <td><mark><b>Genre</b></mark></td>
                            </tr>
                        </thead>

<%
try
{
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/librarydb";
String username="root";
String password="root123";
String query="select book_name, author_name, category, genre from book_table";
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/librarydb?autoReconnect=true&useSSL=false","root","root123");
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{

%>
    
                        <tbody id="myTable">
                            <tr>
                            <td><%=rs.getString("book_name") %></td>
                            <td><%=rs.getString("author_name") %></td>
                            <td><%=rs.getString("category") %></td>
                            <td><%=rs.getString("genre") %></td>
                            </tr>
                        </tbody>
<%
}
%>
                    </table>
                </div>
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
        <script>
            $(document).ready(function(){
                $("#myInput").on("keyup", function() {
                    var value = $(this).val().toLowerCase();
                    $("#myTable tr").filter(function() {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
          });
        });
        </script>
        
        
        
        
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
        </body>
</html>