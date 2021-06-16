<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<jsp:useBean id="myscore" class="score.Scorebean"/>
<jsp:setProperty name="myscore" property="*"/>
<%myscore.ScoreCalc(); %>
<!DOCTYPE html>
<html>
<head>


   <!-- link ���� --> 
   <link rel="stylesheet" href="style.css">
   <link rel="stylesheet" href="style_index.css"> 
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
<style>
	body {
 	  font: 15px "Lucida Grande", Helvetica, Arial, sans-serif;
	}
    .table {
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
<meta charset="EUC-KR">
<title>�������Զ�</title>
</head>
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
<div class="score" align="center" style="margin:20px;">
      <form action="ScoreCalc2.jsp" method="post">     
	  <table class="table" row=100 cals=100>
			<tr>
				<th colspan="2">1�г�</th>
				<th colspan="2">2�г�</th>
				<th colspan="2">3�г�</th>
				<th colspan="2">4�г�</th>
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
			<tr>
				<th><input type=number id="num1_1" name="num1_1" step="any"></th>
				<th><input type=number id="num1_2" name="num1_2" step="any"></th>
				<th><input type=number id="num2_1" name="num2_1" step="any"></th>
				<th><input type=number id="num2_3" name="num2_2" step="any"></th>
				<th><input type=number id="num3_1" name="num3_1" step="any"></th>
				<th><input type=number id="num3_2" name="num3_2" step="any"></th>
				<th><input type=number id="num4_1" name="num4_1" step="any"></th>
				<th><input type=number id="num4_2" name="num4_2" step="any"></th>
			</tr>					
	  </table>
	  </div>
	
	  <center>
		  <input type="submit" id="submit" value="����ϱ�">
		  <input type="reset"  value="���">
	  </center>
	  </form>
 	 <br>
 	 <br><br>
 	 <center>
 	 <form>
			  <table class="table" row=100 cals=100>
			  	<tr width= "200">
			  		<th>����</th>
			  	</tr>
			  	<tr>
			  		<th> 0.0��/ 4.5 ���� </th>
			  	
			  	</tr>
			  </table>
	 </form>
	 </center>
	  	<div class = 'scorelist' align="center"> 
	  	<br><br>
	  	<h3 style="color:#168;">����ǥ</h3>
	 	<br>
		<iframe src = "Scorelist.jsp" width="80%" height="300" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=yes vspace=0></iframe>
	</div>  
</body>
</html>