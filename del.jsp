<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete record from this</title>
</head>
<body>
<h1>Delete records</h1>

<%
String ids= request.getParameter("id");
out.println(ids);


Connection con;

PreparedStatement psmt;

try{
	String url="jdbc:postgresql://localhost:5432/full_stack_b";
	String user="postgres";
	String pass="sanky@007";
	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection(url,user,pass);
	System.out.println("CONNECTION OHK");
	
	psmt=con.prepareStatement("delete from student where id="+ids);
	
	int x=psmt.executeUpdate();
	if(x<1){
		out.println("Error");
		response.sendRedirect("home.jsp");
	}else{
		out.println("Delete Successfully");
		response.sendRedirect("home.jsp");
	}
	
	
}
catch(Exception e){
	
}

%>

</body>
</html>