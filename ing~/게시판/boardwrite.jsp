<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�۾���</title>

<link rel="stylesheet" href="writestyle.css"> 
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
	<div class="main" align="center">
	<form name="boardwrite" action="boardinsert.jsp" method="post">
	<div class="bbstitle" align="left">
	<br>
	<input type = "text" name = "bbstitle" placeholder='����' style="width:50%;" />&nbsp;&nbsp;<br>
	</div>
	<div class="bbscontent">
	<textarea   name="bbscontent" placeholder='������ �Է��ϼ���' style="width:100%; height:100%"></textarea>
	</div>
	<br>
	<input type = "submit" value="���"/>&nbsp;&nbsp;&nbsp;
	<input type=reset value="���"/>&nbsp;&nbsp;&nbsp;
	<input type=button value="���" onclick="location.href='board.jsp'"/>
	</form>
	</div> 

	</body>
</html>