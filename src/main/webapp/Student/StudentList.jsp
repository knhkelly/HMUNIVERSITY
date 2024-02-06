<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<%@ page import="vo.PagingBean" %>
<%@ page import="vo.StudentBean" %>
<%@ page import="vo.PageInfo"%>

<%
 	ArrayList<StudentBean> studentList=(ArrayList<StudentBean>)request.getAttribute("studentList");
     PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
 	int listCount=pageInfo.getListCount();
 	int nowPage=pageInfo.getPage();
 	int maxPage=pageInfo.getMaxPage();
 	int startPage=pageInfo.getStartPage();
 	int endPage=pageInfo.getEndPage();
%>




<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css"> -->
<meta charset="UTF-8" />
<title>학생 목록</title>
<style>
	.pageHover:hover{cursor: pointer;}
	table {
      width: 50%;
      margin: 0 auto;
      padding: 10px; 
      text-align: center;
      border: none;
      height: 10px;
   }
   
   h1 {
           font-size: 2.5rem;
           color: black;
           text-align: center;
        }
   
   .card-body { padding: 0px; }
   .card-header{ background-color: white; border: none; }
   
   button {
/*       display: inline; */
      text-align: center;
      box-shadow: none;
   }
   
   .btn-primary {
/*       background-color:#a0a2a4; */
/*       border-color: #a0a2a4; */
      border: 1px solid gray;
   }
   
   td { 
      border-bottom: 1px solid #ccc; 
      padding: 10px;
   }
   a { text-decoration: none; }
   
   
   .menu {
      border:none;
      border-bottom: 3px double #000;
      padding: 6px;
   }
   .input-group{
/*        width: 40%; */
/*        margin: 0 auto; */
		width: 43%;
	    margin: auto;
	    margin-bottom: 30px;
	    display: flex;
		padding: 10px;
   }
   
   .form-control{
         border: 0.5px solid gray; 
         padding-left: 15px;
        /* border-radius: 10px;*/
        width: 100%;
        height: 35px;
    }

    .form-control:focus{
        border: 1.5px solid black;
    }
    
    .select{
       height: 30px;
       padding-left: 25px;
    }
    
    #button-search{
        width: 100px;
        height: 39px;
        border-top-right-radius: 7px;
        border-bottom-right-radius: 7px;
        border-left: none;
        background-color: lightgray;
        box-shadow: none;
        cursor: pointer;
    }
    
    #button-search:hover{
        cursor: pointer;   
        background-color: gray;
        color: white;
    }
    
    section#pageList {
    text-align: center; /* 텍스트 가운데 정렬 */
    margin-top: 20px; /* 위쪽 여백 조절 */
    margin-bottom: 20px; /* 아래쪽 여백 조절 */
    position: absolute; /* 절대 위치로 설정 */
    bottom: 0; /* 하단에 배치 */
    left: 50%; /* 가운데 정렬을 위해 왼쪽으로 이동 */
    transform: translateX(-50%); /* 가운데 정렬 */
    background-color: white; /* 배경색 지정 */
    padding: 10px; /* 내부 여백 조절 */
    
  }
  
  #countList{
     width: 90%;
     margin-left: 37px;
/* 	padding-left: 150px; */
    }
</style>
</head>
<body>
	
	 <div id="countList">
	<table>
		<tr>
			<td class="card-header" colspan=2><h1>학생목록</h1></td>
		</tr>
	</table>
			<div class="card-body">
				<form method="get" action="./studentSearchAction.me">
							<div class="input-group">
								<select name="type">
									<option value="01" selected="selected">학 번</option>
									<option value="02">학생 이름</option>
									<option value="03">학 과</option>
								</select>
								<input class="form-control" type="text" id="searchWord"
									name="searchWord" placeholder="검색어를 입력하세요"
									aria-label="Enter search term..."
									aria-describedby="button-search"  required/>
								<button class="btn btn-primary" id="button-search" type="submit">검색</button>
							</div>
				</form>
			</div>
	<table id="list">
		<tr class="menu">
			<td class="menu">학번</td>
			<td class="menu">이름</td>
			<td class="menu">학과</td>
			<td class="menu">재학여부</td>
		</tr>
		<c:choose>
		
			<c:when test="${studentSearchList ne null }">
				<c:forEach var="search" items="${studentSearchList}">
					<tr class="menu_list">
<%-- 						<td><a href="./studentViewAction.me?student_Id=${search.student_Id}">${search.student_Id}</a></td> --%>
						<td><a href="./layout.jsp?code=273&student_Id=${search.student_Id}">${search.student_Id}</a></td>
<%-- 						<td><a href="./studentViewAction.me?student_Id=${search.student_Id}"> ${search.student_Name}</a></td> --%>
						<td><a href="./layout.jsp?code=273&student_Id=${search.student_Id}"> ${search.student_Name}</a></td>
						<td>${search.student_Dep}</td>
						<td>${search.student_Statu}</td>
					</tr>

				</c:forEach>
				<%session.removeAttribute("studentSearchList"); %>
			</c:when>
		
			<c:when test="${studentList ne null }">
				<c:forEach var="student" items="${studentList}">
					<tr class="menu_list">
						<td>
<%-- 							<a href="./studentViewAction.me?student_Id=${search.student_Id}">${student.student_Id}</a> --%>
							<a href="./layout.jsp?code=273&student_Id=${student.student_Id}">${student.student_Id}</a>
						</td>
						<td>
<%-- 							<a href="./studentViewAction.me?student_Id=${student.student_Id}">${student.student_Name}</a>                  --%>
							<a href="./layout.jsp?code=273&student_Id=${student.student_Id}">${student.student_Name}</a>                 
						</td>
						<td>${student.student_Dep}</td>
						<td>${student.student_Statu}</td>
					</tr>
				</c:forEach>
				 <section id="pageList">
  <%
    if (nowPage <= 1) {
  %>
<!--       <button class="btn btn-primary" disabled>이전</button>&nbsp; -->
      <a>이전</a>&nbsp;
  <%
    } else {
  %>
<%--       <button class="btn btn-primary" onclick="loadStudentPageList(<%=nowPage-1 %>)">이전</button>&nbsp; --%>
      <a class="pageHover" class="pageHover" onclick="loadStudentPageList(<%=nowPage-1 %>)">이전</a>&nbsp;
  <%
    }
  %>

  <%
    for (int a = startPage; a <= endPage; a++) {
      if (a == nowPage) {
  %>
<%--         <button class="btn btn-primary" disabled><%=a %></button> --%>
        <a class="pageHover" style="font-weight: bold;"><%=a %></a>&nbsp;
  <%
      } else {
  %>
<%--         <button class="btn btn-primary" onclick="loadStudentPageList(<%=a %>)"><%=a %></button>&nbsp; --%>
        <a class="pageHover" onclick="loadStudentPageList(<%=a %>)"><%=a %></a>&nbsp;
  <%
      }
    }
  %>

  <%
    if (nowPage >= maxPage) {
  %>
<!--       <button class="btn btn-primary" disabled>다음</button> -->
      <a>다음</a>
  <%
    } else {
  %>
<%--       <button class="btn btn-primary" onclick="loadStudentPageList(<%=nowPage+1 %>)">다음</button> --%>
      <a class="pageHover" onclick="loadStudentPageList(<%=nowPage+1 %>)">다음</a>
  <%
    }
  %>
</section>
			</c:when>
			
			<c:otherwise>
				<tr>
					<td colspan="2">회원 목록이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		
	
	</table>
</div>
</body>
</html>