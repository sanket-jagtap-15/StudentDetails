<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Update the Data</title>
</head>
<body>
<%

String up=request.getParameter("id");
//out.println(up);

Connection con;
PreparedStatement psmt;
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

rs=stmt.executeQuery("select * from student where id="+up);

while(rs.next()){
	
	int id =rs.getInt("id");
	
	String nm=rs.getString("name");
	String gen=rs.getString("gender");
	String sub=rs.getString("subject");
	int m=rs.getInt("marks");
	
	
	//out.println(id+" "+nm+"  "+gen+"  "+sub+"  "+m);
	%>
	
	<div class="modal-body">
      <form action="nupdate.jsp"  method="get">
              <div class="mb-3">
      <label for="exampleFormControlInput1" class="form-label">Student id</label>
      <input type="text" readonly="readonly" class="form-control"  value="<%=id %>  " name="sid" placeholder="  Student Id">
      </div>
      
      <div class="mb-3">
      <label for="exampleFormControlInput1" class="form-label">Student Name</label>
      <input type="text" class="form-control"  value="<%=nm %>  " name="snm" placeholder="Student Name">
      </div>
      
      <div class="mb-3">
      <label for="exampleFormControlInput1" class="form-label">Student gender</label>
      <input type="text" class="form-control" value="<%=gen %>"  name="gen" placeholder="Student Gender">
      </div>
      
      <div class="mb-3">
      <label for="exampleFormControlInput1" class="form-label">Subject Name</label>
      <input type="text" class="form-control" value="<%=sub %> " name="sub" placeholder=" Subject Name">
      </div>
      
      <div class="mb-3">
      <label for="exampleFormControlInput1" class="form-label">Subject Name</label>
      <input type="number" class="form-control"  value="<%=m %>" name="mar" placeholder=" marks">
      </div>
     
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">update</button>
      </div>
     </form>
    </div>
	
	
<% 





}


}catch(Exception e){
	
	out.println(e);
}
 

%>

</body>
</html>