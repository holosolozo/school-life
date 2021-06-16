<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>가입</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String userName = request.getParameter("userName");
	String userID = request.getParameter("userID");
	String userPassword = request.getParameter("userPassword");
	String userMail = request.getParameter("userMail");
	
	Connection conn=null;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String pw = "tiger";	
	
	try{
	//오라클 드라이버 접속
	Class.forName(driver);
	//디비연결
	conn = DriverManager.getConnection(url,user,pw);
	//접속성공
	out.println("디비연결성공");
	Statement stmt = conn.createStatement();
	
	String sql = "INSERT INTO MEMBER"+"(USERNAME,USERID,USERPASSWORD,USERMAIL)"
						+"VALUES('"+userName+"','"+userID+"','"+userPassword+"','"+userMail+"')";
	stmt.executeUpdate(sql);
	
	conn.close();
	}catch(Exception e){
		out.println("db연결실패");
		out.println(e.getMessage());
		e.getStackTrace();
	}
	RequestDispatcher rd=request.getRequestDispatcher("LoginJoin.jsp");
	rd.forward(request,response);
%>
</body>
</html>