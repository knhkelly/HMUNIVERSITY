<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="vo.LectureBean"%>
<%
LectureBean lecture = (LectureBean) request.getAttribute("lecture");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* h1 { */
/*    font-size: 50px; */
/*    color: black; */
/*    text-align: center; */
/* } */

/* .tie { */
/*    border: 1px solid #000; */
/*    border-radius: 5px; */
/*    display: flex; */
/* } */

/* .tie_two { */
/*    border: 1px solid #000; */
/*    border-radius: 5px; */
/*    width: 495px; */
/*    display: inline-block; */
/* } */

/* .tie_three { */
/*    border: 1px solid #000; */
/*    border-radius: 5px; */
/*    width: 495px; */
/*    display: inline-block; */
/* } */

/* .LECTURE_NAME { */
/*    padding: 13px 8.8px 10px 8.8px; */
/*    width: 100px; */
/*    text-align: center; */
/*    color: white; */
/*    background-color: #a0a2a4; */
/*    border-radius: 4px 0px 0px 4px; */
/* } */

/* .LECTURE_NO { */
/*    padding: 13px 21px 15px 21px; */
/*    display: inline; */
/*    background-color: #a0a2a4; */
/*    color: white; */
/*    border-radius: 4px 0px 0px 4px; */
/*    box-sizing: border-box; */
/* } */

/* .LECTURE_PRO { */
/*    padding: 14px 32px 14px 32px; */
/*    display: inline; */
/*    background-color: #a0a2a4; */
/*    color: white; */
/*    border-radius: 4px 0px 0px 4px; */
/* } */

/* .LECTURE_GRADE { */
/*    padding: 11.7px 45px 16.2px 40px; */
/*    height: 29px; */
/*    display: inline; */
/*    background-color: #a0a2a4; */
/*    color: white; */
/*    border-radius: 4px 0px 0px 4px; */
/* } */

/* .LECTURE_DEP { */
/*    padding: 14px 40px 14px 40px; */
/*    display: inline; */
/*    background-color: #a0a2a4; */
/*    color: white; */
/*    border-radius: 4px 0px 0px 4px; */
/* } */

/* .LECTURE_CATEGORY { */
/*    padding: 11.7px 27px 16.2px 21px; */
/*    display: inline; */
/*    background-color: #a0a2a4; */
/*    color: white; */
/*    border-radius: 4px 0px 0px 4px; */
/* } */

/* .LECTURE_SCORE { */
/*    padding: 11.7px 46px 16.2px 40px; */
/*    display: inline; */
/*    background-color: #a0a2a4; */
/*    color: white; */
/*    border-radius: 4px 0px 0px 4px; */
/* } */

/* .LECTURE_NOP { */
/*    padding: 13px 21px 15px 21px; */
/*    display: inline; */
/*    background-color: #a0a2a4; */
/*    color: white; */
/*    border-radius: 4px 0px 0px 4px; */
/* } */

/* .LECTURE_TIME { */
/*    padding: 11.8px 27px 16px 21px; */
/*    display: inline; */
/*    background-color: #a0a2a4; */
/*    color: white; */
/*    border-radius: 4px 0px 0px 4px; */
/* } */

/* .LECTURE_SEMESTER { */
/*    padding: 12px 39px 16px 46px; */
/*    display: inline; */
/*    background-color: #a0a2a4; */
/*    color: white; */
/*    border-radius: 4px 0px 0px 4px; */
/* } */

/* .LECTURE_CP { */
/*    padding: 14px 32px 14px 32px; */
/*    display: inline; */
/*    background-color: #a0a2a4; */
/*    color: white; */
/*    border-radius: 4px 0px 0px 4px; */
/* } */

/* .LECTURE_LP { */
/*    padding: 13px 100px 13px 100px; */
/*    width: 10%; */
/*    margin: 0 auto; */
/* /*    display: inline; */ */
/*    background-color: #a0a2a4; */
/*    color: white; */
/*    border-radius: 4px 4px 0px 0px; */
/* } */

/* .LECTURE_LP_BOX { */
/*    border: 1px solid black; */
/*    border-bottom: none; */
/* /*    padding: 13px 0px; */ */
/*    border-radius: 5px 5px 0px 0px; */
/*    background-color: #a0a2a4; */
/* } */

/* input[type=text], input[type=number] { */
/*    height: 25px; */
/*    line-height: 25px; */
/*    font-size: 15px; */
/*    border: 1px solid black; */
/*    border-radius: 0px 5px 5px 0px; */
/*    border-width: 0px 0px 0px 1px; */
/*    background-position: 10px; */
/*    /* display: none; */ */
/* } */

/* input:focus { */
/*    outline: none; */
/* } */

/* #LECTURE_NAME { */
/*    width: 974px; */
/*    padding: 12px 0px; */
/*    padding-left: 5px; */
/*    border-radius: 0px 5px 5px 0px; */
/* } */

/* .two { */
/*    width: 370px; */
/*    padding: 12px 0px; */
/*    padding-left: 5px; */
/* } */

/* .box { */
/*    display: inline-block; */
/*    width: 377px; */
/*    height: 49px; */
/*    margin-left: -6px; */
/*    border: 1px solid black; */
/*    border-width: 0px 0px 0px 1px; */
/*    border-radius: 0px 3px 3px 0px; */
/* } */

/* .box:focus { */
/*    outline: none; */
/* } */

/* textarea { */
/*    resize: none; */
/*    height: 200px; */
/*    border: 1px solid black; */
/*    width: 1094px; */
/*    height: 300px; */
/*    font-size: 18px; */
/* } */

/* textarea:focus { */
/*    outline: none; */
/* } */

.subbox {
   height: 50px;
   margin-bottom: 50px;
   text-align: center;
}
/* .back{display:block;} */
.sub, .back {
/*    width: 300px; */
/*    height: 50px; */
   width: 150px;
   height: 40px;
   font-size: 20px;
   color: white;
   border-style: none;
   border: none;
   border-radius: 5px;
   background-color: #a0a2a4;
}


/* .back { */
/*    padding: 11.5px 130px; */
/*    font-size: 20px; */
/*    color: white; */
/*    border-style: none; */
/*    border-radius: 5px; */
/*    background-color: #a0a2a4; */
/*    text-decoration: none; */
/* } */

/* div#all { */
/*    width: 1100px; */
/*    margin: 0 500px; */
/* } */


body{margin: 0;}
         div#all { 
             width: 50%; 
             margin: 0 auto; 
             padding-left: 70px;
             text-align: center;
         } 
         #formBox{
          	box-sizing: border;
          	font-size: 14px;
         }
         label{
         	border: 3px solid #ccc;
         	border-radius: 5px 0 0 5px;
/*          	border-right: 3px solid gray; */
         	width: 100px;
         	height: 30px;
         	line-height: 30px;
         	text-align: center;
         	padding: 3px 0;
         	background-color: #ccc;
         }
         #lecture_name_label{
         	width: 95px;
         	margin-bottom: 14px;
         }
         
         
         input[type=text], input[type=number]{
         	width: 90%;
         	height: 30px;
         	border: 3px solid #ccc;
         	border-left: none;
         	border-radius: 0 5px 5px 0;
         	outline: none;
         	box-sizing: border;
         	padding: 3px 6px;
         }
         
         #LECTURE_NAME{
         	width: 100%;
         }
         
         select{
         	border: 3px solid #ccc;
         	border-radius: 0 5px 5px 0;
         	border-left: none;
         	width: 90%;
         	height: 42px;
         	box-sizing: border;
         	padding: 3px 0;
         }
         .tie_two{
         	display: flex;
          	justify-content: space-between;
          	margin: -5px 0;
         }
         .tie{
         	display: flex;
         	width: 100%;
         }
         .tie_left{
         	margin-right: 10px;
         }
         
         h1{
         	font-size: 2.5rem;
         	text-align: center;
         	padding: 15px;
         }
         textarea{
         width: 100%;
         height: 150px;
         resize: none;
         }
         #plan{
         display: block;
         width: 100%;
         border: 4px solid #ccc;
         border-radius: 5px 5px 0 0;
         }
         
         .back{text-decoration: none;}
         .sub:hover{ cursor: pointer; }
         
         input[type=submit]:hover{
         background-color: lightblue;
         }
         .back:hover{
         cursor: pointer;
          background-color: #FFC0CB;
/*          background-color: RED; */
         color: white;
         }




