<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import = "java.io.PrintWriter, java.util.*, java.sql.*"%>
<%
	//사용자가 보낸 데이터를 한글을 사용할 수 있는 형식으로 변환
	request.setCharacterEncoding("UTF-8");
	String basicPrice = null;
	String basicTime = null;
	String addPrice = null;
	String addTime = null;


	if (request.getParameter("basicPrice") != null) {
		basicPrice = (String) request.getParameter("basicPrice");
	}
	if (request.getParameter("basicTime") != null) {
		basicTime = (String) request.getParameter("basicTime");
	}
	if (request.getParameter("addPrice") != null) {
		addPrice = (String) request.getParameter("addPrice");
	}
	if (request.getParameter("addTime") != null) {
		addTime = (String) request.getParameter("addTime");
	}
	if (basicPrice==null || basicTime==null || addPrice==null || addTime==null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("location.href='editBuilding.jsp';");
		script.println("</script>");
		script.close();
		return;	
	}

	Object getData = session.getAttribute("id");
	Object getData2 = session.getAttribute("buildingName");
	String ObjToStringValue = (String)getData;
	String ObjToBuildingValue=(String)getData2;
	
	System.out.println("userEditBuilding.jsp 진입");
	
	UserDAO userDAO = new UserDAO();
	userDAO.editBuilding(ObjToStringValue, ObjToBuildingValue, basicPrice, basicTime, addPrice, addTime);
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('주차장 정보가 변경되었습니다.')");
	script.println("location.href='userBuildings.jsp';");
	script.println("</script>");
	script.close();
%>