<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
   src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Document</title>
<style>
@media screen and (max-width : 480px) {
   .delcol2 {
      display: none !important;
   }
   .box1 {
      padding: 25px 0 !important;
   }
   .box2 {
      height: 450px !important;
   }
   .box3 {
      padding: 25px 0 60px !important;
   }
   td {
      padding: 15px 0 !important;
   }
}

@media screen and (max-width : 768px) {
   .delcol1 {
      display: none !important;
   }
   td, th {
      font-size: 0.8rem !important;
      overflow: hidden !important;
      white-space: nowrap;
      text-overflow: ellipsis !important;
   }
}

@media screen and (max-width : 1024px) {
   div.box1, div.box2, div.box3 {
      width: 100%;
      float: clear;
   }
   img#pic {
      width: 125px;
      height: 125px;
   }
   p.info, span.info1, td, th {
      font-size: 1.0rem;
   }
}

body {
   margin: 0;
   padding: 0;
   padding-top: 40px;
   background-color: white;
}

.maintop {
   margin: 0 auto;
   border: 1px solid white;
   width: 90%;
   border-radius: 40% 40% 0 0;
}

.mainlogo {
   width: 150px;
   height: 150px;
   vertical-align: middle;
}

h1 {
   width: 100%;
   text-align: center;
}

span.ltext {
   font-size: 25px;
   margin-left: 25px;
}

a.list {
   color: #fff;
}

.line {
   width: 200px;
   background-color: #a0a2a4;;
}

table, .menu {
   border: 1px solid black;
   border-collapse: collapse;
}

table {
   width: 80%;
   margin: 0 auto;
   text-align: center;
   border: none;
   white-space: nowrap;
}

.menu_list {
   border-bottom: 1px solid black;
}

/* Navbar container */
.navbar {
   background-color: #44a4a6;
   font-family: Arial;
   width: 100%;
   margin: 0 auto;
   margin-bottom: 70px;
   color: white;
   padding-top: 0;
   padding-bottom: 0;
   height: 68px;
   position : static;
   z-index : 999;
}

/* Links inside the navbar */
.navbar a {
   float: left;
   font-size: 16px;
   color: white;
   text-align: center;
   padding: 0px 16px;
   text-decoration: none;
}

/* Dropdown button */
.dropdown .dropbtn {
   font-size: 16px;
   border: none;
   outline: none;
   color: white;
   padding: 22px 16px;
   background-color: inherit;
   font-family: inherit;
   margin: 0;
   border-radius: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
   background-color: lightgray;
   color: black;
}

/* 여기부터는 직접 기술한 것 */
.logotext {
   margin-left: 10px;
   line-height: 16px;
   text-align: left;
}

.kor {
   font-size: 19pt;
}

.eng {
   font-size: small;
   letter-spacing: 1px;
   font-weight: 400;
   padding-right: 65px;
}

.logo {
   color: black;
   text-align: center;
   padding: 10px;
   height: 70px;
   display: flex;
   align-items: center;
   width: 100%;
}

img.logo {
   width: 100px;
   height: 100px;
   vertical-align: middle;
   cursor: pointer;
}

div.logo {
   margin: 0 auto;
   margin-bottom: 30px;
   cursor: pointer;
}

.container {
   width: 100%;
   vertical-align: top;
   padding: 0;
   margin: 0;
}

.box1 {
   width: 30%;
   border: 3px solid lightgray;
   border-radius: 15px;
   padding: 20px 0;
   text-align: center;
   margin: 0 auto;
   margin-bottom: 50px;
   height: 600px;
   float: left;
}

.box2 {
   width: 65%;
   border: 3px solid lightgray;
   border-radius: 15px;
   padding: 25px 30px 55px 30px;
   text-align: left;
   margin-bottom: 50px;
   float: right;
   height: 600px;
   overflow: hidden;
}

.box3 {
   width: 100%;
   border: 3px solid lightgray;
   border-radius: 15px;
   padding: 25px 30px 80px 30px;
   text-align: center;
   overflow: hidden;
   margin-bottom : 100px;
}

/* .outbox {
   margin: 0 auto;
   padding: 0;
}
 */
.boxbutton {
   width: 130px;
   height: 45px;
   background-color: #44a4a6;
   color: white;
   border: none;
   border-radius: 7px;
   display: inline-block;
   font-size: 16px;
   padding: 14px 16px;
   /* float: right; */
}

div>p {
   margin: 0 auto;
   width: 70%;
   margin-bottom: 40px;
   padding-bottom: 10px;
   font-size: 20px;
   text-align: center;
}

.buttonbox {
   text-align: right;
   border: none;
   width: 90%;
   margin: 0 auto;
   margin-bottom: 60px;
}

.navr {
   float: right;
   width: 200px;
   border: none;
   padding: 0;
   text-align: right;
   margin: 0;
   margin-left: auto;
   position : static;
   z-index : 9999;
}

.navbar>a, .navr>a {
   color: white;
   padding: 22px 16px;
}

