<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import = "java.io.PrintWriter"%>
<%
	//����ڰ� ���� �����͸� �ѱ��� ����� �� �ִ� �������� ��ȯ
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
		script.println("alert('���̵�� ��й�ȣ�� �Է����ּ���.')");
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
		script.println("alert('���̵� Ȥ�� ��й�ȣ�� Ȯ�����ּ���.')");
		script.println("location.href='index.jsp';");
		script.println("</script>");
	}
%>