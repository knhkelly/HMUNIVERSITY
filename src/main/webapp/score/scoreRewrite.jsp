<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "vo.ScoreBean" %>
<%
ScoreBean score = (ScoreBean) session.getAttribute("lectureScore");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css">
<style>
form {
	width: 600px;
	margin: 20px auto;
/* 	padding: 10px; */
	text-align: center;
/* 	border : 2px solid #a0a2a4; */
	border-radius: 5px;
}
#memberInfoArea{
margin: 20px auto;
border-radius: 3px;
}
/* 	#memberInfoArea{ */
/* 		width : 800px; */
/* 		margin : auto; */
/* 		border : 1px solid gray; */
/* 	} */
	table{
		width : 400px;
		margin : auto;
		text-align: center;
	}
	label{
	margin-right : 5px;
	font-size : 15pt;
	}
	.bg {
	background : #a0a2a4;
	}
	   button {
	display: inline;
	text-align: center;
	border-radius: 3px;
	border : 1px solid #a0a2a4;
	}
td{
	font-size : 15pt;
	margin: 10px 0;
}
	
a#listback{
float : right;
color : black;
text-decoration: none;
font-weight : bold;
} 
#deletelist{
color: white;
font-weight: bold;
}
input,td{
margin : 8px 0;
}
input{
	border-radius: 3px;
	border : 1px solid #a0a2a4;
}
 input[type=radio]:checked+label { 
	color: blue;
 	font-weight: bold;
 } 
input[type=radio]{
 font-size : 15pt;
 width: 20px;
 height: 20px;
 }
 input[type=submit]{
            background-color: #35373a;
            color: white;
            font-weight: bold;
            border: none;  
            margin-right: 30px;
            width: 80px;

        }
  button[type=button]{
            background-color: #35373a;
            border: none;
            width: 80px  
         
        }
        h1#title{
        margin-bottom: 30px;
        }
        #listback:hover{cursor: pointer;}
</style>
</head>
<body>

	<form action="./scoreRewriteAction.score" method="post" name="frm">
	<section id = "memberInfoArea">
	<table>
	 
            <h1 id="title">성적 입력</h1>
        
			<tr>
				<td>출석 : </td>
				<td>
				<input type="number" name="att" placeholder="출석" value="<%=score.getScore_att()%>">
				</td>
			</tr>
			<tr>
				<td>중간 : </td>
				<td>
				<input type="text" name="mid" placeholder="중간" value="<%=score.getScore_mid()%>">
				</td>
			</tr>
			<tr>
				<td>기말 : </td>
				<td>
				<input type="text" name="fin" placeholder="기말" value="<%=score.getScore_final()%>">
				</td>
			</tr>
			<tr>
				<td>과제 : </td>
				<td>
				<input type="text" name="proj" placeholder="과제" value="<%=score.getScore_project()%>">
				</td>
			</tr>
			<tr>
				<td>과목 총점 : </td>
				<td>
				<input type="text" name="subtotal" placeholder="과목 총점" value="<%=score.getScore_subTotal()%>">
				</td>
			</tr>
			<tr>
				<td>등급 : </td>
				<td>
				<input type="radio" id="statu1" name="grade" value="A" required>
				<label for="statu1">A</label>
				
				<input type="radio" id="statu2" name="grade" value="B">
				<label for="statu2">B</label>
				
				<input type="radio" id="statu3" name="grade" value="C">
				<label for="statu3">C</label>
				
				<input type="radio" id="statu4" name="grade" value="D">
				<label for="statu4">D</label>
				
				<input type="radio" id="statu5" name="grade" value="F">
				<label for="statu5">F</label>
				</td>
			</tr>
			<tr>
				<td>재수강 : </td>
				<td>
				<input type="checkbox" name="comp" value="재수강">재수강
				</td>
			</tr>
	</table>
		
		<input type="submit" value="입력">
		<button type="button" onclick="history.go(-1)" style="color:white;">뒤로</button>
				
	</section>
<!-- 	<a id="listback" onclick="history.go(-1)">뒤로</a> -->
	</form>
</body>
</html>