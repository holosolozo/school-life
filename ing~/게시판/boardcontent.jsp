<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: underline;}
</style>
<meta charset="EUC-KR">
<title>�Խ��� ����</title>
  <!-- link ���� --> 
   <link rel="stylesheet" href="style.css">
   <link rel="stylesheet" href="style_index.css"> 
   <link rel="stylesheet" href="contentstyle.css">
   
   <style>
	body {
 		 font: 12px "Lucida Grande", Helvetica, Arial, sans-serif;
	}
  </style>
   <!-- script ���� --> 
   <script src="https://kit.fontawesome.com/e1bd1cb2a5.js">
   </script> <script src="https://code.jquery.com/jquery-3.4.1.js">
   </script> <script src="script.js">
   </script>

<%
	String bbsid = request.getParameter("bbsid");

try{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String pw = "tiger";
	Class.forName(driver);
	Connection conn=DriverManager.getConnection(url,user,pw);
	ResultSet rs = null;
	Statement stmt = conn.createStatement();
	String sql="SELECT * FROM BBS where bbsid="+ bbsid;
	String msql="UPDATE BBS SET BBSCOUNT=BBSCOUNT+1 WHERE bbsid="+bbsid;
	
	
	stmt.executeUpdate(msql);
	rs = stmt.executeQuery(sql);

	while(rs.next()){	
%>
<body>
      <!-- ���⼭���� main�޴��� -->
      <header>
       <div class="header_container">
        <div class="logo_container">
         <a href="./main.jsp"><img src="img/logo1.png" width="220px" height="50" alt="=����ο� �б���Ȱ"></a>
          </div> 
          <div class="nav_container" id="nav_menu"> 
          <div class="menu_container"> 
          <ul class="menu">
<li class="menu_1">
 <a class="menu_title">Study room</a>
 <ul class="menu_1_content">
  <li><a class="menu_index" href="write.jsp">My note</a></li> 
  <li><a class="menu_index" href="white.jsp">��� ����</a></li>
 </ul></li> 
 <li class="menu_2">
 <a class="menu_title" href="timetable.jsp">�ð�ǥ</a></li> 
<li class="menu_3"> 
 <a class="menu_title">��������</a>
 <ul class="menu_3_content">
 <li><a class="menu_index" href="ScoreCalc.jsp">���� ����</a></li> 
 <li><a class="menu_index" href="grademain.jsp">���� ����</a></li>
 </ul> </li>
 <li class="menu_4"> 
 <a class="menu_title">��������</a>
 <ul class="menu_4_content">
 <li><a class="menu_index" href="board.jsp">���� �Խ���</a></li> 
 </ul> </li>
  <li class="menu_5"> 
 <a class="menu_title">About us</a>
 <ul class="menu_5_content">
 <li><a class="menu_index" href="Team.jsp">�� �Ұ�</a></li> 
 <li><a class="menu_index" href="Organization.jsp">������</a></li>
 <li><a class="menu_index" href="Tel.jsp">����ó</a></li>
 </ul> 
 </li> 
 </ul> 
 </div> 
 <div class="login_container">
 
 <%
	String userID = null;
	if(session.getAttribute("userID")!=null){
		userID = (String)session.getAttribute("userID");
	
%> 
  <ul class="login">
   		<li class="menu_login">
   			<a class="menu_title" href="LoginJoin.jsp">�α���&nbsp;&nbsp;<%=userID %></a>
  		</li> 
   </ul> 
   <%
	}
   %>
    <%
    if(session.getAttribute("userID")==null){
%> 
  <ul class="login">
   		<li class="menu_login">
   			<a class="menu_title" href="LoginJoin.jsp">�α���</a>
  		</li> 
   </ul> 
   <%
	}
   %>
   </div> 
   </div> 
   </div> 
   </header> 
<!-- ������� main�޴��� -->
	<div align="center">
	<table class="type08" border=1>
	<thead>
		<tr>
			<th width="5%">��ȣ</th>
			<th width="5%"><%=rs.getString(1) %></th>
			<th width="10%">����</th>
			<th width="20%"><%=rs.getString(2) %></th>
			<th width="10%">�ۼ���</th>
			<th width="20%"><%=rs.getString(4) %></th>
			<th width="10%">�ۼ���</th>
			<th width="15%"><%=rs.getString(3) %></th>
		</tr>
	</thead>
	<tbody>	
		<tr>
			<td style="background:rgb(231, 233, 243);">����</td>
			<td colspan="7"><%=rs.getString(5) %></td>
			
		</tr>
	</tbody>
	</table>
	<div style="width:70%;" align="right">
	<a href="boarddelete.jsp?bbsid=<%=rs.getString(1) %>">����</a>&nbsp;
	<a href="boardmodify_write.jsp?bbsid=<%=rs.getString(1) %>">����</a>&nbsp;
	<a href="board.jsp">���</a>	
	</div>	
	</div>		
</body>
<%
	}
	conn.close();
	}catch(Exception e){
		out.println("db���ӽ���");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
</html>