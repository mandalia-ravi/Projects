<%@page contentType="text/html"%>

<%@page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@page import="org.json.simple.JSONObject"%>

<% JSONObject obj = new JSONObject();

obj.put("redirectUrl","/home.jsp");

%>