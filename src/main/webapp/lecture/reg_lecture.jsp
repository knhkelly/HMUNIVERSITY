<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section id = "joinformArea">
<form name="reg_lecture" action="reg_lecture.lms" method="post">
<table>
	<tr>
		<td colspan="2">
			<h1>Lecture test</h1>
		</td>
	</tr>
	<tr>
		<td><label for = "LECTURE_NO">강의번호 : </label> </td>
		<td><input type="text" name="LECTURE_NO" id = "LECTURE_NO" required></td>
	</tr>
	<tr>
		<td><label for = "LECTURE_NAME">강의명 : </label></td>
		<td><input type="text" name="LECTURE_NAME" id = "LECTURE_NAME" required></td>
	</tr>
	<tr>
		<td><label for = "LECTURE_PRO">교수명 : </label></td>
		<td><input type="text" name="LECTURE_PRO" id = "LECTURE_PRO" required></td>
	</tr>
	<tr>
		<td><label for = "LECTURE_GRADE">학년 : </label></td>
		<td><input type="text" name="LECTURE_GRADE" maxlength="2" id = "LECTURE_GRADE" required></td>
	</tr>
	<tr>
		<td><label for = "LECTURE_DEP">학과 : </label></td>
		<td><input type="text" name="LECTURE_DEP" id = "LECTURE_DEP"></td>
	</tr>
		<tr>
		<td><label for = "LECTURE_CATEGORY">이수구분 : </label></td>
		<td><input type="text" name="LECTURE_CATEGORY" id = "LECTURE_CATEGORY"></td>
	</tr>
		<tr>
		<td><label for = "LECTURE_SCORE">학점 : </label></td>
		<td><input type="text" name="LECTURE_SCORE" id = "LECTURE_SCORE"></td>
	</tr>
		<tr>
		<td><label for = "LECTURE_NOP">학습자(명) : </label></td>
		<td><input type="text" name="LECTURE_NOP" id = "LECTURE_NOP"></td>
	</tr>
		<tr>
		<td><label for = "LECTURE_TIME">강의 시간 : </label></td>
		<td><input type="text" name="LECTURE_TIME" id = "LECTURE_TIME"></td>
	</tr>
		<tr>
		<td><label for = "LECTURE_SEMESTER">년도/학기 : </label></td>
		<td><input type="text" name="LECTURE_SEMESTER" id = "LECTURE_SEMESTER"></td>
	</tr>
		<tr>
		<td><label for = "LECTURE_CP">강의실 위치 : </label></td>
		<td><input type="text" name="LECTURE_CP" id = "LECTURE_CP"></td>
	</tr>
	<tr>
		<td><label for = "LECTURE_LP">강의 계획서 : </label></td>
		<td><input type="text" name="LECTURE_LP" id = "LECTURE_LP"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="회원가입">
			<input type="reset" value="다시작성">
		</td>
	</tr>
</table>
</form>
</section>
</body>
</html>