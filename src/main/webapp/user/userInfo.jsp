<%@page import="vo.StudentBean, dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>




#pic {
	width: 200px;
	heigth: 200px;
	text-align: center;
	vertical-align: center;
	margin: 0 auto;
	margin-bottom: 80px;
}

div.navbar {
	margin-bottom: 60px;
	padding-top: 0;
	padding-bottom: 0;
}

.box1 {
	width: 45%;
	float: left;
	height: 425px;
	margin-bottom: 0px;
	border: none;
	border-right: 1px solid lightgray;
	border-radius: 0;
	box-shadow: none;
	padding-top : 50px;
}

.box2 {
	float: right;
	margin-bottom: 0px;
	height: 450px;
	padding-right: 0;
	border: none;
}

.box2>p {
	text-align: left;
}

#demo {
	border: 1px solid lightgray;
	padding-left : 50px;
}

.outbox {
	overflow: hidden;
	margin: 0;
}


.buttonStyle {
	border: none;
	padding: 15px;
	background-color: #44a4a6;
	color: white;
	border-radius: 5px;
	margin-top: 90px;
	float : right;
}

.row {
	margin-left: 27px;
}

.container-fluid {
	width: 80%;
	margin: 0 auto;
	padding: 70px;
	border: none;
	height: 600px;
	border-radius: 15px;
}

div.box2.col {
	padding-top: 40px;
	border-radius: 0px;
}

.info, .info1 {
	font-size : 1.0rem;
	white-space : nowrap;
}

.col{
	padding-left : 0;
	padding-right : 0;
}

.buttonTag{
	width : 100%;
}

@media screen and (max-width : 480px){
	div.box2.col{
		padding-top :35px!important;
	}
	div#demo.container-fluid{
		padding : 70px 0;
	}
	
	p.info{
		margin : 0 auto 20px auto;
	}
	
	.row{
		margin-left : 0;
	}
}

@media all and (max-width : 768px){
	div.box1.col, div.box2.col{
		border : none;
		display : block;
		width : 100%;
		padding : 0;
		box-shadow : none;
	} 
	
	div.box1.col{
		height : 260px;
	}
	
	div.box2.col{
		padding-top : 10px;
	}
	
	div#demo.container-fluid{
		height : 800px;
	}
	
	button.buttonStyle{
		margin-top : 40px;
		width : 100%;
	}
	
	.col{
		flex-basis : auto;
		flex-grow : 0;
	}
	
	#pic{
		margin-bottom : 40px;
	}
	
	p.info{
		text-align : left;
	}
}

</style>
</head>
<body>
	<!-- 학생 정보 페이지입니다. -->
	<!-- student 테이블에서 전체 컬럼 가져오기, 비밀번호 제외 -->
	<!-- 학생 정보수정도 들어가기(update페이지로 넘기기) -->

	<!-- 반응형 row, col로 잡아서 처리하기 -->
	<div>
		<div class="outbox row">
			<div class="box1 col">
				<img src="${imgSrc.imgSrc}" id="pic">
				<p class="info">
					이름 : <span>${user.student_Name}</span>
				</p>
				<p class="info nob">
					학번 : <span>${user.student_Id}</span>
				</p>
			</div>

			<div class="box2 col">
				<p class="info">
					학과 : <span class="info1">${user.student_Dep}</span>
				</p>
				<p class="info">
					생년월일 : <span class="info1">${user.student_Reg }</span>
				</p>
				<p class="info">
					성별 : <span class="info1">${user.student_Gender }</span>
				</p>
				<p class="info">
					이메일 : <span class="info1">${user.student_Mail }</span>
				</p>
				<p class="info">
					재학여부 : <span class="info1">${user.student_Statu }</span>
				</p>
				<p class="info">
					주소 : <span class="info1">${user.student_Address }</span>
				</p>
				<p class="info">
					폰번호 : <span class="info1">${user.student_Phone }</span>
				</p>
			</div>
		</div>
	</div>
	<p class="buttonTag">
		<button type="button" class="buttonStyle" onclick="userUpdate()">정보 수정</button>
	</p>


	<%-- <button href = "./userUpdate.user?student_Id=${user.student_Id }">정보 수정</button> --%>
	<%-- 	<a href = "./userGetLecture.user?name=${user.student_Name }&dep=${user.student_Dep}">수강신청</a> --%>
	<%-- 	<a href = "./userLectureInfo.user?student_Id=${user.student_Id }">수강신청내역</a> --%>

</body>
</html>