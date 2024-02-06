<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 캘린더 */
.calendar {
   font-family: Arial, sans-serif;
   border-collapse: collapse;
   width: 300px;
}

.calendar th, .calendar td {
   border: 1px solid #ddd;
   text-align: center;
   padding: 5px;
}

.calendar th {
   background-color: #f2f2f2;
}

.calendar td:hover {
   background-color: #e0e0e0;
}

.group_calendar {
/*    margin-left: 20px; */
   margin-top: 20px;
}

.currentMonthYear {
   text-align: center;
}
 /* 오늘 날짜에 대한 스타일 추가 */
        .calendar td.today {
            background-color: lightblue;
        }

table.calendar{
	margin: 0 auto;
}

</style>
</head>
<body>
	<div class="group_calendar">
                   <h1 id="currentMonthYear">월간 달력</h1>
    <table class="calendar">
        <tr>
            <th>일</th>
            <th>월</th>
            <th>화</th>
            <th>수</th>
            <th>목</th>
            <th>금</th>
            <th>토</th>
        </tr>
        <!-- 달력 내용은 JavaScript로 생성됩니다. -->
    </table>
	</div>
	
	<script>
        // JavaScript로 월간 달력 생성
        function generateCalendar(year, month) {
            const table = document.querySelector('.calendar');
            const currentMonthYear = document.getElementById('currentMonthYear');
            const firstDay = new Date(year, month, 1);
            const lastDay = new Date(year, month + 1, 0);
            const daysInMonth = lastDay.getDate();
            const startingDay = firstDay.getDay();

            // 현재 년도와 월 표시
            const monthNames = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
            currentMonthYear.textContent = year + '년' + ' ' + monthNames[month];

            let day = 1;
            const currentDate = new Date();
            const currentYear = currentDate.getFullYear();
            const currentMonth = currentDate.getMonth();
            const currentDay = currentDate.getDate();

            for (let i = 0; i < 5; i++) {
                const row = table.insertRow(-1);
                for (let j = 0; j < 7; j++) {
                    const cell = row.insertCell(-1);
                    if (i === 0 && j < startingDay) {
                        // 이번 달 시작일 이전의 빈 셀
                    } else if (day <= daysInMonth) {
                        cell.textContent = day;
                        day++;

                        // 날짜 셀에 오늘인지 확인하고 스타일 적용
                        if (year === currentYear && month === currentMonth && day - 1 === currentDay) {
                            cell.classList.add('today');
                        }
                    } else {
                        // 이번 달 마지막일 이후의 빈 셀
                    }
                }
            }
        }

        // 현재 날짜 가져오기
        const currentDate = new Date();
        const currentYear = currentDate.getFullYear();
        const currentMonth = currentDate.getMonth();

        // 페이지 로드 시 초기 달력 생성
        generateCalendar(currentYear, currentMonth);
    </script>
	
</body>
</html>