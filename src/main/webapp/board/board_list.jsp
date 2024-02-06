<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.BoardBean"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	ArrayList<BoardBean> articleList=(ArrayList<BoardBean>)request.getAttribute("articleList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>MVC 게시판</title>
<style>
body{
background : none;
}
.pageHover:hover{cursor: pointer;}
h1 {
	text-align: center;
	margin :0;
	padding: 50px 0 30px 0;
	font-size: 2.5rem;
}

table {
	margin: auto;
	width: 950px;
	border: none;
	border-bottom: 1px solid #d4d4d4;
	text-align : center;
}

.divbtn{
	margin:0 auto;
	width: 1150px;
	margin-top: 10px;
	
}

#tr_top {
	text-align: center;
	border-bottom: 2px solid black;
	border-top: 2px solid black;
	
}
tr{
border-top : 1px solid #d4d4d4;
}
.no{
width: 45px;
padding: 15px 0;
}
.sub{
width: 300px;
padding: 15px 0;

}
.wri{
width: 70px;
padding: 15px 0;
text-align : left;
}
.cal{
width: 100px;
padding: 15px 0;
text-align : left;
}
.count{
width: 55px;
padding: 15px 0;
}
td{
padding:10px 0;
}
.left{
text-align : left;
}
section#pageList {
    text-align: center; /* 텍스트 가운데 정렬 */
    margin-top: 20px; /* 위쪽 여백 조절 */
    margin-bottom: 20px; /* 아래쪽 여백 조절 */
    position: absolute; /* 절대 위치로 설정 */
    bottom: 0; /* 하단에 배치 */
    left: 50%; /* 가운데 정렬을 위해 왼쪽으로 이동 */
    transform: translateX(-50%); /* 가운데 정렬 */
    background-color: white; /* 배경색 지정 */
    padding: 10px; /* 내부 여백 조절 */
    
  }

#emptyArea {
	margin: auto;
	width: 500px;
	text-align: center;
}

#insertboard{
margin-right: 130px;
border-width: 0;
background: #645c5c;
border-color: rgba(54, 54, 54, 0);
color: white;
padding: 6px 24px;
font-size: 12pt;
border-radius: 3px;
float : right;
}

a{
text-decoration : none;
color: black;
}
#listForm{
 width: 80%;
 padding-left: 250px;
}

</style>
</head>

<body>
<div id="countList">
	<!-- 게시판 리스트 -->
	<section id="listForm">

			<h1>공지사항</h1>
		<table>
<% if(articleList != null && listCount > 0){ %>
			<tr id="tr_top">
				<th class="no">번호</th>
				<th class="sub">제목</th>
				<th class="wri">작성자</th>
				<th class="cal">작성일</th>
				<th class="count">조회수</th>
			</tr>
	<%for(int i=0;i<articleList.size();i++){ %>
			<tr>
				<td><%=articleList.get(i).getBOARD_NUM()%></td>
				<td class="left">
					<%if(articleList.get(i).getBOARD_RE_LEV()!=0){ 
						for(int a=0;a<=articleList.get(i).getBOARD_RE_LEV()*2;a++){ %>&nbsp; 
					<%   } %>  
					<%}else{ %>  
					<%} %> 
<%-- 					<a href="boardDetail.board?board_num=<%=articleList.get(i).getBOARD_NUM()%>&page=<%=nowPage%>"> --%>
					<a href="layout.jsp?code=303&board_num=<%=articleList.get(i).getBOARD_NUM()%>&page=<%=nowPage%>">
						<%=articleList.get(i).getBOARD_SUBJECT()%>
					</a>
				</td>
				<td class="left"><%=articleList.get(i).getBOARD_NAME() %></td>
				<td class="left"><%=articleList.get(i).getBOARD_DATE() %></td>
				<td><%=articleList.get(i).getBOARD_READCOUNT() %></td>
			</tr>
	<%} %>
	
		</table>
		<div class="divbtn"><a id="insertboard" role="button" href="boardWriteForm.board">게시글쓰기</a></div>
	</section>

<!-- <button type="button" ><a id="insertboard" href="boardWriteForm.board">게시판글쓰기</a></button> -->
<br><br>
	<section id="pageList">
					
		<%if(nowPage<=1){ %> 
			이전&nbsp;
		<%}else{ %>
<%-- 			<button class="btn btn-primary" onclick="loadNoticePageList(<%=nowPage-1 %>)">이전</button>&nbsp; --%>
			<a class="pageHover" onclick="loadNoticePageList(<%=nowPage-1 %>)">이전</a>&nbsp;
		<%} %>

		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
					<%=a %>&nbsp;
				<%}else{ %>
<%-- 					<a href="boardList.board?page=<%=a %>">[<%=a %>]</a>&nbsp; --%>
					<a class="pageHover" onclick="loadNoticePageList(<%=a %>)" style="font-weight: bold;"><%=a %></a>&nbsp;
				<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>
			다음
		<%}else{ %>
<%-- 			<a href="boardList.board?page=<%=nowPage+1 %>">[다음]</a> --%>
			<a class="pageHover" onclick="loadNoticePageList(<%=nowPage+1 %>)">다음</a>
		<%} %>
	</section>
<% } else{ %>
	<section id="emptyArea">등록된 글이 없습니다.</section>
<% } %>
</div>
</body>
</html>