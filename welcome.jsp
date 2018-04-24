<%@page contentType="text/html"%>

<%@page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@page import="org.json.simple.JSONObject"%>
 <html>

<title> Welcome to the kingdom of Books</title>

<body>
    <h4> To display all the collection of books we have, take a tour of our KINGDOM OF BOOKS</h4>
    < h4 id="welcomeSubmit">Go On</h4>
</body>
<script>
$(document).getReady(function(e){
   
    $("#welcomeSubmit").click(function(e) {
                    
                    e.preventDefault();
                    
                    var url= "/status.jsp"
                    
                    $.ajax({
                        Type: "GET",
                        url: url,
                        data: '',
                        success: function(data){
                            
                            var response = JSON.parse(data);
                            var redirectUrl = response.redirectUrl;
                            window.location = redirectUrl;
                        }
                        
                    });
                
                    
                    
    });
                     
 });    
     
</script>
    
    
    
</html>