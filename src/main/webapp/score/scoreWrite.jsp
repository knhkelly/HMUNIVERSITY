<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
	border-collapse: collapse;
	}
	table, tr, td, th {
	border: 1px solid black;
	}
</style>

</head>
<body>
	<form action="./scoreWriteAction.score" method="post">
		<input type="number" name="lec_no" placeholder="과목코드">
		<input type="text" name="lec_name" placeholder="강의명">
		<input type="number" name="att" placeholder="출석">
		<input type="number" name="mid" placeholder="중간">
		<input type="number" name="fin" placeholder="기말">
		<input type="text" name="proj" placeholder="과제">
		<input type="number" name="subtotal" placeholder="과목 총점">
		<input type="text" name="grade" placeholder="등급">
		<input type="checkbox" name="comp" value="재수강">
		<input type="submit" value="등록">
	</form>
</body>
</html>