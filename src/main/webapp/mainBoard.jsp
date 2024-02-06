<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="vo.PageInfo"%>
<%@page import="dao.BoardDAO, vo.BoardBean, svc.BoardListService"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.text.SimpleDateFormat"%>


<%
   ArrayList<BoardBean> articleList=new ArrayList<BoardBean>();
   int firstpage=1;
   int limit=10;
   
   if(request.getParameter("page")!=null){
      firstpage=Integer.parseInt(request.getParameter("page"));
   }
   
   BoardListService boardListService = new BoardListService();
   int listCount = boardListService.getListCount(); //총 리스트 수를 받아옴.
   articleList = boardListService.getArticleList(firstpage,limit); //리스트를 받아옴.
   //총 페이지 수.
   int maxPage=(int)((double)listCount/limit+0.95); //0.95를 더해서 올림 처리.
   int startPage = (((int) ((double)firstpage / 10 + 0.9)) - 1) * 10 + 1;
    int endPage = startPage+10-1;

   if (endPage> maxPage) endPage= maxPage;

   PageInfo pageInfo = new PageInfo();
   pageInfo.setEndPage(endPage);
   pageInfo.setListCount(listCount);
   pageInfo.setMaxPage(maxPage);
   pageInfo.setPage(firstpage);
   pageInfo.setStartPage(startPage);
   
   request.setAttribute("pageInfo", pageInfo);
   request.setAttribute("articleList", articleList);

   int nowPage=pageInfo.getPage();
%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>MVC 게시판</title>
<style>
body{
background : white;
}
 img.logo {
/*    padding: 0; */
    display: inline; 
   width: 100px;
   height: 100px;
   vertical-align: middle;
   text-align: center;
   
}

.head {
   border-bottom: 1px solid #b3a7a7;
   height: 120px;
   align-items: center;
   background-color: white;
   display: flex;
   text-align: center;
}

.logotext {
   margin-left: 10px;
   line-height: 16px;
   flex-grow: 1;
   vertical-align: middle;
   
}
.headinner{
display:inline-block;
vertical-align: middle;
}

.kor {
   font-size: 19pt;
}

.eng {
   font-size: small;
   letter-spacing: 1px;
   font-weight: 400;
}

a{
text-decoration : none;
color: black;
text-align  : center;
}

h1 {
   text-align: center;
   margin :0;
   padding: 25px 0 30px 0;
   font-size: 2.5rem;
}

table {
   margin: auto;
   width: 90%;
   border-bottom: 1px solid #d4d4d4;
   text-align : center;
   border-collapse:collapse;
}

.logotext, img.logo:hover { cursor: pointer; }

#tr_top {
   text-align: center;
   border-bottom: 2px solid black;
   border-top: 2px solid black;
   background-color: #f7f7f7;
   
}
tr{
border-top : 1px solid #d4d4d4;
}
td{
padding:10px 0;
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
.left{
text-align : left;
}
.divbtn{
   margin:0 auto;
   width: 100%;
   margin-top: 10px;
   
}
#insertboard{
margin : 20px 30px 0 0;
border-width: 0;
background: #645c5c;
border-color: rgba(54, 54, 54, 0);
color: white;
padding: 6px 24px;
font-size: 12pt;
border-radius: 3px;
float : right;
}


  
  a:hover {
  cursor:pointer;
  }
   section#pageList a:visited {
    color: purple !important; /* 선택된 링크 텍스트 색상 */
    text-decoration: underline !important; /* 밑줄 추가 */
    
}
     *,
   *::before,
   *::after {
     box-sizing: content-box;
   }
#emptyArea {
   margin: auto;
   width: 500px;
   text-align: center;
}

section#pageList {
    text-align: center;
/*     position: fixed; */
    bottom: 20px;
    left: 50%;
   width: 30%;
    background-color: white;
    padding: 10px;
    margin: 0 auto;
}

@media screen and (max-width : 480px){
   *{
      overflow: hidden !important;
      white-space: nowrap;
      text-overflow: ellipsis !important;
   }
   
   .delcol{
       display : none;
   }
   

}

@media screen and (max-width : 768px){
   .writeWho{
      display : none;
   }
   
   th, td{
      font-size : 12px!important;
   }
   
   h1{
      font-size : 1.5rem;
   }
}

@media screen and (max-width: 1024px){
    #countList{
    margin: 0 auto;
    }
   
   *{
   font-size: 15px;
   }
   
   .count, .no {
      display: none;
       visibility: hidden;
       width: 0%;
    }
    .sub{
    width: 70%;
    }
    .cal{
    width: 15%;
    }
    
    td.left.sub, th.sub, th.cal, td.left, th.wri.writeWho{
        text-align : center; 
    }
}

</style>
</head>

<body>
<div class="head">
         <div class="headin">
         <img class="logo" src="./img/mainpagelogo.png"onclick="location.href='main.jsp'">
            <div class="headinner"> <span class="logotext" onclick="location.href='main.jsp'">
        <b class="kor">하이미디어대학교</b><br>
        &nbsp;<b class="eng">HimediaUniversity</b>
      </span></div>
         </div>            
   </div>
<div id="countList">
   <!-- 게시판 리스트 -->
   <section id="listForm">

         <h1>공지사항</h1>
      <table>
<% if(articleList != null && listCount > 0){ %>
         <tr id="tr_top">
            <th class="no">번호</th>
            <th class="sub">제목</th>
            <th class="wri writeWho">작성자</th>
            <th class="cal delcol">작성일</th>
            <th class="count">조회수</th>
         </tr>
   <%for(int i=0;i<articleList.size();i++){ %>
         <tr>
            <td class="no"><%=articleList.get(i).getBOARD_NUM()%></td>
            <td class="left sub">
               <%if(articleList.get(i).getBOARD_RE_LEV()!=0){ 
                  for(int a=0;a<=articleList.get(i).getBOARD_RE_LEV()*2;a++){ %>&nbsp; 
               <%   } %>  
               <%}else{ %>  
               <%} %> 
               <a class="cal" href="boardDetail.mainbo?board_num=<%=articleList.get(i).getBOARD_NUM()%>&page=<%=nowPage%>">
                  <%=articleList.get(i).getBOARD_SUBJECT()%>
               </a>
            </td>
            <td class="left writeWho"><%=articleList.get(i).getBOARD_NAME() %></td>
            <td class="left delcol"><%=articleList.get(i).getBOARD_DATE() %></td>
            <td class="count"><%=articleList.get(i).getBOARD_READCOUNT() %></td>
         </tr>
   <%} %>
   
      </table>
      <a id="insertboard" role="button" href="main.jsp">메인으로</a>
   </section>

<br><br>
   <section id="pageList">
               
      <%if(nowPage<=1){ %> 
         이전&nbsp;
      <%}else{ %>
         <a href="boardList.mainbo?page=<%=nowPage-1 %>">이전</a>&nbsp;
      <%} %>

      <%for(int a=startPage;a<=endPage;a++){
            if(a==nowPage){%>
               <%=a %>&nbsp;
            <%}else{ %>
               <a href="boardList.mainbo?page=<%=a %>" style="font-weight: bold;"><%=a %></a>&nbsp;
            <%} %>
      <%} %>

      <%if(nowPage>=maxPage){ %>
         다음
      <%}else{ %>
         <a href="boardList.mainbo?page=<%=nowPage+1 %>">다음</a>
      <%} %>
   </section>
<% } else{ %>
   <section id="emptyArea">등록된 글이 없습니다.</section>
<% } %>
</div>
</body>
</html>