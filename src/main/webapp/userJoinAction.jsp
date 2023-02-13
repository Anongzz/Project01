<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import = "java.io.PrintWriter, java.util.*, java.sql.*"%>
<%
	//사용자가 보낸 데이터를 한글을 사용할 수 있는 형식으로 변환
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPW = null;
	String userName = null;

	if (request.getParameter("userID") != null) {
		userID = (String) request.getParameter("userID");
	}

	if (request.getParameter("userPW") != null) {
		userPW = (String) request.getParameter("userPW");
	}

	if (request.getParameter("userName") != null) {
		userName = (String) request.getParameter("userName");
	}
	if (userID == null || userPW == null || userName==null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("</script>");
		script.close();
		return;
	}

	UserDAO userDAO = new UserDAO();
	int result = userDAO.join2(userName, userID, userPW);
	if (result == 1) {
		/* Connection conn= null;
		try {
			// JDBC Driver 등록
			Class.forName("com.mysql.cj.jdbc.Driver");

			// 연결하기
			conn = DriverManager.getConnection("jdbc:mysql://localhost/parking", "root", "1234");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		String sql = "CREATE TABLE "+userID+"(buildingName VARCHAR(20),createDate DATE,fees VARCHAR(50))";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate(); */
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입에 성공했습니다.')");
		script.println("location.href='index.jsp';");
		script.println("</script>");
		script.close();
		
		return;
	}
%>