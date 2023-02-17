package doc1.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("*.mvc")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청한 주소를 가져온다.
				String url = request.getRequestURI();
				//View 로 사용할 JSP 지정
				String viewName = null;
				
				if(url.contains("userBuildings.mvc")) {
					//System.out.println("main.mvc 가 요청함");
					viewName = "userBuildings.jsp";
				}else if(url.contains("userIndependentBuilding.mvc")) {
					//System.out.println("userIndependentBuilding.mvc 가 요청함");
					String str1 = request.getParameter("data1");
					
					String result = str1;
					HttpSession session1 = request.getSession();
					session1.setAttribute("buildingName", result);
					request.setAttribute("result", result);
					viewName = "userIndependentBuilding.jsp";
				}else if(url.contains("deleteBuilding.mvc")) {
					//System.out.println("deleteBuilding.mvc 가 요청함");
					String str1 = request.getParameter("data1");
					String str2 = request.getParameter("data2");
					
					String result1= str1;
					String result2= str2;
					
					HttpSession session1 = request.getSession();
					session1.setAttribute("id", result1);
					session1.setAttribute("buildingName", result2);
					request.setAttribute("result", result1);
					viewName = "deleteBuilding.jsp";
				}else if(url.contains("editBuilding.mvc")) {
					System.out.println("editBuilding.mvc 가 요청함");
					
					String str1 = request.getParameter("data1");
					String str2 = request.getParameter("data2");
					
					HttpSession session1 = request.getSession();
					session1.setAttribute("id", str1);
					session1.setAttribute("buildingName", str2);
					request.setAttribute("result", str1);
					viewName = "editBuilding.jsp";
				}
				
				RequestDispatcher dis = request.getRequestDispatcher(viewName);
				dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
