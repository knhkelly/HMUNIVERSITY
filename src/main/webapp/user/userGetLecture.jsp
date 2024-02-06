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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

#demo.container-fluid{
	width : 95%;
}

body {
   margin: 0;
}

table {
   width: 100%;
   margin: 0 auto;
   padding: 10px;
   text-align: center;
   border: none;
   margin-bottom : 50px;
}

.card-body {
   padding: 0px;
}

.card-header{
   background-color: white;
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

.btn-primary {
   background-color:#a0a2a4;
   border-color: #a0a2a4   ;
}


td {
   border-bottom: 1px solid #ccc;
}


a {
   text-decoration: none;
}

.card-header {
   border: none;
}
.menu {
   border:none;
   border-bottom: 3px double #000;
   padding: 6px;
}

.nob{
	border : none;
}

.mb{
	margin-bottom : 8px;
}

.top {
	margin: 0 auto;
	vertical-align: middle;
	width: 100%;
	color: black;
	background-color: white;
}

/* .form-control{
	height : 48px;
}
*/

#button-search{
	margin : 0;
	border-radius : 0 3px 3px 0;
	background-color : gray;
} 

h1{
	margin-bottom : 40px;
}

.navbar{
	margin-bottom : 60px;
}

@media screen and (max-width : 1024px){
	td{
		padding : 10px;
	}
}

@media screen and (max-width : 768px){
	.delcol1{
		display : none;
	}
	h1{
		font-size : 1.5rem;
	}
	
	th, td{
		font-size : 0.9rem!important;
	}
}

@media screen and (max-width : 480px){
	.delcol2{
		display : none;
	}
	
	#insert{
		padding : 7px;
	}
	
	th, td{
		font-size : 0.8rem!important;
	}
}

</style>
</head>
<body>
	<!-- 수강신청페이지입니다. -->
	<!-- 여기에는 그냥 강의 목록 띄우고 상태에 버튼 생성 -->
	<!-- 버튼 누를시 인서트 -->

<div id = "outbox">
<table class = "top">
	<tr>
		<td colspan=1 class = "nob"><h1>강의 목록</h1></td>
	</tr>


    <tr class = "mb">
    <td class = "nob">
    <form method="get" action="searchWordAction.user">
        <div class="input-group">
            <select name="option">
                <option value="01" selected="selected">강의명</option>
                <option value="02">강의코드</option>
                <option value="03">담당교수명</option>
            </select>
            <input class="form-control" type="text" id="searchWord" name="searchWord" placeholder="검색어를 입력하세요" aria-label="Enter search term..." aria-describedby="button-search" />
            <button class="btn btn-primary" id="button-search" type="submit">조회</button>
        </div>
        </form>
        </td>
	</tr>
</table>
<br><br>

<section id ="lectureListArea">
	<table>
	<tr>
	<th>강의명</th>
	<th>교수명</th>
	<th class="delcol1">학년</th>
	<th class="delcol2">전공</th>
	<th>분류</th>
	<th>학점</th>
	<th class="delcol1">수강인원</th>
	<th class="delcol1">수업시간</th>
	<th>신청</th>
	</tr>
		<c:choose>
			<c:when test = "${lectureSearchList ne null }">
				<c:forEach var = "lecture" items="${lectureSearchList }">
					<tr>
						<!-- <a href = "/user/userLectureInsert.user?no=${lecture.lecture_no }&lnm=${lecture.lecture_name }"> -->
						<td>${lecture.lecture_name }</td>
						<td>${lecture.lecture_pro }</td>
						<td class="delcol1">${lecture.lecture_grade }</td>
						<td class="delcol2">${lecture.lecture_dep }</td>
						<td>${lecture.lecture_category }</td>
						<td>${lecture.lecture_score }</td>
						<td class="delcol1">${lecture.lecture_nop }</td>
						<td class="delcol1">${lecture.lecture_time }</td>
						<td><button id = "insert" onclick="insec(${lecture.lecture_no }, ${lecture.lecture_name })">수강하기</button></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:when test="${lectureList ne null }">
				<c:forEach var ="lecture" items="${lectureList}">
					<tr>
						<td>${lecture.lecture_name }</td>
						<td>${lecture.lecture_pro }</td>
						<td class="delcol1">${lecture.lecture_grade }</td>
						<td class="delcol2">${lecture.lecture_dep }</td>
						<td>${lecture.lecture_category }</td>
						<td>${lecture.lecture_score }</td>
						<td class="delcol1">${lecture.lecture_nop }</td>
						<td class="delcol1">${lecture.lecture_time }</td>
						<td><button id = "insert" onclick="insec(${lecture.lecture_no },'${lecture.lecture_name }')">수강하기</button></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
			<tr><td colspan="12">강의가 없습니다.</td></tr>
		</c:otherwise>
		</c:choose>
	</table>
</section>
</div>

</body>
</html>