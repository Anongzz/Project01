<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import = "java.io.PrintWriter, java.util.*, java.sql.*"%>
<%
	//사용자가 보낸 데이터를 한글을 사용할 수 있는 형식으로 변환
	request.setCharacterEncoding("UTF-8");
	String buildingName = null;
	String basicPrice = null;
	String basicTime = null;
	String addPrice = null;
	String addTime = null;

	if (request.getParameter("buildingName") != null) {
		buildingName = (String) request.getParameter("buildingName");
	}

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
	if (buildingName == null || basicPrice==null || basicTime==null || addPrice==null || addTime==null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("location.href='CreateBuildings.jsp';");
		script.println("</script>");
		script.close();
		return;	
	}

	Object getData = session.getAttribute("id");
	String ObjToStringValue = (String)getData;
	
	System.out.println("userCreateBuilding.jsp 진입");
	
	UserDAO userDAO = new UserDAO();
	userDAO.createBuilding_step1(ObjToStringValue, buildingName);
	userDAO.createBuilding_step2(ObjToStringValue, buildingName, basicPrice, basicTime, addPrice, addTime);
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('건물 정보가 생성되었습니다.')");
	script.println("location.href='userBuildings.jsp';");
	script.println("</script>");
	script.close();
%>