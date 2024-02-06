<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	int board_num=(Integer)request.getAttribute("board_num");
    String nowPage = (String)request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>MVC 게시판</title>
<style>
body{
	background-color: #fff;
}
	#passForm{
		width:400px;
		margin: auto;
		padding: 15px 5px;
		border : 2px solid black;
		border-radius: 8px;
	}
	
#btnin{
padding-top:15px;

}
input.sub{
background-color: #35373a;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            padding: 10px;  
}
input.BOARD_PASS{
padding: 6px;
border-radius: 8px;
}
input:hover {
	cursor: pointer;
}

</style>
</head>
<body>
<section id = "passForm">
<form name="deleteForm" action="boardDeletePro.board?board_num=<%=board_num %>" method="post">
	<input type = "hidden" name = "page" value = "<%=nowPage %>">
	<table>
	<tr>
		<th>
			<label>관리자 비밀번호 : </label>
		</th>
		<td>
			<input name="BOARD_PASS" class="BOARD_PASS" type="password">
		</td>
	</tr>
	<tr>
		<td id="btnin">
			<input type="submit" class="sub" value = "삭제">&nbsp;&nbsp;
			<input type = "button" class="sub" value = "돌아가기" onClick ="javascript:history.go(-1)">
		
	</tr>
	</table>
</form>
</section>
</body>
</html>