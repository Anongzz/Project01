<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*, java.io.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>주차 요금 정산</title>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Poor+Story&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poor Story", sans-serif;
}

body {
	margin: 0;
	padding: 0;
	background: linear-gradient(120deg, #87ceeb, #b0e0e6);
	height: 100vh;
	overflow: hidden;
}

table {
  border-collapse: separate;
  border-spacing: 0;
  width: 100%;
}
th,
td {
  padding: 6px 15px;
  font-size: 20px;
}
th {
  background: #42444e;
  color: #fff;
  text-align: center;
}
tr:first-child th:first-child {
  border-top-left-radius: 6px;
}
tr:first-child th:last-child {
  border-top-right-radius: 6px;
}
td {
  border-right: 1px solid #c6c9cc;
  border-bottom: 1px solid #c6c9cc;
}
td:first-child {
  border-left: 1px solid #c6c9cc;
}
tr:nth-child(even) td {
  background: #eaeaed;
}
tr:last-child td:first-child {
  border-bottom-left-radius: 6px;
}
tr:last-child td:last-child {
  border-bottom-right-radius: 6px;
}


.centerLogin {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 1200px;
	height: 800px;
	background: white;
	border-radius: 10px;
	box-shadow: 10px 10px 15px rgba(0, 0, 0, 0.05);
}

.centerLogin h1 {
	text-align: center;
	padding: 20px 0;
	border-bottom: 1px solid silver;
}
.inputValueZone{
	position: relative;
	margin: 10px;
	width: 600px;
	height: 650px;
	border-radius: 10px;
	background-color: #F0F0F0;
	left: 550px;
	top: 25px;
}

.inputZone {
	position: absolute;
	margin: 10px;
	width: 500px;
	height: 700px;
	border: 1px solid;
	border-color: black;
}

.inputZone h2 {
	text-align: center;
	font-size: 25pt;
	border-bottom: 3px solid silver;
}

.inputZone p {
	font-size: 20pt;
	border-bottom: 1px solid black;
}
</style>
</head>
<body>
<%


Object getData = session.getAttribute("id");

String ObjToStringValue = (String)getData;
if(ObjToStringValue==null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("location.href='index.jsp';");
	script.println("</script>");	
}
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String no = request.getParameter("no");

String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://127.0.0.1:3306/parking";
        
Class.forName(driver);

Connection conn = DriverManager.getConnection(url,"root","1234");

//Statement stmt = conn.createStatement();


String strSQL = "SELECT * FROM parkingInformation WHERE ='"+ObjToStringValue+"'";

PreparedStatement pstmt = conn.prepareStatement(strSQL);
ResultSet rs = pstmt.executeQuery(strSQL);


%>
<p>로그인ID: <%=ObjToStringValue %></p>

	<div class="centerLogin">
		<h1>로그인 성공시 출력 페이지</h1>
		<div class="inputZone">
			<h2>입 출차 목록</h2>
			<table>
			<thead>
			<tr>
			<th>시간</th>
			<th>차량번호</th>
			<th>상태</th>
			</tr>
			</thead>
			<tbody>
			<%
			while(rs.next()){

			String parkingTime = rs.getString("parkingTime");
			String CarNumber = rs.getString("CarNumber");
			String isParking = rs.getString("IsParking");
			
			%>
			<tr>
				<td><b><%=parkingTime %></b></td>
				<td><b><%=CarNumber %></b></td>
				<td><b><%=isParking %></b></td>
			</tr>
			<%} %>
			</tbody>
			</table>
			
		</div>
		<input type="button" value="로그아웃" onclick="location.href='LogOut.jsp'" style="position:absolute; right: 10px;">
		<div class="inputValueZone">
		<form action="" method="post" style="padding: 10px 10px 10px 10px;">
		<div style="position: absolute; left: 75px; top: 50px;">
		<label for="" style="font-size: 30px;padding: 10px 10px 10px 10px;"><b>기본 시간(분)</b></label><br>
			<input type="text" placeholder="input 1" style="padding: 10px 10px 10px 10px;height: 40px; width:200px; font-size: 20pt;"><br>
		</div>
			<div style="position: absolute; right: 75px; top: 50px;">
			<label for="" style="font-size: 30px;padding: 10px 10px 10px 10px;"><b>기본 요금(원)</b></label><br>
			<input type="text" placeholder="input 2" style="padding: 10px 10px 10px 10px;height: 40px; width:200px; font-size: 20pt;">
			</div>
			<div style="position: absolute; left: 75px; top: 150px;">
		<label for="" style="font-size: 30px;padding: 10px 10px 10px 10px;"><b>추가 시간(분)</b></label><br>
			<input type="text" placeholder="input 3" style="padding: 10px 10px 10px 10px;height: 40px; width:200px; font-size: 20pt;"><br>
		</div>
			<div style="position: absolute; right: 75px; top: 150px;">
			<label for="" style="font-size: 30px;padding: 10px 10px 10px 10px;"><b>추가 요금(원)</b></label><br>
			<input type="text" placeholder="input 4" style="padding: 10px 10px 10px 10px;height: 40px; width:200px; font-size: 20pt;">
			</div>
			<div style="position: absolute; right: 240px; top: 450px;">
			<label for="" style="text-align:center; font-size: 30px;padding: 10px 10px 10px 10px;"><b>정산 결과</b></label><br>
			<p style="text-align:center; font-size: 40px"><b>1234</b></p>
			</div>
			
			
		</form>
		</div>
		

	</div>
	<%rs.close();
	pstmt.close();
	conn.close();
	%>
</body>
</html>
