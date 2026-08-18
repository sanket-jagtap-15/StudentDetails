<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update data</title>
</head>
<body>

<%
 String sid =request.getParameter("sid");
String name=request.getParameter("snm");
String gender=request.getParameter("gen");
String subject=request.getParameter("sub");
int  mk=Integer.parseInt(request.getParameter("mar"));

//out.println(id+""+name+"  "+gender+"  "+subject+"  "+mark);


 Connection con;
PreparedStatement psmt;


try{
String url="jdbc:postgresql://localhost:5432/full_stack_b";
String user="postgres";
String pass="sanky@007";

Class.forName("org.postgresql.Driver");

con=DriverManager.getConnection(url,user,pass);
//out.println("Connection ohk");

psmt=con.prepareStatement("update student set name=?,gender=?,subject=?,marks=? where id="+sid);

psmt.setString(1,name);
psmt.setString(2,gender);
psmt.setString(3,subject);
psmt.setInt(4,mk);
 /* int i=Integer.parseInt(id);
psmt.setInt(5,i) ;
 */
int x=psmt.executeUpdate();
if(x<1) {
	%>
	<Script>
  alert("Error");
	window.location.href="home.jsp";
	</script>
	<% 
}
else {
	%>
	
	<script>
	
  // alert("UPDATE  Successfully...");
	window.location.href="home.jsp";

</script>
	<% 
}

}
catch(Exception e){
	 out.println(e);
 }
 

%>

</body>
</html>