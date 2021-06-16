<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
 table a:link { color: #369; text-decoration: underline;}
 table a:visited { color: #369; text-decoration: underline;}
</style>
  <!-- link 선언 --> 
   <link rel="stylesheet" href="style.css">
   <link rel="stylesheet" href="style_index.css"> 
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
<link rel='stylesheet' href="boardstyle.css" />

<meta charset="EUC-KR">
<title>자유게시판</title>
</head>
<%
	String userID = null;
	if(session.getAttribute("userID")!=null){
		userID = (String)session.getAttribute("userID");
	}
%> 
<%
	if(userID==null){
%>
<script>
	alert("로그인 필요");
	document.location.href="LoginJoin.jsp";
</script>
<%
	}
%>
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
	String sql = "select * from BBS order by BBSID desc";
	rs = stmt.executeQuery(sql);
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
	String id = null;
	if(session.getAttribute("userID")!=null){
		id = (String)session.getAttribute("userID");
	
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
	<div style="margin:20px;" align="center">
	<h3>자유게시판</h3>
	<table class="type11">
	<thead>
        	<tr>
        		<th width="10%" >번호</th>
       			<th width="35%" >제목</th>
       			<th width="25%" >작성자</th>
       			<th width="20%" >작성일</th>
       			<th width="10%" >조회수</th>
        	</tr>
	</thead>
<%
	while(rs.next()){
		out.print("<tbody>");
		out.print("<tr>");
		out.print("<td>"+rs.getString(1)+"</td>");
		out.print("<td><a href='boardcontent.jsp?bbsid="+rs.getString(1)+"'>"+rs.getString(2)+"</a></td>");
		out.print("<td>"+rs.getString(3)+"</td>");
		out.print("<td>"+rs.getString(4)+"</td>");
		out.print("<td>"+rs.getString(6)+"</td>");
		out.print("</tr>");
		out.print("</tbody>");
	}
%>
	</table>
	</div>
<%
	}catch (Exception e){
		out.println("list에 뿌릴 디비연결실패");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
				<form action="boardwrite.jsp">
   				<div align="right" class="type">
        		<input type='submit' value='글쓰기'/> &nbsp; &nbsp;
        		</div>  
				</form>          	
			
                <!-- 검색영역 -->
                <div align="center">
                    <form action="searchtitle.jsp" method="post">     
                    <select name="opt" >
                        <option value="1">제목+내용</option>
                        <option value="2">제목</option>
                        <option value="3">내용</option>
                    </select>
                    <input type="text" name="titlekey" >
                    <input type='submit' value='검색'>
                    </form>
                </div>
</body>
</html>