<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>강의 정보 상세보기</title>
            <style>
                body {
                    margin: 0;
		            background-color: #e9e9e9;
                }
                .title {
                    text-align: center;
                    margin: 0px 0px 40px 0px;
                }
                .ent {
                    box-sizing: border-box;
                    border: none;
                    border-radius: 5px;
                    width: 50%;
                    margin: 100px auto;
                    padding: 30px 90px;
                    box-shadow: 2px 2px 7px gray;
                    background-color: white;
                }

                .lecT {
		        	background-color: #a0a2a4;
                    color: white;
                    border-bottom: none;
                    width: 100%;
                }

                .buttons {
                    margin-top: 20px;
                    text-align: right;
                }

                .backList {
                    width: 100px;
                    padding: 10px;
                    margin-bottom: 20px;
                    border-radius: 0;
                    border: 1px solid #a0a2a4;
		        	background-color: #a0a2a4;
                    color: white;
                    display: block;
                    /* margin-left: auto; */
                    display: inline;
                    text-decoration: none;
                }

                .backList:hover {
                    background-color: white;
                    color: lightblue;
                    cursor: pointer;
                }

                .totalS {
                    border-bottom: 1px solid lightgray;
                    width: 100%;
                }

                table,
                tr,
                td,
                th {
                    border-collapse: collapse;
                    padding: 8px 0;
                    text-align: center;
                }
/*                 .menubar { */
/*                     float: left; */
/*                     width: 5%; */
/*                     margin: -11px 0px; */
/*                     text-align: center; */
/*                 } */
            </style>
            <script>
            function delec(lecno){
        		var result = confirm("강의를 삭제하시겠습니까?");
        		if(result){
        			location.href="lecture_delete.lms?lecture_no="+lecno;
        		}
        	}
            </script>
        </head>

        <body>

            <!-- <section id="memberInfoArea"> -->
            <div class="ent">
                <h1 class="title">강의 상세보기</h1>
                <table class="totalS">
                    <c:choose>
                        <c:when test="${lecture ne null}">
                            <tr class="totals lecT">
                                <td>강의 코드</td>
                                <td>강의명</td>
                                <td>교수명</td>
                                <td>학년</td>
                                <td>학과</td>
                            </tr>
                            <tr>
                                <td>${lecture.lecture_no}</td>
                                <td>${lecture.lecture_name}</td>
                                <td>${lecture.lecture_pro}</td>
                                <td>${lecture.lecture_grade}</td>
                                <td>${lecture.lecture_dep}</td>
                            </tr>
                            </table>
                            <table class="totalS">
                            <tr class="totals lecT">
                                <td>이수구분</td>
                                <td>학점</td>
                                <td>수강인원</td>
                                <td>강의시간</td>
                                <td>학기</td>
                                <td>강의실</td>
                            </tr>
                            <tr>
                                <td>${lecture.lecture_category}</td>
                                <td>${lecture.lecture_score}</td>
                                <td>${lecture.lecture_nop}</td>
                                <td>${lecture.lecture_time}</td>
                                <td>${lecture.lecture_semester}</td>
                                <td>${lecture.lecture_cp}</td>
                            </table>
                            <table class="totalS">
                            <tr class="totalsT lecT">
                                <td>강의계획</td>
                            </tr>
                            <tr>
                                <td>${lecture.lecture_lp}</td>
                            </tr>
                        </table>
                <div class="buttons">
                    <a href="layout.jsp?code=282" class="backList menubar">메뉴</a>
                    <a href="./layout.jsp?code=283&lecture_no=${lecture.lecture_no} " class="backList">수정</a>
<%--                     <a href="lecture_delete.lms?lecture_no=${lecture.lecture_no}" class="backList">삭제</a> --%>
                    <a onclick="delec('${lecture.lecture_no}')" class="backList">삭제</a>
                </div>
        </div>

            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="2">강의 조회 안됨</td>
                </tr>
            </c:otherwise>
            </c:choose>

            <!-- </section> -->
        </body>

        </html>