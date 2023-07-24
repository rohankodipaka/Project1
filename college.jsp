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
String college_name;
String state;
String email;
String address;
int college_id;
try{
   
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","rohank","Asdfjkl@123");
	
	//ctx = new InitialContext();
	//javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("java:com/env/jdbc/MyLocalDB");
	//con = ds.getConnection();
	//stmt = con.createStatement();
	
	ps=con.prepareStatement("insert into college(college_id,college_name,state,email,address) values (?,?,?,?,?)");
	
	//get the values from previous page
	college_name=request.getParameter("college");
//	out.println(request.getParameter("id"));
	college_id=Integer.parseInt(request.getParameter("id"));
	state=request.getParameter("state");
	email=request.getParameter("email");
	address=request.getParameter("address");
	
	
	//set the values to the fields of table
    ps.setInt(1,college_id);
	ps.setString(2,college_name);
	ps.setString(3,state);
	ps.setString(4,email);
	ps.setString(5,address);
 
	
	
	
	int n =ps.executeUpdate();
	
	
	response.sendRedirect("collegedetails.html"); 
	//out.println("Record Inserted Successfully"+ n);
}
catch(Exception e){ 
	e.printStackTrace();
	out.println(e.toString());
}



%>

</body>
</html>