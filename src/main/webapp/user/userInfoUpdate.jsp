<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="vo.StudentBean"%>
<%
StudentBean student = (StudentBean) request.getAttribute("student");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
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
<script type="text/javascript">
   function modifylecture() {
      updateform.submit();
   }
</script>
<style>
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

/* Some media queries for responsiveness */
@media screen and (max-height: 450px) {
   .sidenav {
      padding-top: 15px;
   }
   .sidenav a {
      font-size: 18px;
   }
}

@media screen and (max-width : 576px) {
   .ltext {
      display: none;
   }
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
}

div.logo {
   margin: 0 auto;
   margin-bottom: 30px;
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
   padding: 25px 30px;
   text-align: center;
   margin: 0 auto;
   margin-bottom: 50px;
   box-shadow: 2px 2px 10px 0 #8b8b8b;
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
   box-shadow: 2px 2px 10px 0 #8b8b8b;
   float: right;
   height: 600px;
   overflow: hidden;
}

.box3 {
   width: 100%;
   border: 3px solid lightgray;
   border-radius: 15px;
   padding: 25px 60px 80px 60px;
   text-align: center;
   margin-bottom: 50px;
   float: right;
   box-shadow: 2px 2px 10px 0 #8b8b8b;
}

.outbox {
   width: 95%;
   margin: 0 auto;
   padding: 0;
}

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
   border-bottom: 1px solid lightgrey;
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

.dropdown-menu>a {
   padding: 15px;
}

.dropdown-menu{
   width : 100%;
}

.infobox1 {
   padding-bottom: 18px;
   padding-top: 30px;
   margin-top: 15px;
}

.infobox1>img {
   width: 35%;
   heigth: 35%;
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

table {
   border: none;
   margin: 0 auto;
   margin-bottom : 30px;
   width : 50%;
   text-align : center;
}

td, th {
   border-bottom: 1px solid lightgray;
   padding: 15px;
   margin-left : 30px;
}

#commandCell{
   margin : 0 auto;
   width : 50%;
   text-align : right;
}

.topName{
   margin-bottom : 50px;
   text-align : center;
}

.topBor{
   border-top : 1px solid lightgray;
}

.botButton{
   border : none;
   background-color : #44a4a6;
   color : white;
   padding : 15px;
   border-radius : 5px;
}

label{
   white-space : nowrap;
}

/* navbar 메뉴 리스트 */
.navbar_toggleBtn {
   position: absolute;
   right: 0;
   font-size: 20px;
   display: none;
}

@media screen and (max-width : 480px){
   #commandCell{
      width : 80%;
      text-align : center;
   }
}

/* navbar 반응형 처리 */
@media screen and (max-width : 768px) {
   .navbar {
      padding: 0;
      height : 68px;
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
   }
   .navbar_toggleBtn {
      display: block;
   }
   .navbar_menu.active {
      display: flex;
   }
}

