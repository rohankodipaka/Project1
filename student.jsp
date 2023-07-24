<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="javax.naming.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
Context ctx = null;
Connection con = null;
Statement stmt = null;
PreparedStatement ps=null;
ResultSet rs = null;
String fullname;
String course;
String email;
String gender;
int student_id;
int college_id;
String mobile;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","rohank","Asdfjkl@123");
	
	//ctx = new InitialContext();
	//javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("java:com/env/jdbc/MyLocalDB");
	//con = ds.getConnection();
	//stmt = con.createStatement();
	
	ps=con.prepareStatement("insert into student(fullname,student_id,college_id,course,email,gender,mobile) values (?,?,?,?,?,?,?)");
	
	//get the values from previous page
	fullname=request.getParameter("fname");
    student_id=Integer.parseInt(request.getParameter("id"));
	college_id=Integer.parseInt(request.getParameter("id"));
	course=request.getParameter("course");
	email=request.getParameter("email");
    gender=request.getParameter("gender");
//    out.println(gender);
	mobile=request.getParameter("mobile");
	
	
	//set the values to the fields of table
    ps.setString(1,fullname);
    ps.setInt(2,student_id);
    ps.setInt(3,college_id);
	ps.setString(4,course);
	ps.setString(5,email);
	ps.setString(6,gender);
    ps.setString(7,mobile);
 
	
	
	
	int n =ps.executeUpdate();
	
	out.println("Record Inserted Successfully");
	response.sendRedirect("registercomplaint.html"); 

}
catch(Exception e){ 
	e.printStackTrace();
	out.println(e.toString());
}



%>

</body>
</html>