<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�������Զ�</title>
<style>
	body {
 	  font: 15px "Lucida Grande", Helvetica, Arial, sans-serif;
	}
	 a:link { color: #168; text-decoration: none;}
	 a:visited { color: #168; text-decoration: none;}
 	a:hover { color: #168; text-decoration: underline;}
    .table {
      border-collapse: collapse;
      border-top: 3px solid #168;
      width:100%;
      text-align:center;
      
    }      
    .table th {
      color: #168;
      background: #f0f6f9;
    }
    .table th, .table td {
      padding: 10px;
      border: 1px solid #ddd;
    }
    .table th:first-child, .table td:first-child {
      border-left: 1;
    }
    .table th:last-child, .table td:last-child {
      border-right: 1;
    }
    .table tr td:first-child{
    }
    .table caption{caption-side: bottom; display: none;}
  </style>
</head>
<body>
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
		String sql = "select * from SCORE order by num desc";
		rs = stmt.executeQuery(sql);	
%>
	<div align="center">
	  <table class="table" row=100 cals=100>
			<tr>
				<th rowspan="2">�����</th>	
				<th colspan="2">1�г�</th>
				<th colspan="2">2�г�</th>
				<th colspan="2">3�г�</th>
				<th colspan="2">4�г�</th>
				<th rowspan="2"> </th> 

			</tr>
			<tr>
				<th>1�б�</th>
				<th>2�б�</th>
				<th>1�б�</th>
				<th>2�б�</th>
				<th>1�б�</th>
				<th>2�б�</th>
				<th>1�б�</th>
				<th>2�б�</th>
			</tr>
<% 
			while(rs.next()){
				out.print("<tr>");
				out.print("<td>"+rs.getString(1)+"</td>");
				if(rs.getString(2)==null){out.print("<td> </<td>");}
				else{out.print("<td>"+rs.getString(2)+"</td>");}
				if(rs.getString(3)==null){out.print("<td> </<td>");}
				else{out.print("<td>"+rs.getString(3)+"</td>");}
				if(rs.getString(4)==null){out.print("<td> </<td>");}
				else{out.print("<td>"+rs.getString(4)+"</td>");}
				if(rs.getString(5)==null){out.print("<td> </<td>");}
				else{out.print("<td>"+rs.getString(5)+"</td>");}
				if(rs.getString(6)==null){out.print("<td> </<td>");}
				else{out.print("<td>"+rs.getString(6)+"</td>");}
				if(rs.getString(7)==null){out.print("<td> </<td>");}
				else{out.print("<td>"+rs.getString(7)+"</td>");}
				if(rs.getString(8)==null){out.print("<td> </<td>");}
				else{out.print("<td>"+rs.getString(8)+"</td>");}
				if(rs.getString(9)==null){out.print("<td> </<td>");}
				else{out.print("<td>"+rs.getString(9)+"</td>");}
				out.print("<td><a href='Scoredelete.jsp?num="+rs.getString("num")+"'>" +"����"+"</a></td>");
				out.print("</tr>");
			}
%>			
	  </table>
	  </div>
<%
	}catch (Exception e){
		out.println("list�� �Ѹ� ��񿬰����");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
</body>
</html>