<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ۼ���</title>
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
	//����Ŭ ����̹� ����
	Class.forName(driver);
	//��񿬰�
	conn = DriverManager.getConnection(url,user,pw);
	//���Ӽ���
	Statement stmt = conn.createStatement();
	String sql = "UPDATE BBS SET BBSTITLE='"+bbstitle+"',  BBSCONTENT='"+bbscontent+"', BBSDATE = sysdate WHERE BBSID="+bbsid+"";
	stmt.executeUpdate(sql);
	conn.close();
	}catch(Exception e){
		out.println("db�������");
		e.printStackTrace();
	}finally{
		out.println("<script>location.href='boardcontent.jsp?bbsid="+bbsid+"';</script>");
	}
%>
</body>
</html>