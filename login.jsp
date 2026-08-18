<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.* "%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inserted element is correct or not</title>
</head>
<body>
<%



String nm =request.getParameter("nm");
String pwd =request.getParameter("pass");
Connection con ;
Statement stmt;
ResultSet rs;
try{
	

	String url="jdbc:postgresql://localhost:5432/full_stack_b";
	String user="postgres";
	String pass="sanky@007";

	Class.forName("org.postgresql.Driver");

	con=DriverManager.getConnection(url,user,pass);
	//out.println("Connection ohk");

	stmt=con.createStatement();

	rs=stmt.executeQuery("select * from users where username='"+nm+"' and password='"+pwd+"'");
int cnt=0;
	while(rs.next()){
		cnt++;
		String unm=rs.getString("username");
		session.setAttribute("nm", unm);
		
		response.sendRedirect("home.jsp");
		
}
	if(cnt==0){
		%>
		<script>
		alert("Invalid Credentials");
		window.location.href="index.html";
		
		</script>

<% 
	}
}catch(Exception e){
	out.println(e);
}
//out.println(nm);
//out.println(pwd);

%>

</body>
</html>