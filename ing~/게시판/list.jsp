<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
 
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{
        font-family:"맑은 고딕";
}
 a:link { color: #369; text-decoration: underline;}
 a:visited { color: #369; text-decoration: underline;}
</style>
<link rel='stylesheet' href="memostyle.css" />
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<% 	
	try{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String pw = "tiger";
	ResultSet rs = null;
	//오라클 드라이버 접속
	Class.forName(driver);
	//디비연결
	Connection conn = DriverManager.getConnection(url,user,pw);
	//접속성공
	//out.println("list에 뿌려줄 디비연결성공");
	Statement stmt = conn.createStatement();
	String sql = "select * from board order by idx desc";
	rs = stmt.executeQuery(sql);
%>

<body>
	<table style="width:100%;" class="type09">
	<thead>
		<tr>
			<th>제목</th>
			<th>날짜</th>
			<th>Etc</th>
		</tr>
	</thead>

<%
	while(rs.next()){
		out.print("<tbody>");
		out.print("<tr>");
	//	out.print("<td>"+rs.getString("idx")+"</td>");
		out.print("<td><a href='content.jsp?idx="+rs.getString("idx")+"'>" +rs.getString("title")+"</a></td>");
	//	out.print("<td>"+rs.getString("content")+"</td>");
		out.print("<td>"+rs.getString("mydate")+"</td>");
		out.print("<td><a href='delete.jsp?idx="+rs.getString("idx")+"'>" +"Delete"+"</a></td>");
		out.print("</tr>");
		out.print("</tbody>");
	}
%>
	</table>
<%
	}catch (Exception e){
		out.println("list에 뿌릴 디비연결실패");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
</body>
</html>