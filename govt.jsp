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
String profession;
String email;
String mobile;
int official_id;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","rohank","Asdfjkl@123");
	
	//ctx = new InitialContext();
	//javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("java:com/env/jdbc/MyLocalDB");
	//con = ds.getConnection();
	//stmt = con.createStatement();
	
	ps=con.prepareStatement("insert into govt(profession,official_id,email,mobile) values (?,?,?,?)");
	
	//get the values from previous page
	profession=request.getParameter("Designation");
	official_id=Integer.parseInt(request.getParameter("id"));
	email=request.getParameter("email");
	mobile=request.getParameter("mobile");
	
	
	//set the values to the fields of table
    
	ps.setString(1,profession);
	ps.setInt(2,official_id);
	ps.setString(3,email);
	ps.setString(4,mobile);
 
	
	
	
	int n =ps.executeUpdate();
	
	response.sendRedirect("govtofficials.html"); 
	//out.println("Record Inserted Successfully"+ n);
}
catch(Exception e){ 
	e.printStackTrace();
	out.println(e.toString());
}



%>

</body>
</html>