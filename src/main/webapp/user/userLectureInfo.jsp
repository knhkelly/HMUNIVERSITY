<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "vo.LectureBean, java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


#lectureListArea{
	border : none;
}

table {
   width: 90%;
   margin: 0 auto 50px auto;
   padding: 10px;
   text-align: center;
   border: none;
}

th, td {
	border-bottom : 1px solid gray;
	border-collapse: collapse;
	padding: 10px;
	font-size : 0.9rem;
}

th{
	border-bottom : 1px solid black;
}

h1{
	margin-bottom : 100px;
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

.delcol2{
	width : 10px;
}

@media screen and (max-width : 1024px){
	.delcol1{
		display : none;
	}
	
	th, td{
		font-size : 0.8rem;
	}
}

@media screen and (max-width : 768px){
	.delcol2{
		display : none;
	}
	
	h1{
		font-size : 1.5rem;
	}
}

@media screen and (max-width : 480px){
	.delcol3{
		display : none;
	}
}

</style>
</head>
<body>
	<!-- 강의명, 학년, 학과, 학점, 이수구분, 교수명, 수강인원, 강의시간으로 강의정보 가져오기 -->
	<!-- delete로 데이터 삭제 -->
	<!-- public ArrayList<LectureBean> selectLectureList() 사용해서 리스트 데이터 받아와서 띄우기 -->
<h1>내 강의 정보</h1>
<section id = "lectureListArea">
	<table>
		<tr>
		<th class="delcol3">강의번호</th>
		<th>강의명</th>
		<th>교수명</th>
		<th class="delcol1">학년</th>
		<th class="delcol2">전공</th>
		<th>분류</th>
		<th>학점</th>
		<th class="delcol1">수강인원</th>
		<th class="delcol2">수업시간</th>
		<th class="delcol1">학기</th>
		<th class="delcol2">강의실</th>
		<th class="delcol1">설명</th>
		<th>신청</th>
		</tr>
		<c:choose>
			<c:when test="${userLec ne null }">
				<c:forEach var="lecture" items ="${userLec }">
					<tr>
						<!-- <a href="./userLectureDelete.user?lecture_no=${lecture.lecture_no}" -->
						<td class="delcol3">${lecture.lecture_no }</td>
						<td>${lecture.lecture_name }</td>
						<td>${lecture.lecture_pro }</td>
						<td class="delcol1">${lecture.lecture_grade }</td>
						<td class="delcol2">${lecture.lecture_dep }</td>
						<td>${lecture.lecture_category }</td>
						<td>${lecture.lecture_score }</td>
						<td class="delcol1">${lecture.lecture_nop }</td>
						<td class="delcol2">${lecture.lecture_time }</td>
						<td class="delcol1">${lecture.lecture_semester }</td>
						<td class="delcol2">${lecture.lecture_cp }</td>
						<td class="delcol1">${lecture.lecture_lp }</td>
						<td><button onclick="delec(${lecture.lecture_no })">수강취소</button></td>
					</tr>
				</c:forEach>
			</c:when>	
		</c:choose>
		
	</table>
</section>


</body>
</html>