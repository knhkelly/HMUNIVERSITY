<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	body {
      margin: 0;
      box-sizing: content-box;
   }
   
   img.logo {
      display: inline-block;
      padding : 0;
      display: block;
   }
   
   
   .logo {
      background-color: #333; /* 로고 배경색 지정 */
      color: #fff; /* 로고 텍스트 색상 지정 */
      text-align: center;
      padding: 10px;
      height: 70px; /* 로고의 높이 지정 */
      display: flex; /* 부모 컨테이너를 플렉스 박스로 설정 */
      align-items: center; /* 수직 정렬 (가운데 정렬) */
   }
   
   .sidenav {
      float: left;
      height: 100vh;
      background-color: #333;
      overflow-x: hidden;
      padding-top: 40px;
      width: 200px;
   }
   
   .sidenav a, .dropdown-btn {
      padding: 6px 8px 6px 16px;
      text-decoration: none;
      font-size: 20px;
      color: white;
      display: block;
      border: none;
      background: none;
      width: 100%;
      text-align: left;   
      cursor: pointer;
      outline: none;
   }
   
   .sidenav a:hover { color: darkgray; }
   .dropdown-btn:hover { color: darkgray; }
   
   .main {
      margin-left: 250px;
      font-size: 20px;
      padding: 0px 10px;
   }
   
   a.list {
     /* color: #fff; */
   }
   
   .active {
      background-color: rgb(105, 209, 169);
      color: black;
   }
   
   .dropdown-container {
      display: none;
      background-color: #3f3f3f;
      color: #ccc;
      padding-left: 8px;
   }
   
   /* Optional: Style the caret down icon */
   .fa-caret-down {
      float: right;
      padding-right: 8px;
   }
   
   /* Some media queries for responsiveness */
   @media screen and (max-height: 450px) {
      .sidenav {padding-top: 15px;}
      .sidenav a {font-size: 18px;}
   }
   
   .line {
      width: 200;
      background-color: #a0a2a4;
   }
   .dropdown .dropbtn {
      font-size: 16px;
      border: none;
      outline: none;
      color: white;
      padding: 14px 16px;
      background-color: inherit;
      font-family: inherit; /* Important for vertical align on mobile phones */
      margin: 0; /* Important for vertical align on mobile phones */
      background-color: #a0a2a4;;
   }
   
   .dropdown:hover .dropdown-content { 
      display: block; 
   }
   
   .dropdown-content a {
      float: none;
      color: black;
      padding: 12px 16px;
      text-decoration: none;
      display: block;
      text-align: left;
   }
   
   .dropdown-content {
      display: none;
      position: absolute;
      background-color: #f9f9f9;
      min-width: 160px;
/*        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2); */
        z-index: 1;
   }
   
   table, .menu {
      border: 1px solid black;
       border-collapse: collapse;
   }
   
   table {
      width: 80%;
      margin: 0 auto;}
   
   .menu_list { border-bottom: 1px solid black; }
   
     .midbox { border-style: none; }

     .logotext{
       margin-left: 10px;
       line-height: 16px;
       text-align: left;
       flex-grow: 1;
   }
   
     .kor{ font-size: 19pt; }
     
     .eng{
       font-size: small;
       letter-spacing: 1px;
       font-weight: 400;
     }

     .home {
       font-weight: bolder;
       padding: 10px 15px;
       border: solid 2px white;
       border-radius: 2px;
       background-color: #333;
       color: white;
       margin-right: 30px;
     }

   .home:hover {
       cursor: pointer;
       background-color: #fff;
       color: #333;
     }
  
  .logotext, img.logo:hover { cursor: pointer; }
  
</style>
<script>

const url = new URLSearchParams(location.search);
if(url.has("code")){
	var code = url.get("code");
	if(code == 282) { loadList();}
	else if(code == 283) { var lecno = url.get("lecture_no"); loadModLec(lecno) }
	else if(code == 272) { studentList(); }
	else if(code == 273) { var stdno = url.get("student_Id"); studentInfo(stdno); }
	else if(code == 292) { loadScore(); }
	else if(code == 293) { var lecno = url.get("lecno"); scoreInsert(lecno); }
	else if(code == 301) { boardWrite(); }
	else if(code == 302) { boardList(); }
	else if(code == 303) { var bno = url.get("board_num"); boardDetail(bno); }
	else if(code == 304) { var bno = url.get("board_num"); boardModify(bno); }
}

