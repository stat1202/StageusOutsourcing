<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MySchedule</title>
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/mainPage.css">
</head>
<body>
    <header>
        <div>
            <input type="image" src="../img/menu.png" alt="" id="menu_icon">
        </div>
        <form id="header_middle">
            <input type="text" class="input">
            <input type="date" class="input">
            <input type="time" class="input">
            <input type="button" value="입력" class="btn">
        </form>
        <div>
            <input type="button" value="일정 입력" id="mobile_middle_btn">
        </div>
        <div id="header_right">
            사용자님의 일정
        </div>
    </header>
    <div id="mobile_input">
        <form id="mobile_middle">
            <input type="text" class="input"> <br>
            <input type="date" class="input">
            <input type="time" class="input">
            <input type="button" value="입력" class="btn">
        </form>
    </div>
    <nav>
        <div id="nav_top">
            <div class="nav_option" onclick="location.href='./userinfoPage.jsp'">
                내 정보
            </div>
        </div>
        
        <div id="nav_bottom">
            <div class="nav_option"> 
                팀원들
            </div>
            <div class="nav_option teammate" onclick="location.href='./mateSchedulePage.jsp'">
                팀원1
            </div >
            <div class="nav_option teammate" onclick="location.href='./mateSchedulePage.jsp'">
                팀원2
            </div>
        </div>
    </nav>
    <main>
        <div id="month_form">
            <input type="button" value="<" class="arrow">
            <div id="month">Jan</div>
            <input type="button" value=">" class="arrow">
        </div>
        <div id="schedule_div">
            <!-- <form action="" class="schedule_form">
                <div class="day">
                    1일
                </div>
                <div class="time">
                    오후 3:00
                </div>
                <div class="promise">
                    <div class="promise_left">
                        <div>
                            일하기sdasdsdsdsdsdsds
                        </div>
                        <div class="update_hidden">
                            <input type="text" id="update_text" value="일하기sdasdsdsdsdsdsds">
                            <input type="button" value="확인" class="ok_btn">
                        </div>
                    </div>
                    <div class="promise_right">
                        <input type="button" value="수정" class="update_btn">
                        <input type="button" value="삭제" class="delete_btn">
                    </div>
                </div>
                
                <div class="time">
                    오후 5:30
                </div>
                <div class="promise">
                    <div class="promise_left">
                        <div>
                            일하기sda
                        </div>
                        <div class="update_hidden">
                            <input type="text" id="update_text" value="일하기sdasdsdsdsdsdsds">
                            <input type="button" value="확인" class="ok_btn">
                        </div>
                    </div>
                    <div class="promise_right">
                        <input type="button" value="수정" class="update_btn">
                        <input type="button" value="삭제" class="delete_btn">
                    </div>
                </div>
            </form> -->
        </div>
    </main>
    <script src="../js/mainPage.js"></script>
</body>
</html>