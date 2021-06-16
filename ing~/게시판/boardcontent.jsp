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
<title>게시판 내용</title>
  <!-- link 선언 --> 
   <link rel="stylesheet" href="style.css">
   <link rel="stylesheet" href="style_index.css"> 
   <link rel="stylesheet" href="contentstyle.css">
   
   <style>
	body {
 		 font: 12px "Lucida Grande", Helvetica, Arial, sans-serif;
	}
  </style>
   <!-- script 선언 --> 
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
      <!-- 여기서부터 main메뉴바 -->
      <header>
       <div class="header_container">
        <div class="logo_container">
         <a href="./main.jsp"><img src="img/logo1.png" width="220px" height="50" alt="=슬기로운 학교생활"></a>
          </div> 
          <div class="nav_container" id="nav_menu"> 
          <div class="menu_container"> 
          <ul class="menu">
<li class="menu_1">
 <a class="menu_title">Study room</a>
 <ul class="menu_1_content">
  <li><a class="menu_index" href="write.jsp">My note</a></li> 
  <li><a class="menu_index" href="white.jsp">백색 소음</a></li>
 </ul></li> 
 <li class="menu_2">
 <a class="menu_title" href="timetable.jsp">시간표</a></li> 
<li class="menu_3"> 
 <a class="menu_title">성적관리</a>
 <ul class="menu_3_content">
 <li><a class="menu_index" href="ScoreCalc.jsp">성적 기입</a></li> 
 <li><a class="menu_index" href="grademain.jsp">학점 계산기</a></li>
 </ul> </li>
 <li class="menu_4"> 
 <a class="menu_title">정보공유</a>
 <ul class="menu_4_content">
 <li><a class="menu_index" href="board.jsp">자유 게시판</a></li> 
 </ul> </li>
  <li class="menu_5"> 
 <a class="menu_title">About us</a>
 <ul class="menu_5_content">
 <li><a class="menu_index" href="Team.jsp">팀 소개</a></li> 
 <li><a class="menu_index" href="Organization.jsp">조직도</a></li>
 <li><a class="menu_index" href="Tel.jsp">연락처</a></li>
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
   			<a class="menu_title" href="LoginJoin.jsp">로그인&nbsp;&nbsp;<%=userID %></a>
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
   			<a class="menu_title" href="LoginJoin.jsp">로그인</a>
  		</li> 
   </ul> 
   <%
	}
   %>
   </div> 
   </div> 
   </div> 
   </header> 
<!-- 여기까지 main메뉴바 -->
	<div align="center">
	<table class="type08" border=1>
	<thead>
		<tr>
			<th width="5%">번호</th>
			<th width="5%"><%=rs.getString(1) %></th>
			<th width="10%">제목</th>
			<th width="20%"><%=rs.getString(2) %></th>
			<th width="10%">작성일</th>
			<th width="20%"><%=rs.getString(4) %></th>
			<th width="10%">작성자</th>
			<th width="15%"><%=rs.getString(3) %></th>
		</tr>
	</thead>
	<tbody>	
		<tr>
			<td style="background:rgb(231, 233, 243);">내용</td>
			<td colspan="7"><%=rs.getString(5) %></td>
			
		</tr>
	</tbody>
	</table>
	<div style="width:70%;" align="right">
	<a href="boarddelete.jsp?bbsid=<%=rs.getString(1) %>">삭제</a>&nbsp;
	<a href="boardmodify_write.jsp?bbsid=<%=rs.getString(1) %>">수정</a>&nbsp;
	<a href="board.jsp">목록</a>	
	</div>	
	</div>		
</body>
<%
	}
	conn.close();
	}catch(Exception e){
		out.println("db접속실패");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
</html>