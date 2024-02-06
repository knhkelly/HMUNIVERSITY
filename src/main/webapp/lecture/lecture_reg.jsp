<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>강의 등록</title>
    <style>
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
         #LECTURE_NAME{
         	width: 100%;
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
         .sub{
         width: 150px;
         height: 40px;
         border: none;
         }
         .sub:hover{ cursor: pointer; }
         input[type=submit]:hover{
         background-color: lightblue;
         }
         input[type=reset]:hover{
          background-color: #FFC0CB;
/*          background-color: RED; */
         color: white;
         }
    </style>
</head>

<body>
    <section id="joinformArea">

        <div id="all">
        <h1>강의 등록</h1>
            <form id="formBox" name="reg_lecture" action="lecture_reg.lms" method="post">

                <div class="tie">
                    <label id="lecture_name_label" for="LECTURE_NAME">강의명 </label>
                    <input type="text" name="LECTURE_NAME" id="LECTURE_NAME" placeholder="강의명을 입력해주세요." required>
                </div>
                <br>
                
                <div class="tie_two">
	                <div class="tie tie_left">
	                    <label for="LECTURE_NO">강의 코드 </label>
	                    <input type="number" name="LECTURE_NO" id="LECTURE_NO" class="two" placeholder="강의 코드를 입력해주세요." required>
	                </div>
	                <div class="tie">
                    <label for="LECTURE_PRO">교수명 </label>
                    <input type="text" name="LECTURE_PRO" id="LECTURE_PRO" class="two" placeholder="교수명을 입력해주세요.." required>
                	</div>
                </div>
                
                <br><br>

                <div class="tie_two">
                	<div class="tie tie_left">
                    <label for="LECTURE_GRADE">학년</label>
                    <select name="LECTURE_GRADE" class="box">
                        <option value="01" selected="selected">1학년</option>
                        <option value="02">2학년</option>
                        <option value="03">3학년</option>
                        <option value="04">4학년</option>
                    </select>
                    </div>
                    <div class="tie">
                    <label for="LECTURE_DEP">학과 </label>
                    <input type="text" name="LECTURE_DEP" id="LECTURE_DEP" class="two" placeholder="학과를 입력해주세요." required>
                	</div>
                </div>
                
                <br><br>

                <div class="tie_two">
                	<div class="tie tie_left">
                    <label for="LECTURE_CATEGORY">이수 구분</label>
                    <select name="LECTURE_CATEGORY" class="box">
						<option value="전공" selected="selected">전공필수</option>
						<option value="교양">전공선택</option>
						<option value="교양">교양필수</option>
						<option value="교양">교양선택</option>
                    </select>
                    </div>
                    <div class="tie">
                    <label for="LECTURE_SCORE">학점</label>
                    <select name="LECTURE_SCORE" class="box">
                        <option value="01" selected="selected">1학점</option>
                        <option value="02">2학점</option>
                        <option value="03">3학점</option>
                    </select>
                    </div>
                </div>
                
                <br><br>

                <div class="tie_two">
                	<div class="tie tie_left">
                    <label for="LECTURE_NOP">수강 인원 </label>
                    <input type="number" name="LECTURE_NOP" id="LECTURE_NOP" class="two" placeholder="수강 인원을 입력해주세요." required>
                    </div>
                    <div class="tie">
                    <label for="LECTURE_TIME">강의 시간</label>
                    <select name="LECTURE_TIME" class="box">
                        <option value="1시간" selected="selected">1시간</option>
                        <option value="2시간">2시간</option>
                        <option value="3시간">3시간</option>
                        <option value="4시간">4시간</option>
                    </select>
                    </div>
                </div>

                <br><br>

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
                    <input type="text" name="LECTURE_CP" id="LECTURE_CP" class="two" placeholder="강의실을 입력해주세요." required>
                	</div>
                </div>  

                <br><br>
                
                <label for="LECTURE_LP" id="plan">강의 계획 </label>
                <textarea name="LECTURE_LP" id="LECTURE_LP" placeholder="강의 계획을 입력해주세요."></textarea>

                <br><br>

                <input type="submit" class="sub" value="강의등록">
                <input type="reset" class="sub" value="다시쓰기">
            </form>
        </div>


    </section>
</body>

</html>