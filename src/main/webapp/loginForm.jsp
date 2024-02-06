<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<style>

body {
	margin: 0;
	background-color: #e4f2f2;
}

#header {
	border: 1px solid black;
	height: 100px;
}

#loginBox {
	text-align: center;
	margin: 200px auto;
	border: 1px solid white;
	width: 1050px;
	background-color: white;
	height: 400px;
	border-radius: 8px;
	vertical-align : middle;
	box-shadow : 2px 2px 7px gray;
}

#logo {
	width: 450px;
	height: 150px;
	vertical-align: middle;
}

a {
	text-decoration: none;
	color: black;
}

span#login {
	display: inline-block;
	height: 90px;
	text-align : left;
}

#submitBtn{
  	display : inline-block;
	padding : 25px 15px;
	border : 1px solid #44a4a6;
	background-color: #44a4a6;
	color : white;
	border-radius : 5px;
}

input#submitBtn:hover{
	cursor : pointer;
	border : 1px solid black;
}

form{
	margin-top : 60px;
}

.imgbox1{
	float: left;
	width : 530px;
	padding-left : 20px;
	border-right : 1px solid gray;
}

.loginbox1{
	float : left;
	padding-left : 80px;
}

.loginbox2{
	float : right;
	padding : 15px 0;
	width : 180px;
}

.loginput{
	padding : 5px;
	width : 100%;
}

.submitbox{
	float : right;
	padding : 17px 0;
	width : 140px;
}

p.info{
	float : right;
	color : #44a4a6;
	width : 560px;
	margin-bottom : 0;
	font-weight : bold;
	
}

input:focus{
	outline:1px solid #44a4a6;
	border-radius : 3px;
	box-shadow : none;
}

p.loginInfo{
	width : 280px;
	text-align : right;
	color : gray;
	font-size : 11px;
}


</style>
</head>
<body>
	<!-- 로그인 페이지 -->

	
	<div id="loginBox">
		<form action="./loginAction.me" method="post">
			<br>
			<p class = "info">하이미디어 대학교 통합 로그인</p>
			<div class="imgbox1"><img src="./img/mainlogo.png" id="logo" /> </div>
			<div class="loginbox1">
			<br>
			<div class="submitbox">
			<input type="submit" id="submitBtn" value="로그인" name="login" /></div>	
			<div class="loginbox2">
			<span id="login">		
				<label>
				<input type="text" id="id" name="Student_Id" class="loginput" placeholder="아이디" />
				</label>
					<br><br> 
				<label>
				<input type="password" id="pwd" name="Student_Pw" class="loginput" placeholder="비밀번호" /></label>
				
			</span>
			<p class="loginInfo">아이디는 학번을 사용하시고,<br>
			비밀번호는 포털의 비밀번호를 사용하시길 바랍니다.</p>

			</div>
			</div>
			
		</form>
	</div>
		

</body>
</html>
