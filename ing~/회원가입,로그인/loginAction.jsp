<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���</title>
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
		
	//����Ŭ ����̹� ����
	Class.forName(driver);
	//��񿬰�
	conn = DriverManager.getConnection(url,user,pw);
	//���Ӽ���
	PreparedStatement pstmt = conn.prepareStatement(sql);
	//db ������Ʈ
	pstmt.executeUpdate();
	//�� �޾ƿü� �ִ� ��ü �����
	rs = pstmt.executeQuery();
	
	if (rs.next()) {
		if (userID.equals(rs.getString("userID")) == true & userPassword.equals(rs.getString("userPassword")) == true) {
			rs.close();
			response.sendRedirect("main.jsp"); //����ȭ������ ���� �ٲٱ�
		}else if(userID.equals(rs.getString("userID")) == true & userPassword.equals(rs.getString("userPassword")) == false){
			rs.close();
			%>
			<script>
				alert("���̵� ��й�ȣ�� �߸��Ǿ����ϴ�.");
				history.back();
			</script><% 
		}
	}else{ rs.close();
	%>
	<script>
		alert("���̵� ��й�ȣ�� �߸��Ǿ����ϴ�.");
		history.back();
	</script>
	<%
		}
	}catch(Exception e){
		out.println("db�������");
		e.printStackTrace();
	}finally{
		conn.close();
	}
%>
</body>
</html>