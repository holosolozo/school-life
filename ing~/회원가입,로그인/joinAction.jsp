<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����</title>
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
	//����Ŭ ����̹� ����
	Class.forName(driver);
	//��񿬰�
	conn = DriverManager.getConnection(url,user,pw);
	//���Ӽ���
	out.println("��񿬰Ἲ��");
	Statement stmt = conn.createStatement();
	
	String sql = "INSERT INTO MEMBER"+"(USERNAME,USERID,USERPASSWORD,USERMAIL)"
						+"VALUES('"+userName+"','"+userID+"','"+userPassword+"','"+userMail+"')";
	stmt.executeUpdate(sql);
	
	conn.close();
	}catch(Exception e){
		out.println("db�������");
		out.println(e.getMessage());
		e.getStackTrace();
	}
	RequestDispatcher rd=request.getRequestDispatcher("LoginJoin.jsp");
	rd.forward(request,response);
%>
</body>
</html>