#demo {
   border: none;
}

a.dropdown-item {
   color: black;
}

.dropdown-menu>a.dropdown-item {
   padding: 15px;
   position : static;
   z-index : 10000;
}

.infobox1 {
   padding-bottom: 18px;
   padding-top: 30px;
   margin-top: 15px;
   min-width: 250px;
}

.infobox1>img {
   width: 125px;
   heigth: 125px;
   text-align: center;
   vertical-align: center;
   margin: 0 auto;
   margin-bottom: 60px;
}

.infobox2 {
   width: 48%;
   float: right;
   padding-top: 20px;
}

p.info {
   margin: 0 auto;
   margin-bottom: 20px;
   min-width: 180px;
   border-bottom: 1px solid lightgray;
}

span {
   min-width: 120px;
}

.container>.box1 {
   height: 600px;
}

.infobox2>p {
   text-align: left;
}

.container-fluid {
   width: 80%;
   margin: 0 auto;
   padding: 0;
}

td {
   border-bottom: 1px solid lightgray;
   padding: 15px;
}

th {
   border-bottom: 1px solid black;
   border-top: 1px solid black;
   padding : 13px 0;
}

.delcol2 {
   width: 19%;
}

.kor2 {
   font-size: 15pt;
   color: black;
}

/* navbar 메뉴 리스트 */
.navbar_toggleBtn {
   position: absolute;
   right: 0;
   font-size: 20px;
   display: none;
   z-index : 99999;
}

/* navbar 반응형 처리 */
@media screen and (max-width : 768px) {
   .navbar {
      padding: 0;
   }
   .navr {
      width: 100%;
   }
   .navbar_menu {
      flex-direction: column;
      align-items: center;
      width: 100%;
      display: none;
      background-color: #44a4a6;
      position : static;
      z-index : 9999;
   }
   .navbar_menu a {
      width: 100%;
      text-align: center;
      
   }
   .dropdown {
      width: 100%;
      background-color: #44a4a6;
   }
   button.dropbtn.navbar_menu {
      padding: 13px;
   }
   .navbar_menu button {
      width: 100%;
      text-align: center;
      position : static;
      z-index : 999;
   }
   .navbar_toggleBtn {
      display: block;
   }
   .navbar_menu.active {
      display: flex;
      position : static;
      z-index : 999;
   }
}
.dropdown-menu{
   width : 100%;
}
</style>
<script>
   // 아작스 페이지 각 페이지 로딩
   const url = new URLSearchParams(location.search);
   console.log("url : " + url);
   if (url.has("code")) {

      var code = url.get("code");
      console.log(code);
      if (code == 30) {
         loadLectureInfo()
      } else if (code == 41) {
         loadUserInfo()
      } else if (code == 55) {
         loadGetLecture()
      } else if (code == 63) {
         loadScoreInfo()
      }
   }
   // user lms 페이지로 넘어가는 함수
   function loadUserInfo() {
      console.log("loadUserInfo");
      var xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
         if (this.readyState == 4 && this.status == 200) {
            document.getElementById("demo").innerHTML = xhttp.responseText;
         }
      };
      xhttp.open("GET", "userInfoAction.user", true);
      xhttp.send();
   }

   // 수강신청 페이지로 넘어가는 함수
   function loadGetLecture() {
      console.log("loadGetLecture");
      var xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
         if (this.readyState == 4 && this.status == 200) {
            document.getElementById("demo").innerHTML = xhttp.responseText;
         }
      };
      xhttp.open("GET", "userGetLecture.user", true);
      xhttp.send();
   }

   // 수강신청 내역 페이지로 넘어가는 함수
   function loadLectureInfo() {
      console.log("loadLectureInfo");
      var xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
         if (this.readyState == 4 && this.status == 200) {
            document.getElementById("demo").innerHTML = xhttp.responseText;
         }
      };
      xhttp.open("GET", "userLectureInfo.user", true);
      xhttp.send();
   }

   // 성적 확인 페이지로 넘어가는 함수
   function loadScoreInfo() {
      console.log("loadScoreInfo");
      var xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
         if (this.readyState == 4 && this.status == 200) {
            document.getElementById("demo").innerHTML = xhttp.responseText;
         }
      };
      xhttp.open("GET", "userScore.user", true);
      xhttp.send();
   }

   // 강의 삭제 컨펌창
   function delec(lecno) {
      var result = confirm("강의를 삭제하시겠습니까?");
      if (result) {
         location.href = "./userLectureDelete.user?lecture_no=" + lecno;
      }
   }

   // 수강신청 컨펌창
   function insec(lecno, lecname) {
      var result = confirm("강의를 수강하시겠습니까?");
      if (result) {
         location.href = "./userLectureInsert.user?no=" + lecno + "&lnm="
               + lecname;
      }
   }

   function homeDiv() {
      location.href = "./userLayout.user";
   }

   function userUpdate() {
      location.href = "./userUpdate.user";
   }
   
   // 햄버거 버튼 온클릭 function
   function toggleBox(){
      $(function(){
         $('.navbar_toggleBtn').click(function(){
            $('.navbar_menu').addClass('active');
            $('.navbar_toggleBtn').addClass('active');
         });   
      });
         
      $(function(){
         $('.navbar_toggleBtn.active').click(function(){
            $('.navbar_menu.active').removeClass('active');
            $('.navbar_toggleBtn.active').removeClass('active');
         });
      });
   }
