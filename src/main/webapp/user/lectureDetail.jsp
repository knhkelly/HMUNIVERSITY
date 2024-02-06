<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	int student_id = Integer.parseInt(session.getAttribute("student_login").toString());
	int lecture_no = Integer.parseInt(request.getParameter("no"));
	String student_name = request.getAttribute("student_Name").toString();
	String student_dep = request.getAttribute("student_Dep").toString();
	String lecture_name = null;
	
	session.setAttribute("student_name", student_name);
	session.setAttribute("student_dep", student_dep);
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try {
			Context init = new InitialContext();
			DataSource ds =  (DataSource) init.lookup("java:comp/env/jdbc/HmuLmsDB");
			conn = ds.getConnection();
		
			String sql = "select * "
					+"from student, lecture "
					+"where student_id = ? and lecture_no = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, student_id);
			pstmt.setInt(2, lecture_no);
			rs=pstmt.executeQuery();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
	<div class="entBox">
		<table>
			<tr>
			<th>과목코드</th>
			<th>강의명</th>
			<th>담당교수</th>
			<th>학년</th>
			<th>학과</th>
			<th>분류</th>
			<th>학점</th>
			<th>수강인원</th>
			<th>수업시간</th>
			<th>학기</th>
			<th>강의실</th>
			<th>강의설명</th>
			</tr>
			<%if(rs.next()){ 
// 				student_name = rs.getString("student_name");
// 				student_dep = rs.getString("student_dep");
				lecture_name = rs.getString("lecture_name");
				System.out.println(student_name);
			%>
				<tr>
				<th><%=rs.getInt("LECTURE_NO") %></th>
				<th><%=rs.getString("LECTURE_NAME") %></th>
				<th><%=rs.getString("LECTURE_PRO") %></th>
				<th><%=rs.getString("LECTURE_GRADE") %></th>
				<th><%=rs.getString("LECTURE_DEP") %></th>
				<th><%=rs.getString("LECTURE_CATEGORY") %></th>
				<th><%=rs.getString("LECTURE_SCORE") %></th>
				<th><%=rs.getString("LECTURE_NOP") %></th>
				<th><%=rs.getString("LECTURE_TIME") %></th>
				<th><%=rs.getString("LECTURE_SEMESTER") %></th>
				<th><%=rs.getString("LECTURE_CP") %></th>
				<th><%=rs.getString("LECTURE_LP") %></th>
				</tr>
			<%} 
			rs.close();
			pstmt.close();
			conn.close();
			
			%>
		</table>
	</div>
	<button onclick="enroll()">수강신청</button>
	<button onclick="history.back()">뒤로가기</button>
	<script>
		function enroll(){
<%-- 			var name = '<%=student_name%>'; --%>
<%-- 			var id = '<%=student_id%>'; --%>
			var no = '<%=lecture_no%>';
<%-- 			var dep = '<%=student_dep %>'; --%>
			var lnm = '<%=lecture_name %>';
// 			console.log(id);
			console.log(no);
// 			console.log(name);
			
			var result = confirm("해당 강의를 수강 신청하시겠습니까?");
			if(result){
				location.href="userLectureInsert.user?no="+no+"&lnm="+lnm;
			}
			
		}
	</script>
</body>
</html>