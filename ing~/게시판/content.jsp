<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href="memostyle.css" />
<meta charset="EUC-KR">
<title>메모내용</title>
<style type="text/css">
body{
        font-family:"맑은 고딕";
}
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: underline;}
</style>
</head>
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
	String sql="SELECT * FROM board where idx="+ idx;
	
	rs = stmt.executeQuery(sql);
	while(rs.next()){
%>
<body>
	<table class="type08">
	<thead>
		<tr>
			<th>제목</th>
			<th><%=rs.getString("title") %></th>
			<th>날짜</th>
			<th><%=rs.getString("mydate") %></th>
		</tr>
	</thead>
	<tbody>
		<!--  <tr>
			<th >제목</th>
			<td colspan="3"><%=rs.getString("title") %></td>
		</tr> -->
		<tr>
			<th >내용</th>
			<td colspan="3"><%=rs.getString("content") %></td>
		</tr>
	</tbody>
	</table>
&nbsp;&nbsp;<a href="delete.jsp?idx=<%=rs.getString("idx") %>">메모삭제</a>
<a href="list.jsp">목록으로</a>
</body>

<%
	}
	conn.close();
}catch(Exception e){
	out.println("db 접속실패");
	out.println(e.getMessage());
	e.printStackTrace();
}
%>
</html>