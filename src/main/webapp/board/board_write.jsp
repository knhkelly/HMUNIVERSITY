<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style type="text/css">
body{
background : none;
}

h1 {
	text-align: center;
	margin :0;
	padding: 50px 0 30px 0;
	font-size: 2.5rem;
}

table {
	margin: auto;
	width: 900px;
	border-color: white;
	border-radius: 6px;
	border-top: 2px solid black;
	border-bottom: 2px solid black;
}

.td_left {
	font-weight: bold;
	width: 100px;
	background: #white;
	padding: 10px 0 ;
	text-align : center;
	
}

.td_right {
	width: 800px;
	background: #white;
	padding: 10px 0;
}
td.texttd{
padding: 10px 0;
}
tr.linetr{
border-top : 1px solid #d4d4d4;
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

#commandCell {
	text-align: center;
}
 input[type=submit],input[type=reset] {
            background-color: #35373a;
            color: white;
            font-weight: bold;
            margin-top: 50px;
            border: none;
            display: inline;    
            width: 150px;
            padding: 10px 0;
            border-radius: 6px;
            
        }
        input[type=file]{
/*         background-color: #ddd; */
            color: black;
            font-weight: bold;
            border: none;
            display: inline;  
        }
        input:hover {
	cursor: pointer;
}
</style>
<body>

	<section id="writeForm">
		<h1>공지사항 등록</h1>
		<form action="boardWritePro.board" method="post" enctype="multipart/form-data" name="boardform">
			<table>
				<tr id="linetr">
					<td class="td_left"><label for="BOARD_NAME">작성자</label></td>
					<td class="td_right"><input type="text" name="BOARD_NAME" id="BOARD_NAME" required></td>
				</tr>
				<tr class="linetr">
					<td class="td_left"><label for="BOARD_PASS">비밀번호</label></td>
					<td class="td_right"><input name="BOARD_PASS" type="password" id="BOARD_PASS" required></td>
				</tr>
				<tr class="linetr">
					<td class="td_left"><label for="BOARD_SUBJECT">제 목</label></td>
					<td class="td_right"><input name="BOARD_SUBJECT" type="text" id="BOARD_SUBJECT" required></td>
				</tr>
				<tr class="linetr">
					<td class="td_left"><label for="BOARD_CONTENT">내 용</label></td>
					<td class="texttd"><textarea id="BOARD_CONTENT" name="BOARD_CONTENT" cols="40" rows="15" required></textarea></td>
				</tr>
				<tr class="linetr">
					<td class="td_left"><label for="BOARD_FILE"> 파일 첨부 </label></td>
					<td class="td_right"><input name="BOARD_FILE" type="file" id="BOARD_FILE"></td>
				</tr>
			</table>
			<section id="commandCell">
				<input type="submit" value="등록">&nbsp;&nbsp;
				<input type="reset" value="다시쓰기" >
			</section>
		</form>
	</section>
</body>
</html>