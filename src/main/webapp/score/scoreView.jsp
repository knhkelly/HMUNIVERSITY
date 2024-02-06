<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<% 
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	int student_no = Integer.parseInt(request.getParameter("id"));
	session.setAttribute("student_no", student_no);
	
	String sql = null;
	try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/HmuLmsDB");
			conn = ds.getConnection();
			
			sql = "select * from student where student_id = ?";

			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, student_no);
			rs=pstmt.executeQuery();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		margin: 0;
		background-color: #e4f2f2;
	}
	a{
		text-decoration: none;
		color: gray;
	}
	a:hover{
		color: black;
		font-weight: bold;
	}
	small{ color: gray;}
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
	}
	
	table, tr, td, th {
 		border-collapse: collapse;
		padding: 8px 0;
		text-align: center;
	}
	
	.lecture{
		width: 100%;
	}
	.totalBox {
		width: 100%;
		margin: 50px 0;
	}
	.totalS{
		border-bottom: 1px solid lightgray;
		width: 100%;
	}
	span{
		display:block;
		font-weight: bold;
		font-size: 20px;
	}
	.backList{
		width: 200px;
		padding: 10px;
		margin-bottom: 20px;
		border-radius: 0;
		border: 1px solid lightblue;
		background-color: lightblue;
		color: white;
		display: block;
		margin-left: auto;
	}
	.stuBox{
/* 		display: flex; */
	}
	.lecT{
		background-color: lightblue;
		color: white;
		border-bottom: none;
	}
	.lectureList{
		border-bottom: 1px solid lightgray;
	}
	.delBtn{
		outline:none;
	}
	.stuImg{
/* 		width: 60px; */
		width: 10%;
	}
	.delImg{
 		width: 20px;
	}
	.delImg:hover{
		cursor: pointer;
	}
</style>
</head>
<body>
	<div class="ent">
	
	<%if(rs.next()){%>
	<div class="stuBox">
		<img src="../img/reg.png" class="stuImg" />
		<table class="student"><tr><th><%=rs.getInt("student_id") %></th><th><%=rs.getString("student_name") %></th><th><%=rs.getString("student_dep") %></th></tr></table>
	</div>
	<%} %>
	<div>
	<table class="lecture">
		<tr class="lecT"><th>과목코드</th><th>수강과목</th><th>등급</th><th>삭제</th></tr>
		<%
			try {
				Context init = new InitialContext();
				DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/HmuLmsDB");
				conn = ds.getConnection();
				
				sql = "select * from score where student_no = ?";
	
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setInt(1, student_no);
				rs=pstmt.executeQuery();
		}catch(Exception e){
			e.printStackTrace();
		}
		if(rs.next()){
			do{
				
				
				String student_name = rs.getString("STUDENT_NAME");
				session.setAttribute("student_name", student_name);
				
				String student_dep = rs.getString("STUDENT_DEP");
				session.setAttribute("student_dep", student_dep);
				
				int lecno = rs.getInt("LECTURE_NO");
				session.setAttribute("lecture_no", lecno);
		%>
	<tr class="lectureList">
			<td>
<%-- 				<a href="./lecturescore.jsp?id=<%=rs.getInt("LECTURE_NO") %>"><%=rs.getInt("LECTURE_NO") %></a> --%>
				<a href="./lecturescore.score?id=<%=rs.getInt("LECTURE_NO") %>"><%=rs.getInt("LECTURE_NO") %></a>
			</td>
			<td>
				<a href="./lecturescore.score?id=<%=rs.getInt("LECTURE_NO") %>"><%=rs.getString("LECTURE_NAME") %></a>
			</td>
			<td>
				<%=rs.getString("SCORE_GRADE") %>
			</td>
		<td class="delTD">
			<img src="../img/deleteButton.png" class="delImg" onclick="deleteScore('<%=lecno%>')"/>
		</td>
	</tr>
	
	<%}while(rs.next());
		}
		
	try {
		sql = "SELECT * from totalscore inner join score on score.student_no = totalscore.student_id where score.student_no = ?";
	
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setInt(1, student_no);
				rs=pstmt.executeQuery();
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	
	</table><small>성적 수정시 과목 클릭</small>
	</div>
	<div class="totalBox">
		<span>전체성적요약</span>
			<table class="totalS">
				<tr class="totalsT lecT"><td>신청학점</td><td>취득학점</td><td>교양</td><td>전공</td><td>총점수</td><td>총점평균</td></tr>
				<%if(rs.next()) {%>
				<tr>
					<td><%=rs.getInt("SCORE_APPLICATION") %></td>
					<td><%=rs.getInt("SCORE_GET") %></td>
					<td><%=rs.getInt("SCORE_SUB") %></td>
					<td><%=rs.getInt("SCORE_MAIN") %></td>
					<td><%=rs.getInt("SCORE_TOTAL") %></td>
					<td><%=rs.getInt("SCORE_AVGTOTAL") %></td>
				</tr>
				<%} %>
			</table>
	</div>
	<button type="button" class="backList" onclick="location.href='../layout.jsp?code=292'">학생 목록</button>
	</div>
	<%
	rs.close();
	pstmt.close();
	conn.close();
	%>
	<script>
		function deleteScore(delno){
			var result = confirm("성적을 삭제하시겠습니까?");
			if(result){
				location.href="scoreDeleteAction.score?delno="+delno;
			}
		}
	</script>
	
</body>
</html>