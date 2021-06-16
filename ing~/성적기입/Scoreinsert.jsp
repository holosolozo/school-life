<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="myscore" class="score.Scorebean"/>
<jsp:setProperty name="myscore" property="*"/>
<%myscore.ScoreCalc(); %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<title>성적기입</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	String one1 = request.getParameter("num1_1");
	String one2 = request.getParameter("num1_2");
	String two1 = request.getParameter("num2_1");
	String two2 = request.getParameter("num2_2");
	String three1 = request.getParameter("num3_1");
	String three2 = request.getParameter("num3_2");
	String four1 = request.getParameter("num4_1");
	String four2 = request.getParameter("num4_2");
	String avg =  request.getParameter("score");

	Connection conn = null;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
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
		
		String sql = "INSERT INTO SCORE"+ 
					"(SDATE,ONE1,ONE2,TWO1,TWO2,THREE1,THREE2,FOUR1,FOUR2,AVG,NUM)"+
					"VALUES(sysdate,'"+one1+"','"+one2+"', '"+two1+"','"+two2+"','"+three1+"','"+three2+"','"+four1+"','"+four2+"', '"+avg+"',score_seq.nextval)";
		stmt.executeUpdate(sql);
		conn.close();
	}catch(Exception e){
		out.println("디비연결실패");
		out.println(e.getMessage());
		e.getStackTrace();
	}finally{
		out.print("<script>location.href='ScoreCalc.jsp';</script>");
	}

%>
</body>
</html>