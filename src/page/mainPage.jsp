<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Connector 파일 찾아오는 라이브러리 -->
<%@ page import="java.sql.DriverManager" %>
<!-- 데이터베이스에 연결하는 라이브러리 -->
<%@ page import="java.sql.Connection"%>
<!-- SQL문을 만들어주는 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList"%>

<%
    request.setCharacterEncoding("utf-8");
    int user_idx = 0;
    try{
        user_idx = (int)session.getAttribute("user_idx");
    }
    catch(Exception e){
        user_idx = 0;
    }

    String name = "";
    if(user_idx != 0 ){
        Class.forName("com.mysql.jdbc.Driver");
        Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","stageus","1234");
    
        //유저 정보 가져오기
        String sql = "SELECT * FROM user WHERE idx = ?; ";
    
        PreparedStatement query = connect.prepareStatement(sql);
    
        query.setInt(1, user_idx);
    
        ResultSet result = query.executeQuery();
        
        result.next();
        name = result.getString("name");
    }
    
    

%>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MySchedule</title>
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
        <p id="header_right">
            <%=name%>님의 일정
        </p>
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
            <p class="nav_option" onclick="location.href='./userinfoPage.jsp'">
                내 정보
            </p>
        </div>
        
        <div id="nav_bottom">
            <p class="nav_option"> 
                팀원들
            </p>
            <p class="nav_option teammate" onclick="location.href='./mateSchedulePage.jsp'">
                팀원1
            </p >
            <p class="nav_option teammate" onclick="location.href='./mateSchedulePage.jsp'">
                팀원2
            </p>
        </div>
    </nav>
    <main>
        <div id="month_form">
            <input type="button" value="<" class="arrow">
            <p id="month">Jan</p>
            <input type="button" value=">" class="arrow">
        </div>
        <div id="schedule_div">
            <!-- <form action="" class="schedule_form">
                <p class="day">
                    1일
                </p>
                <p class="time">
                    오후 3:00
                </p>
                <div class="promise">
                    <div class="promise_left">
                        <p>
                            일하기sdasdsdsdsdsdsds
                        </p>
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
    <script src="../js/mainPage.js">
    </script>
    <script>
        console.log("<%=name%>")
        console.log("<%=user_idx%>")
        
        var user_idx = <%=user_idx%>

        if(user_idx == 0){
            alert("로그인 후 이용할 수 있습니다")
            history.back()
        }
    </script>
</body>
</html>