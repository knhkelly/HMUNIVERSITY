<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dao.ScheduleDAO,vo.ScheduleBean,java.util.ArrayList"%>
<%@ page import="dao.BoardDAO,vo.BoardBean"%>

<%
ScheduleDAO dao = new ScheduleDAO();
ArrayList<ScheduleBean> schedule = dao.selectScheduleList();
request.setAttribute("schedule", schedule);

BoardDAO bodao = new BoardDAO();
ArrayList<BoardBean> article = bodao.selectArticleList(1, 10);
request.setAttribute("article", article);
%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>하이미디어 대학교에 오신걸 환영합니다.</title>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
   font-family: Arial;
}

/* Header/Blog Title */
img.logo {
/*    padding: 0; */
    display: inline; 
   width: 100px;
   height: 100px;
   vertical-align: middle;
   text-align: center;
}

.head {
   border-bottom: 1px solid #b3a7a7;
   height: 130px;
   align-items: center;
   background-color: white;
   display: flex;
   text-align: center;
}

.logotext {
   margin-left: 10px;
   line-height: 16px;
   flex-grow: 1;
   vertical-align: middle;
   
}
.headinner{
display:inline-block;
vertical-align: middle;
}

.kor {
   font-size: 19pt;
}

.eng {
   font-size: small;
   letter-spacing: 1px;
   font-weight: 400;
}
/* Footer */
img.fotlogo {
   float: left;
   padding: 0;
   width: 200px;
}

.footer {
   padding: 15px 20px;
   height: 120px;
   background-color: #979797;
   text-align: left;
}

.kor2 {
   font-size: 15pt;
   color: white;
}

b.noti1 {
   font-size: 10pt;
   color: white;
}

 .rightcolumn { 
   float: left; 
    width: 100%; 
 }

/* Fake image */
.fakeimg {
   /*    background-color: #f1f1f1; */
   width: 100%;
   /*    padding: 14px; */
}

/* Add a card effect for articles */
.card {
   background-color: white;
   padding: 20px 40px;
   margin-top: 20px;
   text-align: center;
}

.card_2 {
   margin-top: 20px;
}


.row {
   margin: 0px;
}

/* Make the image fully responsive */
.carousel-inner img {
   width: 100%;
   height: 100%;
}

button#loginBtn {
      display: block;
      width: 30%;
      background-color: #979797;
      color: white;
      padding: 15px;
      border: none;
      border-radius: 8px;
      font-weight: bold;
      margin: 0 0 0 5px;
      height: 105px;
   }
.delImg{
       width: 20px;
       cursor: pointer;
   }
/* 반응형 레이아웃 - 화면의 너비가 800px 이하일 때 두 열을 옆이 아닌 위에 쌓아 올립니다 */

form{display: flex; margin: 0 0 10px 5px;}


@media screen and (max-width: 1200px) {
   form{display: block;}
   button#loginBtn {
      display: block;
      width: 100%;
      background-color: #979797;
      color: white;
      padding: 15px;
      border: none;
      border-radius: 8px;
      margin: 10px auto;
      font-weight: bold;
   }
}


@media screen and (max-width: 550px) {
   .carousel-caption{ display : none; }
}


a {
   text-decoration: none;
   color: white;
}

h2 {
   margin-bottom: 15px;
}

p {
   margin-bottom: 24px;
}

#notice {
   margin-bottom: 20px;
}

span.admin1 {
   color: black;
   font-weight: bold;
   text-align : center;
   font-size: 14pt;
}

.leftcolumn col-xl-9 col-lg-12 {
    padding: 0px;
}

.container-fluid{
   padding:0px;
}

.boxDiv{
   margin-top: 20px;
   padding:0 20px;
   text-align: center;
   border-bottom: 1px solid #979797;
}

div.headin{margin: 0 auto;}

#box4 {margin: 0 auto;}

div[class^=col-] {padding:0px!important;}
.news{
width: 200px;
height : 200px;
}

   .loginput{
      width: 100%;
      height: 50px;
      border-radius: 8px;
      margin-bottom: 5px;
      outline: none;
/*       border: 1px solid black; */
      border: none;
      box-sizing: border;
      padding-left: 10px;
      background-color: #eee;
   }


