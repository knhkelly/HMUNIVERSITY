<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
	<script type="text/javascript">
	function modifyboard(){
		modifyform.submit();
	}
	</script>
	<style type="text/css">
	body{
	background-color: #fff;
}
h2 {
	text-align: center;
	margin :0;
	padding: 50px 0 30px 0;
	font-size: 2.5rem;
}
   table{
    	margin: auto;
	width: 900px;
	border-color: white;
	border-radius: 6px;
	border-top: 2px solid black;
	border-bottom: 2px solid black;
      }
   .td_left{
     font-weight: bold;
	width: 100px;
	background: #white;
	padding: 10px 0 ;
	text-align : center;
   }
   .td_right{
  	width: 800px;
	background: #white;
	padding: 10px 0;
   }
   tr.linetr{
border-top : 1px solid #d4d4d4;
}
td.texttd{
padding: 10px 0;
}
   input{
padding: 3px 0;
}
input#BOARD_SUBJECT{
width:400px;
}
textarea#BOARD_CONTENT{
width: 800px;
resize:none;
padding: 10px 0 ;
}
   #commandCell{
      text-align: center;
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
border-width: 0;
background: #645c5c;
border-color: rgba(54, 54, 54, 0);
color: white;
padding: 6px 24px;
font-size: 12pt;
border-radius: 3px;
float : right;
}
input:hover {
	cursor: pointer;
}
.divbtn{
	margin:0 auto;
	width: 1100px;
	margin-top: 20px;
}
        input[type=file]{
/*         background-color: #ddd; */
            color: black;
            font-weight: bold;
            border: none;
            display: inline;  
        }
</style>
</head>
<body>
<!-- 게시판 등록 -->

<section id = "writeForm">
<h2>공지사항 수정</h2>
<form action="boardModifyPro.board" method="post" name = "modifyform" >
<input type = "hidden" name = "BOARD_NUM" value = "<%=article.getBOARD_NUM()%>">
<table>
	<tr>
		<td class="td_left">
			<label for = "BOARD_NAME">글쓴이</label>
		</td>
		<td class="td_right">
			<input type = "text" name="BOARD_NAME" id = "BOARD_NAME" value = "<%=article.getBOARD_NAME()%>">
		</td>
	</tr>
	<tr class="linetr">
		<td class="td_left">
			<label for = "BOARD_PASS">비밀번호</label>
		</td>
		<td class="td_right">
			<input name="BOARD_PASS" type="password" id = "BOARD_PASS">
		</td>
	</tr>
	<tr class="linetr">
		<td class="td_left">
			<label for = "BOARD_SUBJECT">제 목</label>
		</td>
		<td class="td_right">
			<input name="BOARD_SUBJECT" type="text" id = "BOARD_SUBJECT" value = "<%=article.getBOARD_SUBJECT()%>">
		</td>
	</tr>
	<tr class="linetr">
		<td class="td_left">
			<label for = "BOARD_CONTENT">내 용</label>
		</td>
		<td>
			<textarea id = "BOARD_CONTENT" name="BOARD_CONTENT" cols="40" rows="15"><%=article.getBOARD_CONTENT()%></textarea>
		</td>
	</tr>
	<tr class="linetr">
					<td class="td_left"><label for="BOARD_FILE"> 파일 첨부 </label></td>
					<td class="td_right"><input name="BOARD_FILE" type="file" id="BOARD_FILE"></td>
				</tr>
</table>
<div class="divbtn"><a id="insertboard1" role="button" onClick ="javascript:history.go(-1)">뒤로</a></div>
<div class="divbtn"><input type="submit" value="수정" id="insertboard"></div>

<!-- <a href="history.go(-1)">[뒤로]</a> -->
<!-- 	<section id = "commandCell"> -->
<!-- 			<a href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp; -->
<!-- 			<a href="javascript:history.go(-1)">[뒤로]</a> -->
<!-- 	</section> -->
</form>
</section>
</body>
</html>