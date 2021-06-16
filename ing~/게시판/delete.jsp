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
	//out.println("db에 접속성공");
	
	ResultSet rs = null;
	Statement stmt = conn.createStatement();
	String sql="DELETE FROM board where idx = "+ idx;
	rs = stmt.executeQuery(sql);
	conn.close();
%>
	<script>
		alert("삭제하겠습니다.");
		location.href="redirect.jsp";
	</script>
<%
}catch(Exception e){
%>

	<script>
	alert("삭제에 실패했습니다");
	location.href("redirect.jsp");
	</script>
<%
	out.println(e.getMessage());
	e.printStackTrace();
}
%>
</body>
</html>