.afterLoginBox{
/*    display: block; */
}
.afterLoginBox > button#loginBtn{ 
    width: 100%;
    margin: 10px auto;
    height: 70px;
 }
 
 div.schedule {
width: 80%;
margin: 10px auto;
padding: 10px;
}
.sh{
width: 50%;
text-align: center;
margin: 20px auto;
margin-bottom: 0;
}
.schedule_content:not(button){
font-size: 15pt;
line-height: 39px;
}

 button.dbdb{
height: 30px;
} 

.asc{
line-height: 70px;
font-size: 14px;
}
.boSub{
margin-left: 10px; 
text-align: left;
}
</style>
<script>
   function delec(scdnum) {
      var result = confirm("일정을 삭제하시겠습니까?");
      if (result) {
         location.href = "schedulDelete.scd?schedule_num=" + scdnum;
      }
   }
</script>
</head>
<body>

   <%
   String aid = (String) session.getAttribute("adminId");
   %>
   <%
   Integer uid = (Integer) session.getAttribute("student_login");
   %>
   <div class="head">
         <div class="headin">
            <img class="logo" src="./img/mainpagelogo.png">
            <div class="headinner"><span class="logotext"><b class="kor">하이미디어대학교</b><br> &nbsp;<b class="eng">HimediaUniversity</b>
            </span></div>
         </div>
   </div>

   <div class="container-fluid">

      <div class="row">

         <div class="col-xl-9 col-lg-12 leftcolumn">
<!--             <div class="col_2"> -->
               <div class="fakeimg">
                  <div id="demo" class="carousel slide" data-ride="carousel">
                     <!-- Indicators -->
                     <ul class="carousel-indicators">
                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                        <li data-target="#demo" data-slide-to="1"></li>
                        <li data-target="#demo" data-slide-to="2"></li>
                     </ul>

                     <!-- The slideshow -->
                     <div class="carousel-inner">
                        <div class="carousel-item active">
                           <img src="./img/1.jpg" alt="university1" width="1100" height="150">
                           <div class="carousel-caption">
                              <h3>교육의 미래를 열어가는 글로벌 인재양성 대학</h3>
                              <p>하이미디어대학교에 오신걸 환영합니다.</p>
                           </div>
                        </div>
                        <div class="carousel-item">
                           <img src="./img/2.jpg" alt="university2" width="1100" height="150">
                           <div class="carousel-caption">
                              <h3>2023 세계대학 영향력평가 세계 1위</h3>
                              <p>공존과 헌신의 가치를 중심으로 지속가능발전을 선도하는 글로벌대학</p>
                           </div>
                        </div>
                        <div class="carousel-item">
                           <img src="./img/3.jpg" alt="university lake" width="1100" height="150">
                           <div class="carousel-caption">
                              <h3>새로운 미래를 향한 미래대학으로서의 도전을 힘껏 응원해 주시기 바랍니다.</h3>
                              <p>모든 하이미디어 구성원의 헌신과 진실된 노력으로 이룩한 눈부신 성취</p>
                           </div>
                        </div>
                     </div>

                     <a class="carousel-control-prev" href="#demo" data-slide="prev"> <span class="carousel-control-prev-icon"></span>
                     </a> <a class="carousel-control-next" href="#demo" data-slide="next"> <span class="carousel-control-next-icon"></span>
                     </a>
                  </div>
               </div>
         </div>

         <div class="rightcolumn col-xl-3 col-lg-12" id="rightcolumn">
            <div class="row">
               <div class="col-sm-12 col-md-4 col-lg-4  col-xl-12 boxDiv">
                  <div>
                     <%
                     if (aid != null) {
                     %>
                     <div class="afterLoginBox">
                        <span class="admin1">관리자 모드</span><br>
                        <button type="button" id="loginBtn" class="afterLogin" onclick="location.href='./layout.jsp'">관리자 페이지로</button>
                        <button type="button" id="loginBtn" class="afterLogin" onclick="location.href='./user/userLayout.jsp'">학생페이지</button>
                        <button type="button" id="loginBtn" class="afterLogin" onclick="location.href='logout'">로그아웃</button>
                     </div>
                     <%
                     } else if (uid != null) {
                     %>
                     <div class="afterLoginBox">
<!--                         <span> 어서오세요 </span><br> -->
                        <button type="button" id="loginBtn" class="afterLogin" onclick="location.href='./user/userLayout.user'">학생페이지</button>
                        <button type="button" id="loginBtn" class="afterLogin" onclick="location.href='logout'">로그아웃</button>
                     </div>
                     <%
                     } else if (uid == null && aid == null) {
                     %>
                     <div class="beforeLogin">
                     <form action="./loginAction.me" method="post">
                        <div id="loginBox">
                        <input type="text" id="id" name="Student_Id" class="loginput" placeholder="아이디" />
                        <input type="password" id="pwd" name="Student_Pw" class="loginput" placeholder="비밀번호" />
                        </div>
                        <button type="submit" id="loginBtn">
                           <span class="stsp">로그인</span>
                        </button>
                     </form>
                     </div>
                     <%};%>
                  </div>

               </div>

               <div class="col-sm-12 col-md-4 col-lg-4 col-xl-12 boxDiv" id="box3">
                  <a href="mainBoard.jsp" style="text-decoration: none;"><h3 style="color:black;">공지사항</h3></a>
