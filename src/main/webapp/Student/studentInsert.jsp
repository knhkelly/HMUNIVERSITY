<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1#title1{font-size: 2.5rem;}
form {
	width: 800px;
	margin: 0 auto;
	padding: 10px;
	text-align: center;
}

input {
	position: relative;
	border-radius: 8px;
	width: 500px;
}

#id:focus, #pwd:focus, #name:focus, #dep:focus, #reg:focus, #add:focus,
	#mail:focus, #phone:focus {
	color: black;
	text-decoration: underline;

}

input#id {
	padding: 12px 60px;
	margin: 8px 0;
	border: 3px solid #ccc;
	outline: none;
}

input#pwd {
	padding: 12px 60px;
	margin: 8px 0;
	border: 3px solid #ccc;
	outline: none;
}

input#name {
	padding: 12px 60px;
	margin: 8px 0;
	border: 3px solid #ccc;
	outline: none;
}

input#dep {
	padding: 12px 60px;
	margin: 8px 0;
	border: 3px solid #ccc;
	outline: none;
}

input#reg {
	padding: 12px 60px;
	margin: 8px 0;
	border: 3px solid #ccc;
	outline: none;
}

input#phone {
	padding: 12px 60px;
	margin: 8px 0;
	border: 3px solid #ccc;
	outline: none;
}

input#add {
	padding: 12px 60px;
	margin: 8px 0;
	border: 3px solid #ccc;
	outline: none;
}

input#mail {
	padding: 12px 60px;
	margin: 8px 0;
	border: 3px solid #ccc;
	outline: none;
}

#id, #name {
	background-image: url('./img/id.png');
	background-repeat: no-repeat;
	background-position: 15px 10px;
	background-size: 20px;
}

#pwd {
	background-image: url('./img/pwd.png');
	background-repeat: no-repeat;
	background-position: 15px 10px;
	background-size: 20px;
}

#dep {
	background-image: url('./img/dep.png');
	background-repeat: no-repeat;
	background-position: 15px 10px;
	background-size: 20px;
}

#reg {
	background-image: url('./img/reg.png');
	background-repeat: no-repeat;
	background-position: 15px 10px;
	background-size: 20px;
}

#add {
	background-image: url('./img/address.png');
	background-repeat: no-repeat;
	background-position: 15px 10px;
	background-size: 20px;
}

#phone {
	background-image: url('./img/phone.png');
	background-repeat: no-repeat;
	background-position: 15px 10px;
	background-size: 20px;
}

#mail {
	background-image: url('./img/mail.png');
	background-repeat: no-repeat;
	background-position: 15px 10px;
	background-size: 20px;
}

input[type=radio]:checked+label {
	color: forestgreen;
	font-weight: bold;
}

input:hover {
	cursor: pointer;
}


.sbre {
	display: inline;
	padding: 10px;
	margin: 8px 10px;
	border-radius: 8px;
	background-color: lightcuan;
}

div {
	display: block;
}
 input[type=submit],input[type=reset] {
            background-color: #35373a;
            color: white;
            font-weight: bold;
            margin-top: 50px;
            border: none;
            display: inline;    
            width: 200px;
        }
        input[type=radio]+label {
            display: inline-block;
            width: 70px;
            height: 20px;
/*             border: 3px solid #ccc; */
            /* border-radius: 8px; */
        }

        div.choice {
            /* border: 1px solid #ccc; */
            width: 620px;
            height: 39px;
            /* border-radius: 8px; */
            margin: auto;
            display: inline;
        }
        input[type="radio"] {
            display: none;

        }

        .choice input:checked+label {
            outline-style: solid #a0a2a4;
            border-color: #97999b;
            color: white;
            font-weight: bold;
            background-color:  #35373a;
        }



        label{
            padding: 8px 20px;
            margin-top: 6px;
            
        }
        .label_1{

            border-radius: 8px 0 0 8px;
            border-left: 3px solid #ccc;
            border-top: 3px solid #ccc;
            border-bottom: 3px solid #ccc;
            border-right: 1.5px solid #ccc;
        }
		.label_2{
            border-left: 1.5px solid #ccc;
            border-top: 3px solid #ccc;
            border-bottom: 3px solid #ccc;
            border-right: 1.5px solid #ccc;
        }
	
        .label_3{
        	border-left: 1.5px solid #ccc;
            border-top: 3px solid #ccc;
            border-bottom: 3px solid #ccc;
            border-right: 3px solid #ccc;
            border-radius: 0 8px 8px 0;
        }
        div#genderch{
            margin-left: 40px;
        }
</style>
</head>
<body>

	<form action="./Student/studentInsertAction.me" name="Student_Insert1" method="post">
		<h1 id="title1">학생 등록</h1>
		<div class="insertmain">

			<div>
				<input type="text" maxlength="10" name="student_Id" id="id" placeholder="학번을 입력해주세요.(10자리)" required>
			</div>
			<div>
				<input type="text" name="student_Pw" id="pwd" placeholder="비밀번호를 입력해주세요." required>
			</div>
			<div>
				<input type="text" name="student_Name" id="name" placeholder="이름을 입력해주세요." required>
			</div>
			<div>
				<input type="text" name="student_Dep" id="dep" placeholder="학과명을 입력해주세요." required>
			</div>
			<div>
				<input type="text" name="student_Reg" id="reg" maxlength="13" placeholder="주민번호(-)없이 입력해주세요" required>
			</div>
			<div>
				<input type="phone" name="student_Phone" id="phone" maxlength="11"  placeholder="전화번호(-)없이 입력해주세요" required>
			</div>
			<div>
				<input type="text" name="student_Mail" id="mail" placeholder="이메일을 입력해주세요.">
			</div>
			<div>
				<input type="text" name="student_Address" id="add" placeholder="주소를 입력해주세요." required>
			</div>

        <div  class="wrapBox21 flex">
            <div class="choice">
                    <input type="radio" id="statu1" name="student_Statu" value="재학" class="radioHid1" required><label class="label_1" for="statu1">재학</label><input type="radio" id="statu2" name="student_Statu" value="휴학" class="radioHid1"><label class="label_2" for="statu2">휴학</label><input type="radio" id="statu3" name="student_Statu" value="퇴학" class="radioHid1"><label class="label_3" for="statu3">퇴학</label>
            </div>
            <div class="choice" id="genderch">
                    <input type="radio" id="gender1" name="student_Gender" value="남자" class="radioHid" required><label class="label_1" for="gender1" id="lb">남자</label><input type="radio" id="gender2" name="student_Gender" value="여자"  class="radioHid"><label  class="label_3" for="gender2" id="lb">여자</label>
			</div>
        </div>
            <div>
				<input type="submit" class="sbre" value="등록"> <input type="reset" class="sbre" value="다시작성">
			</div>
		</div>
	</form>
</body>
</html>