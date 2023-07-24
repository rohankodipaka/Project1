<%@page import="javax.sql.DataSource"%>
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
int arc_id;
int college_id;
String email;
java.util.Date date;
java.sql.Date sqlDate;
String chairman;
String mobile;
String member_name1;
String member_designation1;
String member_name2;
String member_designation2;



try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/miniproject","rohank","Asdfjkl@123");
	
	//ctx = new InitialContext();
	//javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("java:com/env/jdbc/MyLocalDB");
	//con = ds.getConnection();
	//stmt = con.createStatement();
	
	ps=con.prepareStatement("insert into arc(arc_id,college_id,email,established_date,chairman,mobile,member_name1,member_designation1,member_name2,member_designation2) values (?,?,?,?,?,?,?,?,?,?)");
	
	//get the values from previous page
    arc_id=Integer.parseInt(request.getParameter("Arcid"));
	college_id=Integer.parseInt(request.getParameter("clgid"));
	email=request.getParameter("email");
	date=new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("established"));
	sqlDate = new Date(date.getTime());
	chairman = request.getParameter("chairman");
	mobile=request.getParameter("mobile");
    member_name1=request.getParameter("memone");
    member_designation1=request.getParameter("desone");
    member_name2=request.getParameter("memtwo");
    member_designation2=request.getParameter("destwo");
//    out.println(gender);
	
	
	
	//set the values to the fields of table
	ps.setInt(1,arc_id);
	ps.setInt(2,college_id);
	ps.setString(3,email);
	ps.setDate(4,sqlDate);
	ps.setString(5,chairman);
    ps.setString(6,mobile);
    ps.setString(7,member_name1);
    ps.setString(8,member_designation1);
    ps.setString(9,member_name2);
    ps.setString(10,member_designation2);
	
	
	
	int n =ps.executeUpdate();
	
	out.println("Record Inserted Successfully");


}
catch(Exception e){ 
	e.printStackTrace();
}



%>

</body>
</html>