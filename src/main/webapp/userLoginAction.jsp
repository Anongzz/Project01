<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import = "java.io.PrintWriter"%>
<%
	//사용자가 보낸 데이터를 한글을 사용할 수 있는 형식으로 변환
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	String userPW = null;
	
	String sessionValue = "";

	if (request.getParameter("userID") != null) {
		userID = (String) request.getParameter("userID");
	}

	if (request.getParameter("userPW") != null) {
		userPW = (String) request.getParameter("userPW");
	}
	if (userID == null || userPW == null ) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디와 비밀번호를 입력해주세요.')");
		script.println("location.href='index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}

	UserDAO userDAO = new UserDAO();
	int result = userDAO.login2(userID, userPW);
	if (result == 1) {
		HttpSession session1 = request.getSession();
		session1.setAttribute("id", userID);
		sessionValue = String.valueOf(session1.getAttribute("id")); 
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='userBuildings.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디 혹은 비밀번호를 확인해주세요.')");
		script.println("location.href='index.jsp';");
		script.println("</script>");
	}
%>