<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="EUC-KR">
<title>시간표</title>
<style>


   .table {
      border-collapse: collapse;
      border: 1px solid #ddd;
      width:80%;
      
    }  
    
    .table th {
      color: #168;
      width:100px;
      background: #f0f6f9;
    }
    .table th, .table td {
      width:100px;
      border: 1px solid #ddd;
      text-align:center;
    }
  
    
</style>
</head>
<%
   request.setCharacterEncoding("euc-kr");
   Connection conn = null;
   PreparedStatement pstmt = null;
   
   String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
   String jdbc_url = "jdbc:oracle:thin:@localhost:1521:orcl";
   
   try{
      Class.forName(jdbc_driver);
      conn = DriverManager.getConnection(jdbc_url,"scott","tiger");
      
      String sql="UPDATE TIMETABLE SET ONE=?,TWO=?,THREE=?,FOUR=?,FIVE=?,SIX=?,SEVEN=?,EIGHT=?,NINE=?,TEN=? WHERE DAY=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, request.getParameter("one"));
      pstmt.setString(2, request.getParameter("two"));
      pstmt.setString(3, request.getParameter("three"));
      pstmt.setString(4, request.getParameter("four"));
      pstmt.setString(5, request.getParameter("five"));
      pstmt.setString(6, request.getParameter("six"));
      pstmt.setString(7, request.getParameter("seven"));
      pstmt.setString(8, request.getParameter("eight"));
      pstmt.setString(9, request.getParameter("nine"));
      pstmt.setString(10, request.getParameter("ten"));
      pstmt.setString(11, request.getParameter("day"));
      
      if(request.getParameter("day")!=null)
         pstmt.executeUpdate();
   }catch(Exception e){
      System.out.println(e);
   }
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
   <center>
   <br>
   <br>
   <br>
      <form name="form1" method="post">
         <table style="height:60px;" class="table">
         <tr>
            <th align="center">요일</th>
            <th align="center">1교시</th> 
            <th align="center">2교시</th> 
            <th align="center">3교시</th> 
            <th align="center">4교시</th> 
            <th align="center">5교시</th> 
            <th align="center">6교시</th> 
            <th align="center">7교시</th> 
            <th align="center">8교시</th> 
            <th align="center">9교시</th> 
            <th align="center">10교시</th> 
         </tr>
         <tr>
            <td align="center"><select name="day">
                        <option value="월">월요일</option>
                        <option value="화">화요일</option>
                        <option value="수">수요일</option>
                        <option value="목">목요일</option>
                        <option value="금">금요일</option>
                    </select></td>
            <td><input type="text" name="one" placeholder="과목 입력" style="width:100px;"></td>
            <td><input type="text" name="two" placeholder="과목 입력" style="width:100px;"></td>
            <td><input type="text" name="three" placeholder="과목 입력" style="width:100px;"></td>
            <td><input type="text" name="four" placeholder="과목 입력" style="width:100px;"></td>
            <td><input type="text" name="five" placeholder="과목 입력" style="width:100px;"></td>
            <td><input type="text" name="six" placeholder="과목 입력" style="width:100px;"></td>
            <td><input type="text" name="seven" placeholder="과목 입력" style="width:100px;"></td>
            <td><input type="text" name="eight" placeholder="과목 입력" style="width:100px;"></td>
            <td><input type="text" name="nine" placeholder="과목 입력" style="width:100px;"></td>
            <td><input type="text" name="ten" placeholder="과목 입력" style="width:100px;"></td>
         </tr>

      </table>
         
      	<br>
         <input type="submit" value="시간표 등록">
      
      </form>
   <p><br><br><br><br>
         <h2>시간표</h2>
         <br>
   </center>
   <center>
   <%
      try{
         String sql = "select * from TIMETABLE order by NUM ";
         pstmt = conn.prepareStatement(sql);
         
         ResultSet rs = pstmt.executeQuery();
         int i=1;
         out.print("<table border=1 height=35 class=table align=center><th>요일</th><th>1교시</th><th>2교시</th><th>3교시</th><th>4교시</th><th>5교시</th><th>6교시</th><th>7교시</th><th>8교시</th><th>9교시</th><th>10교시</th></table>");
         while(rs.next()){
            out.print("<table border=1 height=35 class=table align=center>");
            out.print("<tr>");
            {out.print("<td>"+rs.getString(1)+"</td>") ;}
            
            if(rs.getString(2)== null){
               out.print(("<td></td>"));
            }
            else{out.print("<td>"+rs.getString(2)+"</td>") ;}
         
            if(rs.getString(3)== null){
               out.print(("<td></td>"));
            }
            else{out.print("<td>"+rs.getString(3)+"</td>") ;}
            
            if(rs.getString(4)== null){
               out.print(("<td></td>"));
            }
            else{out.print("<td>"+rs.getString(4)+"</td>") ;}
            
            if(rs.getString(5)== null){
               out.print(("<td></td>"));
            }
            else{out.print("<td>"+rs.getString(5)+"</td>") ;}
            
            if(rs.getString(6)== null){
               out.print(("<td></td>"));
            }
            else{out.print("<td>"+rs.getString(6)+"</td>") ;}
            
            if(rs.getString(7)== null){
               out.print(("<td></td>"));
            }
            else{out.print("<td>"+rs.getString(7)+"</td>") ;}
            
            if(rs.getString(8)== null){
               out.print(("<td></td>"));
            }
            else{out.print("<td>"+rs.getString(8)+"</td>") ;}
            
            if(rs.getString(9)== null){
               out.print(("<td></td>"));
            }
            else{out.print("<td>"+rs.getString(9)+"</td>") ;}
            
            if(rs.getString(10)== null){
               out.print(("<td></td>"));
            }
            else{out.print("<td>"+rs.getString(10)+"</td>") ;}
            
            if(rs.getString(11)== null){
               out.print(("<td></td>"));
            }
            else{out.print("<td>"+rs.getString(11)+"</td>") ;}
            
            
            out.print("</tr>");   
                     
            out.print("</table>");
            
            
            
         }
         rs.close();
         pstmt.close();
         conn.close();
      }catch(Exception e){
         System.out.println(e);
      }
   %>
</center>
</body>
</html>