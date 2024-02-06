<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="vo.BoardBean"%>
<%
	BoardBean article = (BoardBean)request.getAttribute("article");
	String nowPage = (String)request.getAttribute("page");
	request.setCharacterEncoding("UTF-8");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style>
body{
	background-color: white;
}
 img.logo {
 	display: inline; 
	width: 100px;
	height: 100px;
	vertical-align: middle;
	text-align: center;
	
}

.head {
	border-bottom: 1px solid #b3a7a7;
	height: 120px;
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
.logotext, img.logo:hover { cursor: pointer; }

a{
text-decoration : none;
color: black;
}
#articleForm {
	width: 1000px;
	height: 500px;
	margin: 0 auto;
	text-align:center;

}

h4 {
	text-align: center;
	margin :0;
	padding: 25px 0 30px 0;
	font-size: 2.5rem;
}

#basicInfoArea {
	position: relative;
	text-align: left;
	padding: 15px 5PX;
	border-top: 2px solid black;
	background: #e7d4c6;
	font-weight: 700;
	font-size: 20px;
	
}

#articleContentArea {

	border: 1px solid #ccc;
	margin-top: 2px;
	height: 350px;
	text-align: left;
	overflow: auto;
	border-top: 1px solid #bababa;
	padding: 10px;
	border-bottom: 1px solid #d4d4d4;
}


#imgDiv {
	display: none;
	position: absolute;
	top:0;
	left: 20px;
	width: 90%;
	height: 250px;
	border: 1px solid #ccc;
	border-radius: 8px;
	overflow : hidden;
	padding: 0px;
	background-size: cover;
	background-repeat : no-repeat;
	background-image : url(/servletproject/boardUpload/<%=article.getBOARD_FILE()%>);
}

.back {
	width: 1000px;
	background-color: white;	
	padding: 50px 0 15px 0;
	barder: 1px solid #e3e3e3;
	
}

.file{
	text-align: left;
	border-top: 1px solid #bababa;
	padding: 5px;
}

.file1, .file2{
	display: inline-block;
}

.file2{
	padding-left: 150px;
}

.mainback{
	text-align: left;
}
a{
text-decoration : none;
color: black;
}

#insertboard2{
border-width: 0;
background: #e7d4c6;
border-color: rgba(54, 54, 54, 0);
color: black;
padding: 6px 24px;
font-size: 12pt;
border-radius: 3px;
float : left;
}
#insertboard2:hover { cursor: pointer; }


@media screen and (max-width: 1000px){
	*{font-size: 20px;}
	.back{width: 100%;}
	.file1{
	display: none;
    visibility: hidden;
    width: 0%;
	}
	.file2{padding-left: 100px;}
 	.mob{width: 90%;}
 	#articleContentArea {
	height: 500px;
	overflow: visible;
	}
}

</style>




<script>
function showDiv(){
	document.getElementById("imgDiv").style.display = "block";
}

function hideDive(){
	document.getElementById("imgDiv").style.display = "none";
}


</script>
</head>

<body>
<div class="head">
			<div class="headin">
			<img class="logo" src="./img/mainpagelogo.png"onclick="location.href='main.jsp'">
				<div class="headinner"> <span class="logotext" onclick="location.href='main.jsp'">
        <b class="kor">하이미디어대학교</b><br>
        &nbsp;<b class="eng">HimediaUniversity</b>
      </span></div>
			</div>				
	</div>
	<div id="articleForm">
		<h4>공지사항</h4>
		
		<div class="back">
		
		<div id="basicInfoArea">
			제 목 : <%=article.getBOARD_SUBJECT()%> 
		</div>
	
			<div class="file">
			<div class="file1 mob">작성자:  <%=article.getBOARD_NAME() %> </div>
			<div class="file2 mob">작성일자: <%=article.getBOARD_DATE() %></div>
			 			
			<div class="file2 mob">첨부파일 : <%if(!(article.getBOARD_FILE()==null)){ %>
				<a href="filedown.board?fname=<%=article.getBOARD_FILE()%>"><%=article.getBOARD_FILE() %></a> </div>
		</div>
			
			<div id="imgDiv mob" onclick="hideDive()"></div>
			<%} %>
		
		<div id="articleContentArea" class="mob"><%=article.getBOARD_CONTENT().replace("\n","<br>") %></div>

	</div>

	<div class="mainback">
		<input type = "button" id="insertboard2" value = "목록" onClick ="javascript:history.go(-1)">
	</div>
	
	</div>
</body>
</html>