<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="vo.StudentBean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>MVC 게시판</title>
</head>

<body>
	<table>
	<tr>
		<td colspan=1><h1>강의 목록</h1></td>
	</tr>
<tr>
<!-- <div class="card-header">학생 전체 검색</div> -->
<div class="card-body">
    <form method="get" action="/Student/searchWordAction.me">
    <tr><td class="card-header">학생 검색</td></tr>
    <tr>
    <td>
        <div class="input-group">
            <select name="option">
                <option value="01" selected="selected">학 번</option>
                <option value="02">학생 이름</option>
                <option value="03">학 과</option>
            </select>
            <input class="form-control" type="text" id="searchWord" name="searchWord" placeholder="검색어를 입력하세요" aria-label="Enter search term..." aria-describedby="button-search" />
            <button class="btn btn-primary" id="button-search" type="submit">검색</button>
        </div>
        </td>
        </tr>
    </form>
</div>
</div>	
</tr>
	<c:choose>
		<c:when test="${studentSearchList ne null }">
			<c:forEach var="StudentSearchList" items="${studentSearchList}">
					<a href="StudentViewAction.me?student_Id=${studnetSearchList.student_Id}">
					${studnetSearchList.student_Id} ${student.student_Name} ${student.student_Dep} 
					${student.student_Reg} ${student.student_Gender} ${student.student_Mail}
					${student.student_Statu} ${student.student_Address} ${student.student_Phone}
					</a>
		
				</c:forEach>
		</c:when>
		<c:otherwise>
			<tr><td colspan="2">강의 목록이 없습니다.</td></tr>
		</c:otherwise>
	</c:choose>
		<tr>
		<td><a href="./StudentListAction.me">목록으로 돌아가기</a></td>
	</tr>
</table>
</body>
</html>