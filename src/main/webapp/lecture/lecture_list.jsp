<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>
<%@ page import="vo.LectureBean"%>
<%@ page import="vo.PageInfo"%>
<%
    ArrayList<LectureBean> articleList=(ArrayList<LectureBean>)request.getAttribute("lectureList");
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
<meta charset="UTF-8" />
<title>강의 일람</title>
<style>
	.pageHover:hover{cursor: pointer;}
   table {
         width: 50%;
         margin: 0 auto;
         padding: 10px;
         text-align: center;
         border: none;
   }
   h1 {
           font-size: 2.5rem;
           color: black;
           text-align: center;
        }
        
   .card-body { padding: 0px; }

   .card-header { 
   	background-color: white;
   	border: none;
    }
   
   button {
/*       display: inline; */
      text-align: center;
      box-shadow: none;
   }
   
   .btn-primary {   
      border: 1px solid gray;
   }
   
   td { 
      border-bottom: 1px solid #ccc; 
      padding: 7px;
   }

   a { text-decoration: none; }

   
   .menu {
      border: none;
      border-bottom: 3px double #000;
      padding: 6px;
   }

   .input-group{
/*       border: 1px solid black; */
/*       border-radius: 50px; */
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

    #delete_btn{
        width: 60px;
        padding: 9px 9px;
        border: none;
        background-color: lightgray;
    }
    
    #delete_btn:hover{
       cursor: pointer;   
       background-color: gray;
       color: white;
    }
    
    #select-lecture{ /*select*/
       height: 39px;
        margin-right: -1px;
        border-top-left-radius: 7px;
        border-bottom-left-radius: 7px;
        padding-left: 20px;
    }
    
    #countList{
     width: 90%;
     margin-left: 37px;
/* 	padding-left: 150px; */
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
</style>
</head>
<body>

   <div id="countList">
   <table>
      <tr>
         <td class="card-header" colspan=2><h1>강의목록</h1></td>
      </tr>
   </table>
         <div class="card-body">
            <form method="get" action="searchWordAction.lms">
                     <div class="input-group">
                        <select name="option">
                           <option value="01" selected="selected">강의명</option>
                           <option value="02">강의코드</option>
                           <option value="03">담당교수명</option>
                        </select> 
                        <input class="form-control" type="text" id="searchWord"
                           name="searchWord" placeholder="검색어를 입력하세요"
                           aria-label="Enter search term..."
                           aria-describedby="button-search" required/>
                        <button class="btn btn-primary" id="button-search" type="submit">검색</button>
                     </div>
            </form>
         </div>
   <table id="list">
      <tr class="menu">
         <td class="menu">강의코드</td>
         <td class="menu">강의명</td>
         <td class="menu">담당교수</td>
         <td class="menu">학점</td>
         <td class="menu">이수구분</td>
         <td class="menu"></td>
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
                  <td><button class="btn btn-primary" onclick="delec('${lectureSearchList.lecture_no}')" id="delete_btn">삭제</button></td>
               </tr>
            </c:forEach>
            <%session.removeAttribute("lectureSearchList"); %>
         </c:when>
      
         <c:when test="${lectureList ne null }">
            <c:forEach var="lecture" items="${lectureList}">
               <tr class="menu_list">
                  <td><a href="lecture_view.lms?lecture_no=${lecture.lecture_no}">${lecture.lecture_no}</a></td>
                  <td><a href="lecture_view.lms?lecture_no=${lecture.lecture_no}">
                        ${lecture.lecture_name} </a></td>
                  <td>${lecture.lecture_pro}</td>
                  <td>${lecture.lecture_score}</td>
                  <td>${lecture.lecture_category}</td>
                  <td><button class="btn btn-primary" onclick="delec('${lecture.lecture_no}')" id="delete_btn">삭제</button></td>
               </tr>
               
            </c:forEach>
            <section id="pageList">
  <%
    if (nowPage <= 1) {
  %>
      <a>이전</a>&nbsp;
  <%
    } else {
  %>
      <a class="pageHover" onclick="loadPageList(<%=nowPage-1 %>)">이전</a>&nbsp;
  <%
    }
  %>

  <%
    for (int a = startPage; a <= endPage; a++) {
      if (a == nowPage) {
  %>
        <a class="pageHover" style="font-weight: bold;"><%=a %></a>&nbsp;
  <%
      } else {
  %>
        <a class="pageHover" onclick="loadPageList(<%=a %>)"><%=a %></a>&nbsp;
  <%
      }
    }
  %>

  <%
    if (nowPage >= maxPage) {
  %>
      <a>다음</a>
  <%
    } else {
  %>
      <a class="pageHover" onclick="loadPageList(<%=nowPage+1 %>)">다음</a>
  <%
    }
  %>
</section>
         </c:when>
         
         <c:otherwise>
            <tr>
               <td colspan="2">강의 목록이 없습니다.</td>
            </tr>
         </c:otherwise>
      </c:choose>
         
   </table>
   

   </div>

</body>
</html>