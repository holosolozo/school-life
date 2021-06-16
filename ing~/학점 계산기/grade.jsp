<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>학점계산기</title>
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
<style>
    .table {
      margin:20px;
      border-collapse: collapse;
      border-top: 3px solid #168;
      width:80%;
      
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
      <%
            /* 결과 값 */
            double result1=0, result2=0, result3=0, result4=0, result5=0, result6=0, result7=0, result8=0, sum_result=0, n_sum_result=0;
            int sum_grade=0, i=1;
            request.setCharacterEncoding("EUC-KR");
            /* 과목 = obj*/
            String obj1 = request.getParameter("obj1");
            String obj2 = request.getParameter("obj2");
            String obj3 = request.getParameter("obj3");
            String obj4 = request.getParameter("obj4");
            String obj5 = request.getParameter("obj5");
            String obj6 = request.getParameter("obj6");
            String obj7 = request.getParameter("obj7");
            String obj8 = request.getParameter("obj8");
            /* 학점 = grade */
            int grade1 = 0,grade2 = 0,grade3 = 0,grade4 = 0,grade5 = 0,grade6 = 0, grade7 = 0, grade8 = 0;
            if(request.getParameter("grade1").length()!=0){
                grade1=Integer.parseInt(request.getParameter("grade1"));
            }
            if(request.getParameter("grade2").length()!=0){
               grade2=Integer.parseInt(request.getParameter("grade2"));
           }
            if(request.getParameter("grade3").length()!=0){
                  grade3=Integer.parseInt(request.getParameter("grade3"));
              }
            if(request.getParameter("grade4").length()!=0){
                  grade4=Integer.parseInt(request.getParameter("grade4"));
              }
            if(request.getParameter("grade5").length()!=0){
                  grade5=Integer.parseInt(request.getParameter("grade5"));
              }
            if(request.getParameter("grade6").length()!=0){
                  grade6=Integer.parseInt(request.getParameter("grade6"));
              }
            if(request.getParameter("grade7").length()!=0){
                 grade7=Integer.parseInt(request.getParameter("grade7"));
             }
            if(request.getParameter("grade8").length()!=0){
                 grade8=Integer.parseInt(request.getParameter("grade8"));
             }
            /* 성적 = record ex)A+ */
            String record1 = request.getParameter("record1");
            String record2 = request.getParameter("record2");      
            String record3 = request.getParameter("record3");      
            String record4 = request.getParameter("record4");      
            String record5 = request.getParameter("record5");      
            String record6 = request.getParameter("record6");
            String record7 = request.getParameter("record7");
            String record8 = request.getParameter("record8");

            
            if(record1.equals("A+")){
               result1 = grade1*4.5;
            }else if(record1.equals("A0")){
               result1 = grade1*4.0;
            }else if(record1.equals("B+")){
               result1 = grade1*3.5;
            }else if(record1.equals("b0")){
               result1 = grade1*3.0;
            }else if(record1.equals("C+")){
               result1 = grade1*2.5;
            }else if(record1.equals("C0")){
               result1 = grade1*2.0;
            }else if(record1.equals("D+")){
               result1 = grade1*1.5;
            }else if(record1.equals("D0")){
               result1 = grade1*1.0;
            }else if(record1.equals("F")){
               result1 = grade1*0;
            }
            if(record2.equals("A+")){
               result2 = grade2*4.5;
            }else if(record2.equals("A0")){
               result2 = grade2*4.0;
            }else if(record2.equals("B+")){
               result2 = grade2*3.5;
            }else if(record2.equals("b0")){
               result2 = grade2*3.0;
            }else if(record2.equals("C+")){
               result2 = grade2*2.5;
            }else if(record2.equals("C0")){
               result2 = grade2*2.0;
            }else if(record2.equals("D+")){
               result2 = grade2*1.5;
            }else if(record2.equals("D0")){
               result2 = grade2*1.0;
            }else if(record2.equals("F")){
               result2 = grade2*0;
            }
            if(record3.equals("A+")){
                result3 = grade3*4.5;
             }else if(record3.equals("A0")){
                result3 = grade3*4.0;
             }else if(record3.equals("B+")){
                result3 = grade3*3.5;
             }else if(record3.equals("b0")){
                result3 = grade3*3.0;
             }else if(record3.equals("C+")){
                result3 = grade3*2.5;
             }else if(record3.equals("C0")){
                result3 = grade3*2.0;
             }else if(record3.equals("D+")){
                result3 = grade3*1.5;
             }else if(record3.equals("D0")){
                result3 = grade3*1.0;
             }else if(record3.equals("F")){
                result3 = grade3*0;
             }
            if(record4.equals("A+")){
                result4 = grade4*4.5;
             }else if(record4.equals("A0")){
                result4 = grade4*4.0;
             }else if(record4.equals("B+")){
                result4 = grade4*3.5;
             }else if(record4.equals("b0")){
                result4 = grade4*3.0;
             }else if(record4.equals("C+")){
                result4 = grade4*2.5;
             }else if(record4.equals("C0")){
                result4 = grade4*2.0;
             }else if(record4.equals("D+")){
                result4 = grade4*1.5;
             }else if(record4.equals("D0")){
                result4 = grade4*1.0;
             }else if(record4.equals("F")){
                result4 = grade4*0;
             }
            if(record5.equals("A+")){
                result5 = grade5*4.5;
             }else if(record5.equals("A0")){
                result5 = grade5*4.0;
             }else if(record5.equals("B+")){
                result5 = grade5*3.5;
             }else if(record5.equals("b0")){
                result5 = grade5*3.0;
             }else if(record5.equals("C+")){
                result5 = grade5*2.5;
             }else if(record5.equals("C0")){
                result5 = grade5*2.0;
             }else if(record5.equals("D+")){
                result5 = grade5*1.5;
             }else if(record5.equals("D0")){
                result5 = grade5*1.0;
             }else if(record5.equals("F")){
                result5 = grade5*0;
             }
            if(record6.equals("A+")){
                result6 = grade6*4.5;
             }else if(record6.equals("A0")){
                result6 = grade6*4.0;
             }else if(record6.equals("B+")){
                result6 = grade6*3.5;
             }else if(record6.equals("b0")){
                result6 = grade6*3.0;
             }else if(record6.equals("C+")){
                result6 = grade6*2.5;
             }else if(record6.equals("C0")){
                result6 = grade6*2.0;
             }else if(record6.equals("D+")){
                result6 = grade6*1.5;
             }else if(record6.equals("D0")){
                result6 = grade6*1.0;
             }else if(record6.equals("F")){
                result6 = grade6*0;
             }
            if(record7.equals("A+")){
                result7 = grade7*4.5;
             }else if(record6.equals("A0")){
                result7 = grade7*4.0;
             }else if(record6.equals("B+")){
                result7 = grade7*3.5;
             }else if(record6.equals("b0")){
                result7 = grade7*3.0;
             }else if(record6.equals("C+")){
                result7 = grade7*2.5;
             }else if(record6.equals("C0")){
                result7 = grade7*2.0;
             }else if(record6.equals("D+")){
                result7 = grade7*1.5;
             }else if(record6.equals("D0")){
                result7 = grade7*1.0;
             }else if(record6.equals("F")){
                result7 = grade7*0;
             }
            if(record8.equals("A+")){
                result8 = grade8*4.5;
             }else if(record6.equals("A0")){
                result8 = grade8*4.0;
             }else if(record6.equals("B+")){
                result8 = grade8*3.5;
             }else if(record6.equals("b0")){
                result8 = grade8*3.0;
             }else if(record6.equals("C+")){
                result8 = grade8*2.5;
             }else if(record6.equals("C0")){
                result8 = grade8*2.0;
             }else if(record6.equals("D+")){
                result8 = grade8*1.5;
             }else if(record6.equals("D0")){
                result8 = grade8*1.0;
             }else if(record6.equals("F")){
                result8 = grade8*0;
             }
            sum_grade=grade1+grade2+grade3+grade4+grade5+grade6;
            sum_result=(result1+result2+result3+result4+result5+result6)/sum_grade;
            n_sum_result=Math.round(sum_result*100)/100.0;
        
      %>
<form>
  <div align="center">
  <table class="table" row=100 cals=100>
    <caption>표 제목</caption>
    <tr><th width="300" align=left>과목명</th><th width="10">학점</th><th width="10">성적</th></tr>
    <tr><td><%=obj1%></td><td><%=grade1%></td><td><%=record1%></td>
    <tr><td><%=obj2%></td><td><%=grade2%></td><td><%=record2%></td>
    <tr><td><%=obj3%></td><td><%=grade3%></td><td><%=record3%></td>
    <tr><td><%=obj4%></td><td><%=grade4%></td><td><%=record4%></td>
    <tr><td><%=obj5%></td><td><%=grade5%></td><td><%=record5%></td>
    <tr><td><%=obj6%></td><td><%=grade6%></td><td><%=record6%></td>
    <tr><td><%=obj7%></td><td><%=grade7%></td><td><%=record7%></td>
    <tr><td><%=obj8%></td><td><%=grade8%></td><td><%=record8%></td>
    <tr><td colspan='3' align=center>평점: <%=n_sum_result%></td></tr>
    <tr><td colspan='3' align="center"><button type="button" onclick="location.href='grademain.jsp'">다시 입력하기</button></td></tr>
  </table>
  </div>  
</form>
</body>
</html>