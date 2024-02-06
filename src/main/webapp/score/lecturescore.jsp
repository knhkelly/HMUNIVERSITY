<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*" %>

<% 
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String lnm = null;
	int delno = 0;
	int lecno = Integer.parseInt(request.getParameter("id")) ;
	
	try {
			Context init = new InitialContext();
			DataSource ds =  (DataSource) init.lookup("java:comp/env/jdbc/HmuLmsDB");
			conn = ds.getConnection();
		
			int lecture_no = Integer.parseInt(request.getParameter("id"));
			int student_no = Integer.parseInt(String.valueOf(session.getAttribute("student_no")));
			
			String sql = "SELECT * FROM score inner join LECTURE on score.lecture_no = lecture.lecture_no WHERE score.STUDENT_NO = ? AND score.LECTURE_NO = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, student_no);
			pstmt.setInt(2, lecture_no);
			rs=pstmt.executeQuery();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		margin: 0;
		background-color: #e4f2f2;
	}
	.ent{
		box-sizing: border-box;
		border: none;
		border-radius: 5px;
		width: 50%;
		margin: 100px auto;
		padding: 30px 90px;
		box-shadow : 2px 2px 7px gray;
		background-color: white;
	}
	.lecT{
		background-color: lightblue;
		color: white;
		border-bottom: none;
	}
	.buttons{
		margin-top: 20px;
		text-align: right;
	}
	.backList{
		width: 100px;
		padding: 10px;
		margin-bottom: 20px;
		border-radius: 0;
		border: 1px solid lightblue;
		background-color: lightblue;
		color: white;
		display: block;
		margin-left: auto;
		display: inline;
	}
	.backList:hover{
		background-color: white;
		color: lightblue;
		cursor: pointer;
	}
	.student{
		margin-left: auto; 
		width: 40%;
		height: 50px;
 		margin-bottom: 30px;
 		font-size: 18px;
 		font-weight: bold;
	}
	.totalS{
		border-bottom: 1px solid lightgray;
		width: 100%;
	}
	table, tr, td, th {
 		border-collapse: collapse;
		padding: 8px 0;
		text-align: center;
	}
	
</style>
</head>
<body>
	<%
		if(rs.next()){
			session.setAttribute("forRewriteStNo", rs.getInt("STUDENT_NO"));
			
			delno = rs.getInt("LECTURE_NO");
			lnm = rs.getString("LECTURE_NAME");
	%>
	<div class="ent">
		<div class="stuBox">
			<table class="student"><tr><td><%=rs.getInt("LECTURE_NO") %></td><td><%=rs.getString("LECTURE_NAME") %></td><td><%=rs.getInt("lecture_score") %></td><td><%=rs.getString("lecture_semester") %></td></tr></table>
		</div>
		<div><table class="totalS">
			<tr class="totalsT lecT"><th>출석</th><th>중간</th><th>기말</th><th>과제</th><th>과목 총점</th><th>등급</th><th>재수강여부</th></tr>
			<tr><th><%=rs.getInt("SCORE_ATT") %></th><th><%=rs.getInt("SCORE_MID") %></th><th><%=rs.getInt("SCORE_FINAL") %></th><th><%=rs.getInt("SCORE_PROJECT") %></th><th><%=rs.getInt("SCORE_SUBTOTAL") %></th><th><%=rs.getString("SCORE_GRADE") %></th><th><%=rs.getString("SCORE_COMPLETION") %></th></tr>
		</table></div>
		<div class="buttons">
<%-- 			<button class="backList" onclick="location.href='scoreRewrite.jsp?lecno=<%=lecno%>'">수정</button> --%>
			<button class="backList" onclick="location.href='../layout.jsp?code=293&lecno=<%=lecno%>'">수정</button>
			<button class="backList" onclick="deleteScore('<%=delno%>')">삭제</button>
			<button class="backList" onclick="history.back()">돌아가기</button>
			<button class="backList" onclick="location.href='../layout.jsp?code=292'">리스트로</button>
		</div>
		<%} %>
	</div>
	<script>
		function deleteScore(delno){
			var lnm = '<%=lnm%>';
			console.log(lnm);
			var result = confirm(lnm + " 성적을 삭제합니다")
			if(result){
				location.href="scoreDeleteAction.score?delno="+delno;
			}
		}
	</script>
</body>
</html>