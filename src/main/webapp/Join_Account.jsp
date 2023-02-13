<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주차 요금 정산</title>
<link rel="stylesheet" href="style.css">
</head>
<script type="text/javascript">
function check_pw(){
    var pw = document.getElementById('pw').value;
    var SC = ["!","@","#","$","%"];
    var check_SC = 0;

    if(pw.length < 6 || pw.length>16){
        window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
        document.getElementById('pw').value='';
    }
    for(var i=0;i<SC.length;i++){
        if(pw.indexOf(SC[i]) != -1){
            check_SC = 1;
        }
    }
    /*if(check_SC == 0){
        window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
        document.getElementById('pw').value='';
    }*/
    if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
        if(document.getElementById('pw').value==document.getElementById('pw2').value){
            document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('check').style.color='blue';
        }
        else{
            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('check').style.color='red';
        }
    }
}
</script>
<body>
	<div class="center">
		<h1>회원가입</h1>
		<form method="post" action="userJoinAction.jsp">
			<p>회원가입에 필요한 정보를 입력해주세요
			<div class="txt_field">
				<input type="text" name="userName" required> <span></span> <label>이름</label>
			</div>
			<div class="txt_field">
				<input type="text" name="userID" required> <span></span> <label>아이디</label>
			</div>
			<div class="txt_field">
				<input type="password" name="userPW" id="pw" onchange="check_pw()"
					required> <span></span> <label>비밀번호</label>
			</div>

			<!-- <div class="txt_field">
				<input type="password" name="userPW_Check" id="pw2"
					onchange="check_pw()" required> <label>비밀번호 확인</label> <span id="check"></span>
			</div> -->
			<input type="submit" name="commit" value="회원가입">
			<div class="signup_link">
				<a href="index.jsp">뒤로가기</a>
			</div>
		</form>
	</div>

</body>
</html>