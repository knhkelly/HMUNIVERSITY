<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css">
<style>
form {
	width: 600px;
	margin: 20px auto;
	/* 	padding: 10px; */
	text-align: center;
	border: 2px solid #a0a2a4;
	border-radius: 5px;
}

#memberInfoArea {
	margin: 20px auto;
	border-radius: 3px;
}
/* 	#memberInfoArea{ */
/* 		width : 800px; */
/* 		margin : auto; */
/* 		border : 1px solid gray; */
/* 	} */
table {
	width: 400px;
	margin: auto;
	text-align: center;
	border: none;
}

label {
	margin-right: 5px;
	font-size: 15pt;
}

.bg {
	background: #a0a2a4;
}

button {
	display: inline;
	text-align: center;
	border-radius: 3px;
	border: 1px solid #a0a2a4;
}

td {
	font-size: 15pt;
	margin: 10px 0;
}

a#listback {
	
	text-decoration: none;
	font-weight: bold;
	background-color: #35373a;
	color: white;
	display: inline-block;
	width: 80px;
	margin-left: 30px;
	border-radius: 3px;
}

#deletelist {
	color: white;
	font-weight: bold;
	margin-left: 30px;
}

input, td {
	margin: 8px 0;
}

input {
	border-radius: 3px;
	border: 1px solid #a0a2a4;
}

input[type=radio]:checked+label {
	color: blue;
	font-weight: bold;
}

input[type=radio] {
	font-size: 15pt;
	width: 20px;
	height: 20px;
}

input[type=submit] {
	background-color: #35373a;
	color: white;
	font-weight: bold;
	border: none;
	margin-right: 30px;
	width: 80px;
}

button[type=button] {
	background-color: #35373a;
	border: none;
	width: 80px;
	color: white;
	font-weight: bold;
	
}

h1#title {
	margin-bottom: 30px;
}
</style>
<script>
	function delstd(stdno) {
		var result = confirm("학생 정보를 삭제하시겠습니까?");
		if (result) {
			location.href = "studentDeleteAction.me?id=" + stdno;
		}
	}
</script>
</head>
<body>

	<form action="studentUpdateAction.me" method="post" name="frm">
		<section id="memberInfoArea">
			<table>

				<h1 id="title">학생 상세정보</h1>

				<c:choose>
					<c:when test="${student ne null}">
						<tr>
							<td>학번 :</td>
							<td><input type="text" name="student_Id" class="bg" value="${student.student_Id}" readonly="readonly" placeholder="학번"></td>
						</tr>
						<tr>
							<td>비밀번호 :</td>
							<td><input type="text" name="student_Pw" value="${student.student_Pw}" placeholder="비밀번호"></td>
						</tr>
						<tr>
							<td>이름 :</td>
							<td><input type="text" name="student_Name" class="bg" value="${student.student_Name}" readonly placeholder="이름"></td>
						</tr>
						<tr>
							<td>학과명 :</td>
							<td><input type="text" name="student_Dep" value="${student.student_Dep}" placeholder="학과명"></td>
						</tr>
						<tr>
							<td>주민번호 :</td>
							<td><input type="text" name="student_Reg" class="bg" value="${student.student_Reg}" readonly placeholder="주민번호(-)없이 입력해주세요"></td>
						</tr>
						<tr>
							<td>성별 :</td>
							<td><input type="radio" id="gender1" name="student_Gender" value="남자" <c:if test="${student.student_Gender == '남자'}">checked</c:if> required> <label for="gender1">남자</label> <input type="radio" id="gender2" name="student_Gender" value="여자" <c:if test="${student.student_Gender == '여자'}">checked</c:if>> <label for="gender2">여자</label></td>
						</tr>
						<tr>
							<td>이메일 :</td>
							<td><input type="text" value="${student.student_Mail}" name="student_Mail"></td>
						</tr>
						<tr>
							<td>학적상태 :</td>
							<td><input type="radio" id="statu1" name="student_Statu" value="재학" <c:if test="${student.student_Statu == '재학'}">checked</c:if> required> <label for="statu1">재학</label> <input type="radio" id="statu2" name="student_Statu" value="휴학" <c:if test="${student.student_Statu == '휴학'}">checked</c:if>> <label for="statu2">휴학</label> <input type="radio" id="statu3" name="student_Statu" value="자퇴" <c:if test="${student.student_Statu == '자퇴'}">checked</c:if>> <label for="statu3">자퇴</label></td>
						</tr>
						<tr>
							<td>전화번호 :</td>
							<td><input type="text" name="student_Phone" value="${student.student_Phone}" placeholder="전화번호(-)없이 입력해주세요"></td>
						</tr>
						<tr>
							<td>주소 :</td>
							<td><input type="text" name="student_Address" value="${student.student_Address}" placeholder="주소"></td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="2">학생 조회 안됨</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>

			<input type="submit" value="수정">
			<button type="button" onclick="delstd('${student.student_Id}')">삭제</button>
<!-- 			<a id="listback" href="./layout.jsp?code=272">목록으로 돌아가기</a> -->
<!-- 			<input type = "button" id="listback" value = "목록으로 돌아가기" onClick ="./layout.jsp?code=272"> -->
			<a id="listback" role="button" href="./layout.jsp?code=272">목록</a>
		</section>
		
	</form>
</body>
</html>