<!--                   <div class="fakeimg" id="notice1"> -->
<!--                      <p>공지타이틀만불러오면끝인가</p> -->
<!--                   </div> -->
<!--                   <div class="fakeimg" id="notice2"> -->
<!--                      <p>a태그넣어서 공지사항페이지이동</p> -->
<!--                   </div> -->
<!--                   <div class="fakeimg" id="notice3"> -->
<!--                      <p>a태그넣어서 공지사항페이지이동</p> -->
<!--                   </div> -->
                  <c:choose>
                     <c:when test="${article ne null }">
                        <c:forEach var="article" items="${article}" end = "5">
                              <p class="boSub" style="font-size: 14px;">${article.BOARD_SUBJECT}</p>
                        </c:forEach>
                     </c:when>
                  </c:choose>
               </div>
               <div class="col-sm-12 col-md-4 col-lg-4 col-xl-12 boxDiv" id="box4">
         <h3 class="sh">학사일정</h3>
   <div class="schedule">
               <%
               if (aid != null) {
               %>
               <div>
                  <form class="ascc" action="scheduleWrite.scd">
                     <input type="text" name="content"> <input type="submit"
                        value="등록">
                  </form>
                  <c:choose>
                     <c:when test="${schedule ne null }">
                        <c:forEach var="schedule" items="${schedule}">
                           <tr class="menu_list">
                              <td class="asc">${schedule.schedule_content}</td>
                              <td> &nbsp;<img src="./img/deleteButton.png" class="delImg"
                                    onclick="delec('${schedule.schedule_num}')" id="delete_btn"/></td>
                           </tr><br>
                        </c:forEach>
                     </c:when>
                  </c:choose>
               </div>
               <%
               } else {
               %>
               <div class="schedule_content">
                  <c:choose>
                     <c:when test="${schedule ne null }">
                        <ul><c:forEach var="schedule" items="${schedule}">
                           <tr class="menu_list">
                              <li><td>${schedule.schedule_content}</td></li>
                           </tr>
                        </c:forEach></ul>
                     </c:when>
                  </c:choose>
               </div>
               <%
               }
               %>
            </div>
            </div>
         
         </div>
      </div>
   </div>


   <div class="footer">
<!--       <img class="fotlogo" src="./img/mainheaderlogo.png"> <span class="logotext"> -->
      <b class="kor2">하이미디어대학교</b><br>
      <b class="noti1">COPYRIGHT (C) 2023 BY HIMEDIA UNIVERSITY.ALL RIGHTS RESERVED</b><br> 
      <b class="noti1">프로젝트명 ㅣ 김나혜 이동주 하현준 김태현 김광민 이동현 금다빈 이문희 서유찬 김세현</b><br> 
   </div>

</body>
</html>