//강의등록
function loadReg(){
    var xhttp = new XMLHttpRequest();
       xhttp.onreadystatechange = function(){
          if (this.readyState == 4 && this.status == 200) {
             document.getElementById("demo").innerHTML = xhttp.responseText;
          }
       };
       xhttp.open("GET", "lecture/lecture_reg.jsp", true);
       xhttp.send();
 }
 
 //강의목록
   function loadList(){
      var xhttp = new XMLHttpRequest();
         xhttp.onreadystatechange = function(){
            if (this.readyState == 4 && this.status == 200) {
               document.getElementById("demo").innerHTML = xhttp.responseText;
            }
         };
         xhttp.open("GET", "lecture_list.lms", true);
         xhttp.send();
   }
 
 //강의수정
   function loadModLec(lecno){
      var xhttp = new XMLHttpRequest();
         xhttp.onreadystatechange = function(){
            if (this.readyState == 4 && this.status == 200) {
               document.getElementById("demo").innerHTML = xhttp.responseText;
            }
         };
         xhttp.open("GET", "lecture_modify.lms?lecture_no="+lecno, true);
         xhttp.send();
   }
 
 //강의페이지목록
   function loadPageList(page){
      var xhttp = new XMLHttpRequest();
         xhttp.onreadystatechange = function(){
            if (this.readyState == 4 && this.status == 200) {
               document.getElementById("demo").innerHTML = xhttp.responseText;
            }
         };
         xhttp.open("GET", "lecture_list.lms?page="+page, true);
         xhttp.send();
   }
 
   //학생페이지목록
   function loadStudentPageList(page){
      var xhttp = new XMLHttpRequest();
         xhttp.onreadystatechange = function(){
            if (this.readyState == 4 && this.status == 200) {
               document.getElementById("demo").innerHTML = xhttp.responseText;
            }
         };
         xhttp.open("GET", "studentListAction.me?page="+page, true);
         xhttp.send();
   }
 
 
 //학생 등록
   function studentInsert(){
       var xhttp = new XMLHttpRequest();
       	xhttp.onreadystatechange = function(){
             if (this.readyState == 4 && this.status == 200) {
                document.getElementById("demo").innerHTML = xhttp.responseText;
             }
          };
          xhttp.open("GET", "./Student/studentInsert.jsp", true);
          xhttp.send();
    }
 
 //학생 수정
   function studentInfo(stdno){
       var xhttp = new XMLHttpRequest();
       	xhttp.onreadystatechange = function(){
             if (this.readyState == 4 && this.status == 200) {
                document.getElementById("demo").innerHTML = xhttp.responseText;
             }
          };
          xhttp.open("GET", "./studentViewAction.me?student_Id="+stdno, true);
          xhttp.send();
    }
    
 
 // 학생 목록
 function studentList(){
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function(){
            if (this.readyState == 4 && this.status == 200) {
               document.getElementById("demo").innerHTML = xhttp.responseText;
            }
         };
         xhttp.open("GET", "studentListAction.me", true);
         xhttp.send();
 }
 
//성적용학생목록
 function loadScore(){
	
    var xhttp = new XMLHttpRequest();
       xhttp.onreadystatechange = function(){
          if (this.readyState == 4 && this.status == 200) {
             document.getElementById("demo").innerHTML = xhttp.responseText;
          }
       };
       xhttp.open("GET", "studentViewAction.score", true);
       xhttp.send();
 }
 
 //성적용학생 페이지목록
   function loadScorePageList(page){
      var xhttp = new XMLHttpRequest();
         xhttp.onreadystatechange = function(){
            if (this.readyState == 4 && this.status == 200) {
               document.getElementById("demo").innerHTML = xhttp.responseText;
            }
         };
         xhttp.open("GET", "studentViewAction.score?page="+page, true);
         xhttp.send();
   }
 
//성적 수정
 function scoreInsert(lecno){
	
    var xhttp = new XMLHttpRequest();
       xhttp.onreadystatechange = function(){
          if (this.readyState == 4 && this.status == 200) {
             document.getElementById("demo").innerHTML = xhttp.responseText;
          }
       };
       xhttp.open("GET", "score/scoreRewrite.jsp?lecno="+lecno, true);
       xhttp.send();
 }
 
