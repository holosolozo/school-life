<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
 
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{
        font-family:"���� ���";
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
	//����Ŭ ����̹� ����
	Class.forName(driver);
	//��񿬰�
	Connection conn = DriverManager.getConnection(url,user,pw);
	//���Ӽ���
	//out.println("list�� �ѷ��� ��񿬰Ἲ��");
	Statement stmt = conn.createStatement();
	String sql = "select * from board order by idx desc";
	rs = stmt.executeQuery(sql);
%>

<body>
	<table style="width:100%;" class="type09">
	<thead>
		<tr>
			<th>����</th>
			<th>��¥</th>
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
		out.println("list�� �Ѹ� ��񿬰����");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
</body>
</html>