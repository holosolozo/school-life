<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
	request.setCharacterEncoding("euc-kr");
	int idx =1;
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String mydate = request.getParameter("mydate");
	
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
	
	String sql = "INSERT INTO BOARD"+ 
				"(IDX,TITLE,CONTENT,MYDATE)"+
				"VALUES(board_seq.nextval,'"+title+"','"+content+"', sysdate)";
	stmt.executeUpdate(sql);
	
	conn.close();
	}catch(Exception e){
		out.println("디비연결실패");
		out.println(e.getMessage());
		e.getStackTrace();
	}finally{
		out.print("<script>location.href='list.jsp';</script>");
	}
	RequestDispatcher rd = request.getRequestDispatcher("write.jsp");
	rd.forward(request,response);

%>

</body>
</html>