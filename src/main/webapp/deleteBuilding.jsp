<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import = "java.io.PrintWriter, java.util.*, java.sql.*"%>
<%
	//사용자가 보낸 데이터를 한글을 사용할 수 있는 형식으로 변환
	request.setCharacterEncoding("UTF-8");
	String buildingName = null;
	

	Object getData = session.getAttribute("id");
	Object getData2= session.getAttribute("buildingName");
	String ObjToStringValue = (String)getData;
	String ObjToBuildingValue = (String)getData2;
	
	System.out.println("deleteBuilding.jsp 진입");
	
	UserDAO userDAO = new UserDAO();
	userDAO.deleteBuilding(ObjToStringValue, ObjToBuildingValue);
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('건물 정보가 삭제되었습니다.')");
	script.println("location.href='userBuildings.jsp';");
	script.println("</script>");
	script.close();
%>