</script>
</head>
<body>
   <div class="logo">
      <div onclick="homeDiv()">
         <img src="../img/mainpagelogo.png" class="logo">
      </div>
      <div onclick="homeDiv()">
         <span class="logotext"><b class="kor">하이미디어대학교</b><br>
         <b class="eng">HimediaUniversity</b> </span>
      </div>
   </div>

   <div class="navbar">
      <a href="#contact" class="navbar_menu" onclick="loadUserInfo()">내
         정보</a>
      <div class="dropdown"> <!-- relative -->
         <button class="dropbtn navbar_menu" data-toggle="dropdown">
            내 강의 <i class="fa fa-caret-down"></i>
         </button>
         <div class="dropdown-menu"> <!-- absolute + top left-->
            <a href="#contact" class="dropdown-item" onclick="loadGetLecture()">수강신청</a>
            <a href="#contact" class="dropdown-item" onclick="loadLectureInfo()">내 신청내역</a>
         </div>
      </div>
      <a href="#contact" class="navbar_menu" onclick="loadScoreInfo()">성적확인</a>
      <a href="../mainBoard.jsp" class="navbar_menu">공지사항</a>
      <div class="navr">
         <a href="../main.jsp" class="navbar_menu">메인으로</a> <a
            href="userLogout.user" class="navbar_menu">로그아웃</a>
      </div>
      <a href="#" class="navbar_toggleBtn" onclick="toggleBox()"> <svg
            xmlns="http://www.w3.org/2000/svg" width="24" height="24"
            fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                <path fill-rule="evenodd"
               d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
              </svg>
      </a>
   </div>

   <!-- nav 밑에 들어가는 contents들 -->
   <div class="container-fluid" id="demo">
      <div class="box1">
         <p>내 정보</p>
         <div class="infobox1">
            <img src="${imgSrc.imgSrc}" id="pic">
            <p class="info">
               이름 : <span class="info1">${student.student_Name}</span>
            </p>
            <p class="info nob">
               학번 : <span class="info1">${student.student_Id}</span>
            </p>
            <p class="info">
               학과 : <span class="info1">${student.student_Dep}</span>
            </p>
            <p class="info">
               재학여부 : <span class="info1">${student.student_Statu }</span>
            </p>
         </div>
      </div>
      <!-- <div class="outbox"> -->
      <div class="box2">
         <p>내 수업 목록</p>
         <table>
            <tr>
               <th>강의명</th>
               <th class="delcol2">교수명</th>
               <th class="delcol1">강의시간</th>
               <th>강의실</th>
            </tr>
            <c:choose>
               <c:when test="${layoutLecture ne null }">
                  <c:forEach var="lecture" items="${layoutLecture}" end="5">
                     <tr>
                        <td>${lecture.lecture_name }</td>
                        <td class="delcol2">${lecture.lecture_pro }</td>
                        <td class="delcol1">${lecture.lecture_time }</td>
                        <td>${lecture.lecture_cp }</td>
                     </tr>
                  </c:forEach>
               </c:when>
               <c:otherwise>
                  <tr>
                     <td colspan="4"><span>수강하는 과목이 없습니다</span></td>
                  </tr>
               </c:otherwise>
            </c:choose>
         </table>
      </div>
      <div class="box3">
         <p>공지 사항</p>
         <table>
            <tr>
               <th class="delcol2">작성자</th>
               <th>글 제목</th>
               <th class="delcol1">작성시간</th>
            </tr>
            <c:choose>
               <c:when test="${board ne null }">

                  <c:forEach var="board" items="${board }" end="5">
                     <tr>
                        <td class="delcol2">${board.BOARD_NAME }</td>
                        <td>${board.BOARD_SUBJECT }</td>
                        <td class="delcol1">${board.BOARD_DATE }</td>
                     </tr>
                  </c:forEach>

               </c:when>
               <c:otherwise>
                  <tr><td colspan="3"><span>공지사항이 없습니다.</span></td></tr>
               </c:otherwise>
            </c:choose>
         </table>

      </div>
   </div>

   <!--    </div> -->
   <script>
      /* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
      var dropdown = document.getElementsByClassName("dropdown-btn");
      var i;

      for (i = 0; i < dropdown.length; i++) {
         dropdown[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var dropdownContent = this.nextElementSibling;
            if (dropdownContent.style.display === "block") {
               dropdownContent.style.display = "none";
            } else {
               dropdownContent.style.display = "block";
            }
         });
      }
   </script>
</body>
</html>