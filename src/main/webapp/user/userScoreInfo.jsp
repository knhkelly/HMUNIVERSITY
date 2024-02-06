<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#lectureListArea{
	border : none;
}

#demo.container-fluid{
	width : 80%;
}

table {
   width: 100%;
   margin: 0 auto;
   padding: 10px;
   text-align: center;
   border: none;
}

th, td {
	border-bottom : 1px solid gray;
	border-collapse: collapse;
	padding: 10px;
}

th{
	border-bottom : 1px solid black;
}

td{
	padding : 15px;
}

h1{
	margin-bottom : 40px;
}

.navbar{
	margin-bottom : 60px;
}

button {
   display: inline;
   text-align: center;
   color : white;
   padding : 10px;
   background-color : gray;
   border : 1px solid white;
   border-radius : 5px;
   margin : 5px auto;
}

@media screen and (max-width : 768px){
	h1{
		font-size : 1.5rem;
	}
	
	th, td{
		font-size : 1.0rem!important;
	}
}

@media screen and (max-width : 480px){
	th, td{
		font-size : 0.8rem!important;
	}
}

</style>
</head>
<body>
	<!-- 성적 확인 페이지입니다. -->
	<!-- TABLE : SCORE -->
	<!-- 필요한 컬럼 : LECTURE_NO, LECTURE_NAME, score_subtotal, score_grade, score_completion -->
	
	<h1>내 성적 확인</h1>
	
	<table>
		<tr>
			<th class="delcol1">강의번호</th>
			<th>강의명</th>
			<th>과목총점</th>
			<th>등급</th>
			<th>재수강여부</th>
		</tr>
		<c:choose>
			<c:when test="${score ne null }">
				<c:forEach var="score" items ="${score }">
					<tr>
						<td class="delcol1">${score.lecture_no }</td>
						<td>${score.lecture_name }</td>
						<td>${score.score_subTotal }</td>
						<td>${score.score_grade }</td>
						<td>${score.score_completion }</td>
					</tr>
				</c:forEach>
			</c:when>	
		</c:choose>
	</table>
	

</body>
</html>