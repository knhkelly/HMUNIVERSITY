<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<%@ page import="vo.StudentBean"%>



<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css">
<meta charset="UTF-8" />
<title>학생 목록</title>
<style>
	body { margin: 0; }
	
	table {
	   width: 50%;
	   margin: 0 auto;
	   padding: 10px;
	   text-align: center;
	   border: none;
	}
	
	.card-body { padding: 0px; }
	.card-header { background-color: white; }
	
	button {
	   display: inline;
	   text-align: center;
	}
	
	.btn-primary {
	   background-color: #a0a2a4;
	   border-color: #a0a2a4;
	}
	
	td { border-bottom: 1px solid #ccc; }
	a { text-decoration: none; }
	.card-header { border: none; }
	
	.menu {
	   border: none;
	   border-bottom: 3px double #000;
	   padding: 6px;
	}
</style>
</head>
<body>
   <br>
   <br>
   <table>
      <tr>
         <td class="card-header" colspan=2><h1>강의목록</h1></td>
      </tr>
      <tr>
         <div class="card-body">

            <form method="get" action="searchWordAction.lms">
               <tr>
                  <td>
                     <div class="input-group">
                        <select name="option">
                           <option value="01" selected="selected">강의명</option>
                           <option value="02">강의코드</option>
                           <option value="03">담당교수명</option>
                        </select> 
                        <input class="form-control" type="text" id="searchWord"
                           name="searchWord" placeholder="검색어를 입력하세요"
                           aria-label="Enter search term..."
                           aria-describedby="button-search" />
                        <button class="btn btn-primary" id="button-search" type="submit">검색</button>
                     </div>
                  </td>
               </tr>
            </form>
         </div>
      </tr>
   </table>
   <table id="list">
      <tr class="menu">
         <td class="menu">강의코드</td>
         <td class="menu">강의명</td>
         <td class="menu">담당교수</td>
         <td class="menu">학점</td>
         <td class="menu">이수구분</td>
      </tr>
      <c:choose>
         <c:when test="${lectureSearchList ne null }">
            <c:forEach var="lectureSearchList" items="${lectureSearchList}">
               <tr class="menu_list">
                  <td><a href="lecture_view.lms?lecture_no=${lectureSearchList.lecture_no}">${lectureSearchList.lecture_no}</a></td>
                  <td><a href="lecture_view.lms?lecture_no=${lectureSearchList.lecture_no}">
                        ${lectureSearchList.lecture_name} </a></td>
                  <td>${lectureSearchList.lecture_pro}</td>
                  <td>${lectureSearchList.lecture_score}</td>
                  <td>${lectureSearchList.lecture_category}</td>
               </tr>
            </c:forEach>
         </c:when>
      <c:otherwise>
            <tr>
               <td colspan="2">강의 목록이 없습니다.</td>
            </tr>
         </c:otherwise>
      </c:choose>

   </table>

</body>
</html>