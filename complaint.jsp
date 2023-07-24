<%@page import="javax.sql.DataSource" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="javax.naming.*,java.sql.*,java.text.SimpleDateFormat"%>
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
String category_type;
int risk;
String location;
java.util.Date date;
java.sql.Date sqlDate;
String description;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","rohank","Asdfjkl@123");
	
	//ctx = new InitialContext();
	//javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("java:com/env/jdbc/MyLocalDB");
	//con = ds.getConnection();
	//stmt = con.createStatement();
	
	ps=con.prepareStatement("insert into complaint(category_type,risk,location,complaint_date,description) values (?,?,?,?,?)");
	
	//get the values from previous page
	date=new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("ComplaintDate"));
	sqlDate = new Date(date.getTime());
	category_type = request.getParameter("category");
	risk = Integer.parseInt(request.getParameter("Risk"));
	location = request.getParameter("Location");
	description = request.getParameter("Description");
	
	
	
	//set the values to the fields of table
	ps.setString(1,category_type);
	ps.setInt(2,risk);
	ps.setString(3,location);
    ps.setDate(4,sqlDate);
    ps.setString(5,description);
 
	
	
	
	int n =ps.executeUpdate();
	
	// out.println("Record Inserted Successfully");
	response.sendRedirect("collegedetails.html"); 
}
catch(Exception e){ 
	e.printStackTrace();
	out.println(e.toString());
}



%>

</body>
</html>