</style>
</head>

<body>
   <section id="joinformArea">

      <div id="all">
         <h1>강의 수정</h1>
         <form name="modifyform" action="lecture_modify_confirm.lms"
            method="post">

            <div class="tie">
                  <label id="lecture_name_label" for="LECTURE_NAME">강의명 </label>
                  <input type="text" name="LECTURE_NAME" id="LECTURE_NAME" value="<%=lecture.getLecture_name()%>">
            </div>
            <br>

            <div class="tie_two">
	           <div class="tie tie_left">
	                <label for="LECTURE_NO">강의 코드 </label>
	                <input type="number" name="LECTURE_NO" id="LECTURE_NO" class="two" value="<%=lecture.getLecture_no()%>" readonly>
	           </div>
	                <div class="tie">
                    <label for="LECTURE_PRO">교수명 </label>
                    <input type="text" name="LECTURE_PRO" id="LECTURE_PRO" class="two" value="<%=lecture.getLecture_pro()%>">
                	</div>
             </div>
            
            <br> <br>
            
            <div class="tie_two">
               <div class="tie tie_left">
                  <label for="LECTURE_GRADE">학년</label>
                  <select name="LECTURE_GRADE" class="box">
                    <option value="<%=lecture.getLecture_grade()%>">기존값 : <%=lecture.getLecture_grade()%>
                    <option value="01">1학년</option>
                    <option value="02">2학년</option>
                    <option value="03">3학년</option>
                    <option value="04">4학년</option>
                  </select>
                </div>
                <div class="tie">
                    <label for="LECTURE_DEP">학과 </label>
                    <input type="text" name="LECTURE_DEP" id="LECTURE_DEP" class="two" value="<%=lecture.getLecture_dep()%>">
                </div>
             </div>
            
            <br> <br>

            <div class="tie_two">
                	<div class="tie tie_left">
                    <label for="LECTURE_CATEGORY">이수 구분</label>
                    <select name="LECTURE_CATEGORY" class="box">
                    	<option value="<%=lecture.getLecture_category()%>">기존값 : <%=lecture.getLecture_category()%> </option>
						<option value="전공">전공필수</option>
						<option value="교양">전공선택</option>
						<option value="교양">교양필수</option>
						<option value="교양">교양선택</option>
                    </select>
                    </div>
                    <div class="tie">
                    <label for="LECTURE_SCORE">학점</label>
                    <select name="LECTURE_SCORE" class="box">
                    	<option value="<%=lecture.getLecture_score()%>">기존값 : <%=lecture.getLecture_score()%> </option>
                        <option value="01">1학점</option>
                        <option value="02">2학점</option>
                        <option value="03">3학점</option>
                    </select>
                    </div>
                </div>
            
            <br> <br>

			<div class="tie_two">
                	<div class="tie tie_left">
                    <label for="LECTURE_NOP">수강 인원 </label>
                    <input type="number" name="LECTURE_NOP" id="LECTURE_NOP"
                     class="two" value="<%=lecture.getLecture_nop()%>">
                    </div>
                    <div class="tie">
                    <label for="LECTURE_TIME">강의 시간</label>
                    <select name="LECTURE_TIME" class="box">
                    	<option value="<%=lecture.getLecture_time()%>">기존값 : <%=lecture.getLecture_time()%> </option>
                        <option value="1시간">1시간</option>
                        <option value="2시간">2시간</option>
                        <option value="3시간">3시간</option>
                        <option value="4시간">4시간</option>
                    </select>
                    </div>
                </div>
            
            <br> <br>
            
            <div class="tie_two">
                	<div class="tie tie_left">
                    <label for="LECTURE_SEMESTER">학기</label>
                    <select name="LECTURE_SEMESTER" class="box">
						<option value="1학기" selected="selected">1학기</option>
						<option value="2학기">2학기</option>
                        <option value="여름방학">여름방학</option>
                        <option value="겨울방학">겨울방학</option>
                    </select>
                    </div>
                    <div class="tie">
                    <label for="LECTURE_CP">강의실 </label>
                    <input type="text" name="LECTURE_CP" id="LECTURE_CP" class="two" value="<%=lecture.getLecture_cp()%>">
                	</div>
                </div>
            
            <br> <br>
            
            <label for="LECTURE_LP" id="plan">강의 계획 </label>
                <textarea name="LECTURE_LP" id="LECTURE_LP"><%=lecture.getLecture_lp()%></textarea>
            
            <br> <br>

            <!--                 <div class="subbox"><input type="submit" class="sub" value="강의등록"></div> -->
            <div class="subbox">
               <input type="submit" class="sub" value="강의 수정">&nbsp;&nbsp;
               <button href="javascript:history.go(-1)" class="back">뒤로</button>
            </div>
         </form>
      </div>


   </section>
</body>

</html>