</style>
</head>
<script>
   //user lms 페이지로 넘어가는 함수
   function loadUserInfo() {
      console.log("loadUserInfo");
      var xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
         if (this.readyState == 4 && this.status == 200) {
            document.getElementById("demo").innerHTML = xhttp.responseText;
         }
      };
      xhttp.open("GET", "./userInfoAction.user", true);
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
      xhttp.open("GET", "./user/userGetLecture.user", true);
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
      xhttp.open("GET", "./user/userLectureInfo.user", true);
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
      xhttp.open("GET", "./user/userScore.user", true);
      xhttp.send();
   }

   function homeDiv() {
      location.href = "./userLayout.user";
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
<body>
   <div class="logo">
      <div onclick="homeDiv()">
         <img src="../img/mainpagelogo.png" class="logo">
      </div>
      <div onclick="homeDiv()">
         <span class="logotext"> <b class="kor">하이미디어대학교</b><br> <b
            class="eng">HimediaUniversity</b>
         </span>
      </div>
   </div>

   <div class="navbar">
      <a href="./userLayout.user?code=41" class="navbar_menu">내 정보</a>
      <div class="dropdown navbar_menu">
         <button class="dropbtn" data-toggle="dropdown">
            내 강의 <i class="fa fa-caret-down"></i>
         </button>
         <div class="dropdown-menu">
            <a href="#contact" class="dropdown-item" onclick="loadGetLecture()">수강신청</a>
            <a href="#contact" class="dropdown-item" onclick="loadLectureInfo()">내
               신청 내역</a>
         </div>
      </div>
      <a href="#contact" onclick="loadScoreInfo()" class="navbar_menu">성적 확인</a> 
      <a href="../mainBoard.jsp" class="navbar_menu">공지 사항</a>
      <div class="navr">
         <a href="../main.jsp" class="navbar_menu">메인으로</a>
         <a href="userLogout.user" class="navbar_menu">로그아웃</a>
      </div>
      <a href="#" class="navbar_toggleBtn" onclick="toggleBox()"> <svg
            xmlns="http://www.w3.org/2000/svg" width="24" height="24"
            fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                <path fill-rule="evenodd"
               d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
              </svg>
      </a>
   </div>
   <!-- user 정보 수정하는 페이지 -->
   <!-- update 가능하도록 -->
   <section id="writeForm">
      <h2 class = "topName">학생 정보 수정</h2>
      <form action="./userInfoUpdate.user" method="post" name="updateform">
         <input type="hidden" name="STUDENT_ID"
            value="<%=student.getStudent_Id()%>">
         <table>
            <tr class="topBor">
               <td class="td_left"><label for="STUDENT_NAME">이름</label></td>
               <td class="td_right"><input type="text" name="STUDENT_NAME"
                  id="STUDENT_NAME" value="<%=student.getStudent_Name()%>" disabled>
               </td>
            </tr>
            <tr>
               <td class="td_left"><label for="STUDENT_DEP">학과</label></td>
               <td class="td_right"><input name="STUDENT_DEP" type="text"
                  id="STUDENT_DEP" value="<%=student.getStudent_Dep()%>" disabled>
               </td>
            </tr>
            <tr>
               <td class="td_left"><label for="STUDENT_PW">비밀번호</label></td>
               <td class="td_right"><input name="STUDENT_PW" type="text"
                  id="STUDENT_PW" value="<%=student.getStudent_Pw()%>"></td>
            </tr>
            <tr>
               <td class="td_left"><label for="STUDENT_REG">주민번호</label></td>
               <td class="td_right"><input name="STUDENT_REG" type="text"
                  id="STUDENT_REG" value="<%=student.getStudent_Reg()%>" disabled>
               </td>
            </tr>
            <tr>
               <td class="td_left"><label for="STUDENT_GENDER">성별</label></td>
               <td class="td_right"><input name="STUDENT_GENDER" type="text"
                  id="STUDENT_GENDER" value="<%=student.getStudent_Gender()%>"
                  disabled></td>
            </tr>
            <tr>
               <td class="td_left"><label for="STUDENT_MAIL">메일</label></td>
               <td class="td_right"><input name="STUDENT_MAIL" type="text"
                  id="STUDENT_MAIL" value="<%=student.getStudent_Mail()%>">
               </td>
            </tr>
            <tr>
               <td class="td_left"><label for="STUDENT_STATUS">재학여부</label></td>
               <td class="td_right"><input name="STUDENT_STATUS" type="text"
                  id="STUDENT_STATUS" value="<%=student.getStudent_Statu()%>"
                  disabled></td>
            </tr>
            <tr>
               <td class="td_left"><label for="STUDENT_ADDRESS">주소</label></td>
               <td class="td_right"><input name="STUDENT_ADDRESS" type="text"
                  id="STUDENT_ADDRESS" value="<%=student.getStudent_Address()%>">
               </td>
            </tr>
            <tr>
               <td class="td_left"><label for="STUDENT_PHONE">폰번호</label></td>
               <td class="td_right"><input name="STUDENT_PHONE" type="text"
                  id="STUDENT_PHONE" value="<%=student.getStudent_Phone()%>">
               </td>
            </tr>
         </table>
         <section id="commandCell">
             <a href="javascript:history.go(-1)"><button class="botButton">돌아가기</button></a>&nbsp;&nbsp;<button class="botButton">수정완료</button>
            
         </section>
      </form>
   </section>

</body>
</html>