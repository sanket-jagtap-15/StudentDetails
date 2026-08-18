<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<script> 
function del(id){
//alert("sure you want to delete"+id)
/* localStorage.setItem("id",id); */
window.location.href="del.jsp?id=" +id;
/* var sj=localStorage.getItem("id");
alert("LocslStorage id is "+sj) */

}


function update(id){
//alert("sure uhh want to update");

window.location.href="update.jsp?id="+id;

}
</script>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>get data from server </title>

</head>
<body>

<h2>Welcome    <%= session.getAttribute("nm") %></h2>
 <a href="logout.jsp"> Logout</a>
<h1 class="mb-4 text-center">Student table Information</h1>

<!-- Button trigger modal -->

<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Add Students Information
</button>




<!-- Modal -->

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      
      <div class="modal-body">
      <form action="home.jsp"  method="get">
              <div class="mb-3">
      <label for="exampleFormControlInput1" class="form-label">Student Name</label>
      <input type="text" class="form-control"   name="snm" placeholder="Enter a Student Name">
      </div>
      
      <div class="mb-3">
      <label for="exampleFormControlInput1" class="form-label">Student gender</label>
      <input type="text" class="form-control"   name="gen" placeholder="Enter a Student Gender">
      </div>
      
      <div class="mb-3">
      <label for="exampleFormControlInput1" class="form-label">Subject Name</label>
      <input type="text" class="form-control"   name="sub" placeholder="Enter a Subject Name">
      </div>
      
      <div class="mb-3">
      <label for="exampleFormControlInput1" class="form-label">Subject Name</label>
      <input type="number" class="form-control"   name="mar" placeholder="Enter a marks">
      </div>
     
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Insert Details</button>
      </div>
     </form>
     
    </div>
   
  </div>
 
</div>






<table class="table table-dark  table-bordered">
  <thead>
    <tr>
       <th scope="col">Id</th>
       <th scope="col">Name</th>
       <th scope="col">Gender</th>
       <th scope="col">Subject</th>
       <th scope="col">Marks</th>
       <th scope="col">Action</th>
            
    </tr>
  </thead>
  <tbody>
        <%

Connection con;
Statement stmt;
PreparedStatement psmt;
ResultSet rs;
try{
	String url="jdbc:postgresql://localhost:5432/full_stack_b";
	String user="postgres";
	String pass="sanky@007";
	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection(url,user,pass);
	//System.out.println("CONNECTION OHK");

	//out.println("con Ohk");
	String name=request.getParameter("snm");
	String gender=request.getParameter("gen");
	String subject=request.getParameter("sub");
	String  marksStr=request.getParameter("mar");
	
	if(name != null && gender != null && subject != null && marksStr != null) {
        int ma=Integer.parseInt(marksStr);
       // out.println(  name +" "+ gender +" "+ subject +" "+ ma);
	
psmt=con.prepareStatement("insert into student(name,gender,subject,marks)values (?,?,?,?)");


psmt.setString(1, name);
psmt.setString(2,gender);
psmt.setString(3,subject);

 psmt.setInt(4,ma);

int x=	psmt.executeUpdate();

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
	
   alert("Insert Successfully...");
	window.location.href="home.jsp";

</script>
	<% 
}
	}
    stmt=con.createStatement();
    
    rs=stmt.executeQuery("Select * from student");

    while(rs.next()){
    	
    	//out.println(+"  "+ +"  "+rs.getString("gender") +"  "+" "++"<br>" );

         int id=rs.getInt("id");
 
         String nm=rs.getString("name");
         String gen=rs.getString("gender");
         String sub=rs.getString("subject");
         int marks= rs.getInt("marks");
 
 
        
 
	%>	
	<tr>
	  <td><%=id %></td>
      <td><%=nm %></td>
      <td><%=gen %></td>
      <td><%=sub %></td>
      <td><%=marks%></td>
      <td><button type="button" onclick="del(<%=id %>)"  class="btn btn-danger">Delete</button>
       <button type="button" onclick="update(<%=id %> )"  class="btn btn-warning">Update</button></td>
      
      
    </tr>
	
 
<% 
   
    }
}
catch(Exception e) {
out.println(e);

 }




%>

</tbody>
</table>
</body>
 </html>