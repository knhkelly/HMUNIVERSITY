<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.StudentBean" %>
<% StudentBean student = (StudentBean)request.getAttribute("student");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		function modifylecture(){
			updateform.submit();
		}
	</script>
</head>
<body>
<!-- user 정보 수정하는 페이지 -->
<!-- update 가능하도록 -->
<section id = "writeForm">
<h2>강의수정</h2>
<form action="./userInfoUpdate.me" method="post" name = "updateform" >
<input type = "hidden" name = "STUDENT_ID" value = "<%=student.getStudent_Id()%>">
<table>
	<tr>
		<td class="td_left">
			<label for = "STUDENT_NAME">강좌명</label>
		</td>
		<td class="td_right">
			<input type = "text" name="STUDENT_NAME" id = "STUDENT_NAME" value = "<%=student.getStudent_Name()%>">
		</td>
	</tr>
	<tr>
		<td class="td_left">
			<label for = "STUDENT_DEP">담당 교수</label>
		</td>
		<td class="td_right">
			<input name="STUDENT_DEP" type="text" id = "STUDENT_DEP" value = "<%=student.getStudent_Dep()%>">
		</td>
	</tr>
		<tr>
		<td class="td_left">
			<label for = "STUDENT_REG">담당 교수</label>
		</td>
		<td class="td_right">
			<input name="STUDENT_REG" type="text" id = "STUDENT_REG" value = "<%=student.getStudent_Reg()%>">
		</td>
	</tr>
	<tr>
		<td class="td_left">
			<label for = "STUDENT_GENDER">학년</label>
		</td>
		<td class="td_right">
			<input name="STUDENT_GENDER" type="text" id = "STUDENT_GENDER" value = "<%=student.getStudent_Gender()%>">
		</td>
	</tr>
	<tr>
		<td class="td_left">
			<label for = "STUDENT_MAIL">학과</label>
		</td>
		<td class="td_right">
			<input name="STUDENT_MAIL" type="text" id = "STUDENT_MAIL" value = "<%=student.getStudent_Mail()%>">
		</td>
	</tr>
	<tr>
		<td class="td_left">
			<label for = "STUDENT_STATU">이수구분</label>
		</td>
		<td class="td_right">
			<input name="STUDENT_STATU" type="text" id = "STUDENT_STATU" value = "<%=student.getStudent_Statu()%>">
		</td>
	</tr>
		<tr>
		<td class="td_left">
			<label for = "STUDENT_ADDRESS">학점</label>
		</td>
		<td class="td_right">
			<input name="STUDENT_ADDRESS" type="text" id = "STUDENT_ADDRESS" value = "<%=student.getStudent_Address()%>">
		</td>
	</tr>
		<tr>
		<td class="td_left">
			<label for = "STUDENT_PHONE">수강인원</label>
		</td>
		<td class="td_right">
			<input name="STUDENT_PHONE" type="text" id = "STUDENT_PHONE" value = "<%=student.getStudent_Phone()%>">
		</td>
	</tr>
</table>
	<section id = "commandCell">
			<input type="submit" value="수정완료">&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[뒤로]</a>
	</section>
</form>
</section>

</body>
</html>