<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body>
<% 
	request.setCharacterEncoding("euc-kr");
	String userID = request.getParameter("userID");
	String userPassword = request.getParameter("userPassword");
	
	request.getSession().setAttribute("userID",userID);

	Connection conn=null;
	String sql =  "SELECT * FROM MEMBER WHERE USERID='" + userID + "'";

	try{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String pw = "tiger";
	ResultSet rs=null;
		
	//오라클 드라이버 접속
	Class.forName(driver);
	//디비연결
	conn = DriverManager.getConnection(url,user,pw);
	//접속성공
	PreparedStatement pstmt = conn.prepareStatement(sql);
	//db 업데이트
	pstmt.executeUpdate();
	//값 받아올수 있는 객체 만들기
	rs = pstmt.executeQuery();
	
	if (rs.next()) {
		if (userID.equals(rs.getString("userID")) == true & userPassword.equals(rs.getString("userPassword")) == true) {
			rs.close();
			response.sendRedirect("main.jsp"); //메인화면으로 연결 바꾸기
		}else if(userID.equals(rs.getString("userID")) == true & userPassword.equals(rs.getString("userPassword")) == false){
			rs.close();
			%>
			<script>
				alert("아이디나 비밀번호가 잘못되었습니다.");
				history.back();
			</script><% 
		}
	}else{ rs.close();
	%>
	<script>
		alert("아이디나 비밀번호가 잘못되었습니다.");
		history.back();
	</script>
	<%
		}
	}catch(Exception e){
		out.println("db연결실패");
		e.printStackTrace();
	}finally{
		conn.close();
	}
%>
</body>
</html>