<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>글수정</title>
</head>
<body>
<% 	
	request.setCharacterEncoding("euc-kr");
	String bbsid = request.getParameter("bbsid");
	String bbstitle=request.getParameter("bbstitle");
	String bbscontent=request.getParameter("bbscontent");
	
	Connection conn = null;
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
	Statement stmt = conn.createStatement();
	String sql = "UPDATE BBS SET BBSTITLE='"+bbstitle+"',  BBSCONTENT='"+bbscontent+"', BBSDATE = sysdate WHERE BBSID="+bbsid+"";
	stmt.executeUpdate(sql);
	conn.close();
	}catch(Exception e){
		out.println("db연결실패");
		e.printStackTrace();
	}finally{
		out.println("<script>location.href='boardcontent.jsp?bbsid="+bbsid+"';</script>");
	}
%>
</body>
</html>