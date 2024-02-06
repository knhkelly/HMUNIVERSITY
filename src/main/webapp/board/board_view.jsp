
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
	background-color: #f7f9fa;
}
#articleForm {
	width: 1000px;
	height: 500px;
	margin: 0 auto;
	text-align:center;
}

h4 {
	text-align: center;
	margin : 0 ;
	padding: 50px 0 30px 0;
	font-size: 2.5rem;
}

#basicInfoArea {
	position: relative;
	text-align: left;
	padding: 15px 5PX;
	border-top: 2px solid black;
	background: #f7f7f7;
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
	padding: 10px 10px ;
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
	padding: 50px;
/* 	margin-left: 20px;  */
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
	padding-left: 80px;
}

.mainback{
	text-align: left;
}
a{
	text-decoration : none;
	color: black;
}

#insertboard{
	border-width: 0;
	background: #645c5c;
	border-color: rgba(54, 54, 54, 0);
	color: white;
	padding: 6px 24px;
	font-size: 12pt;
	border-radius: 3px;
	float : right;
	margin-right: 10px;
}
#insertboard1{
	margin-right: 230px;
	border-width: 0;
	background: #645c5c;
	border-color: rgba(54, 54, 54, 0);
	color: white;
	padding: 6px 24px;
	font-size: 12pt;
	border-radius: 3px;
	float : right;
}
#insertboard1:hover{cursor:pointer;}
#insertboard2{
	border-width: 0;
	background: #645c5c;
	border-color: rgba(54, 54, 54, 0);
	color: white;
	padding: 6px 24px;
	font-size: 12pt;
	border-radius: 3px;
	float : right;
	margin-right: 10px;
}
#insertboard2:hover{cursor:pointer;}
.divbtn{
	margin:0 auto;
	width: 1100px;
	margin-top: 10px;
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
	<!-- 게시판 수정 -->
	<div id="articleForm">
		<h4>공지사항</h4>
		
		<div class="back">
		
		<div id="basicInfoArea">
			제 목 : <%=article.getBOARD_SUBJECT()%> 
		</div>
	
			<div class="file">
			<div class="file1">작성자:  <%=article.getBOARD_NAME() %> </div>
			<div class="file2">작성일자: <%=article.getBOARD_DATE() %></div>
			 			
			<div class="file2">첨부파일 : <%if(!(article.getBOARD_FILE()==null)){ %>
				<a href="filedown.board?fname=<%=article.getBOARD_FILE()%>"><%=article.getBOARD_FILE() %></a> </div>
<!-- 			<a href="javascript:showDiv();">이미지 보기</a> -->
		</div>
			
			<div id="imgDiv" onclick="hideDive()"></div>
			<%} %>
		
		<div id="articleContentArea"><%=article.getBOARD_CONTENT().replace("\n","<br>") %></div>

	</div>
	
<div class="divbtn"><a id="insertboard1" role="button" href="boardDeleteForm.board?board_num=<%=article.getBOARD_NUM() %>&page=${page }">삭제</a></div>
<%-- <div class="divbtn"><a id="insertboard1" role="button" onclick="delBoard('<%=article.getBOARD_NUM() %>', '${nowPage }')">삭제</a></div> --%>
<div class="divbtn"><a id="insertboard" role="button" href="./layout.jsp?code=304&board_num=<%=article.getBOARD_NUM() %>">수정</a></div>


	<div class="mainback">
<!-- 		<div class="divbtn"><a id="insertboard2" role="button" href="history.go(-1)">목록으로 돌아가기</a></div> -->
		<input type = "button" id="insertboard2" value = "목록" onClick ="javascript:history.go(-1)">
	</div>
	
	</div>
</body>
</html>