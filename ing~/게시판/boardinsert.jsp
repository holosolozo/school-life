<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������</title>
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
	//����Ŭ ����̹� ����
	Class.forName(driver);
	//��񿬰�
	conn = DriverManager.getConnection(url,user,pw);
	//���Ӽ���
	out.println("��񿬰Ἲ��");
	Statement stmt = conn.createStatement();
	
	String sql = "INSERT INTO BBS"+ 
				"(BBSID,BBSTITLE,USERID,BBSDATE,BBSCONTENT,BBSCOUNT)"+
				"VALUES(bbs_seq.nextval,'"+title+"','"+userID+"',sysdate,'"+content+"', '0')";
	stmt.executeUpdate(sql);
	
	conn.close();
	}catch(Exception e){
		out.println("��񿬰����");
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