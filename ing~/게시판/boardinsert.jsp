<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>글저장</title>
</head>
<body>
<% 

	request.setCharacterEncoding("euc-kr");
	int bbsid =1;
	String title = request.getParameter("bbstitle");
	String userID = (String)session.getAttribute("userID");
	String content = request.getParameter("bbscontent");

	
	Connection conn = null;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	Boolean connect =false;
	String user = "scott";
	String pw = "tiger";
	
	try{
	//오라클 드라이버 접속
	Class.forName(driver);
	//디비연결
	conn = DriverManager.getConnection(url,user,pw);
	//접속성공
	out.println("디비연결성공");
	Statement stmt = conn.createStatement();
	
	String sql = "INSERT INTO BBS"+ 
				"(BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSCOUNT)"+
				"VALUES(bbs_seq.nextval,'"+title+"','"+userID+"',sysdate,'"+content+"', '0')";
	stmt.executeUpdate(sql);
	
	conn.close();
	}catch(Exception e){
		out.println("디비연결실패");
		out.println(e.getMessage());
		e.getStackTrace();
	}finally{
		out.print("<script>location.gref='board.jsp';</script>");
	}
	RequestDispatcher rd = request.getRequestDispatcher("board.jsp");
	rd.forward(request,response);

%>

</body>
</html>