//공지사항 목록
 function boardList(){
   
    var xhttp = new XMLHttpRequest();
       xhttp.onreadystatechange = function(){
          if (this.readyState == 4 && this.status == 200) {
             document.getElementById("demo").innerHTML = xhttp.responseText;
          }
       };
       xhttp.open("GET", "boardList.board", true);
       xhttp.send();
 }
 
//공지사항 글쓰기
 function boardWrite(){
   
    var xhttp = new XMLHttpRequest();
       xhttp.onreadystatechange = function(){
          if (this.readyState == 4 && this.status == 200) {
             document.getElementById("demo").innerHTML = xhttp.responseText;
          }
       };
       xhttp.open("GET", "board/board_write.jsp", true);
       xhttp.send();
 }
 
//공지글 상세보기
 function boardDetail(bno){
   
    var xhttp = new XMLHttpRequest();
       xhttp.onreadystatechange = function(){
          if (this.readyState == 4 && this.status == 200) {
             document.getElementById("demo").innerHTML = xhttp.responseText;
          }
       };
       xhttp.open("GET", "boardDetail.board?board_num="+bno, true);
       xhttp.send();
 }
 
//공지글 수정
 function boardModify(bno){
   
    var xhttp = new XMLHttpRequest();
       xhttp.onreadystatechange = function(){
          if (this.readyState == 4 && this.status == 200) {
             document.getElementById("demo").innerHTML = xhttp.responseText;
          }
       };
       xhttp.open("GET", "boardModifyForm.board?board_num="+bno, true);
       xhttp.send();
 }
 
//공지글 페이지목록
 function loadNoticePageList(page){
    var xhttp = new XMLHttpRequest();
       xhttp.onreadystatechange = function(){
          if (this.readyState == 4 && this.status == 200) {
             document.getElementById("countList").innerHTML = xhttp.responseText;
          }
       };
       xhttp.open("GET", "boardList.board?page="+page, true);
       xhttp.send();
 }

 

 //lecture_list, lecture_info에서 사용하는 메소드
 function delec(lecno){
		var result = confirm("강의를 삭제하시겠습니까?");
		if(result){
			location.href="lecture_delete.lms?lecture_no="+lecno;
		}
	}
 
 function delstd(stdno) {
		var result = confirm("학생 정보를 삭제하시겠습니까?");
		if (result) {
			location.href = "studentDeleteAction.me?id=" + stdno;
		}
	}
 
//  function delBoard(boardno, page) {
// 	 console.log(boardno);
// 	 console.log(page);
// 		var result = confirm("공지를 삭제하시겠습니까?");
// 		if (result) {
// 			location.href = "boardDeletePro.board?board_num="+boardno+"&page="+page;
// 		}
// 	}
 
</script>
</head>
<body>

<%if(session.getAttribute("adminId") != null) { %>
  <div class="logo">
      <img class="logo" src="./img/logo.png" onclick="location.href='main.jsp'">
      <span class="logotext" onclick="location.href='main.jsp'">
        <b class="kor">하이미디어대학교</b><br>
        &nbsp;<b class="eng">HimediaUniversity</b>
      </span>
      <button class="home" onclick="location.href='logout'">로그아웃</button>
  </div>

<div class="sidenav">
	<div class="midbox">
	  <button class="dropdown-btn">강의 관련</button>
	  <div class="dropdown-container">
	    <a class="list" onclick="loadReg()">강의 등록</a>
	    <a class="list" onclick="loadList()">강의 목록</a>
	  </div>
	  
	  <button class="dropdown-btn">학생 관련</button>
	  <div class="dropdown-container">
	    <a class="list" onclick="studentInsert()">학생 등록</a>
	    <a class="list" onclick="studentList()">학생 목록</a>
	  </div>
	  <a href="#contact" onclick="loadScore()">성적 관련</a>
	  <a href="#contact" onclick="boardList()">공지 사항</a>
	</div>
</div>

   <div id="demo">
   </div>
   <%} else { %>
   		<script>
			alert('관리자가 아닙니다.');
			location.href='./main.jsp';
		</script>
   <%} %>
<script>
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
