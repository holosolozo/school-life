<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� ����</title>
</head>
<body>
<% 
	String bbsid = request.getParameter("bbsid");
try{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String pw = "tiger";
	Class.forName(driver);
	Connection conn=DriverManager.getConnection(url,user,pw);
	//out.println("db�� ���Ӽ���");
	
	ResultSet rs = null;
	Statement stmt = conn.createStatement();
	String sql="DELETE FROM BBS where BBSID = "+ bbsid;
	rs = stmt.executeQuery(sql);
	conn.close();
%>
	<script>
		alert("�����Ǿ����ϴ�.");
		location.href="board.jsp";
	</script>
<%
}catch(Exception e){
%>

	<script>
	alert("������ �����߽��ϴ�");
	location.href("board.jsp");
	</script>
<%
	out.println(e.getMessage());
	e.printStackTrace();
}
%>
</body>
</html>