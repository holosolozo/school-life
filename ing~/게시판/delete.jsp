<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
	String idx = request.getParameter("idx");
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
	String sql="DELETE FROM board where idx = "+ idx;
	rs = stmt.executeQuery(sql);
	conn.close();
%>
	<script>
		alert("�����ϰڽ��ϴ�.");
		location.href="redirect.jsp";
	</script>
<%
}catch(Exception e){
%>

	<script>
	alert("������ �����߽��ϴ�");
	location.href("redirect.jsp");
	</script>
<%
	out.println(e.getMessage());
	e.printStackTrace();
}
%>
</body>
</html>