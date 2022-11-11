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
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","stageus","1234");

    String name = "";
    String dept = "";
    if(user_idx != 0 ){
        //유저 정보 가져오기
        String sql = "SELECT * FROM user WHERE idx = ?; ";
    
        PreparedStatement query = connect.prepareStatement(sql);
    
        query.setInt(1, user_idx);
    
        ResultSet result = query.executeQuery();
        
        result.next();
        name = result.getString("name");
        dept = result.getString("dept");
    }
    
    // 팀원 정보 불러오기
    String sql_team = "SELECT * FROM user WHERE dept = ?;";

    PreparedStatement query_team = connect.prepareStatement(sql_team);

    query_team.setString(1,dept);

    ResultSet result_team = query_team.executeQuery();

    ArrayList team = new ArrayList();
    ArrayList team_name = new ArrayList();
    ArrayList team_idx = new ArrayList();

    while(result_team.next()){
        team_name.add( "\"" + result_team.getString("name") + "\"");
        team_idx.add( result_team.getInt("idx"));
    }
    
    team.add(team_name);
    team.add(team_idx);

    ArrayList team_bool = new ArrayList();
    for( int i = 0; i < team_idx.size(); i++){
        if(team_idx.get(i).equals(user_idx)){
            team_bool.add(1);
        }
        else{
            team_bool.add(0);
        }
    }

    //선택된 idx 와 자기 idx 비교
    int clickteam_idx = 0;
    int compare = 1;
    try{
        clickteam_idx = Integer.parseInt(request.getParameter("clickteam_idx"));
        if(clickteam_idx == user_idx){
            compare = 1;
        }
        else{
            compare = 0;
        }

    }
    catch(Exception e){
    }
    

    //일정 정보 불러오기 s 는 스케쥴 의미
    String sql_s = "SELECT * FROM schedule WHERE idx = ?;";
    PreparedStatement query_s = connect.prepareStatement(sql_s);
    //자기 자신 일정
    if(compare == 1){
        query_s.setInt(1, user_idx);
    }
    else{
        query_s.setInt(1, clickteam_idx);
    }
    ResultSet result_s = query_s.executeQuery();

    ArrayList schedule_al = new ArrayList();
    ArrayList date_al = new ArrayList();
    ArrayList time_al = new ArrayList();

    while(result_s.next()){
        schedule_al.add( "\""+ result_s.getString("schedule") + "\"");
        date_al.add("\""+  result_s.getString("date") + "\"");
        time_al.add("\""+  result_s.getString("time") + "\"");
    }
%>
<script>
    console.log(<%=schedule_al%>)
    console.log(<%=date_al%>)
    console.log(<%=time_al%>)
</script>
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
        <form id="header_middle" action="../jsp/scheduleAddAction.jsp">
            <input type="text" class="input" name="schedule" maxlength="20">
            <input type="date" class="input" name="date">
            <input type="time" class="input" name="time">
            <input type="submit" value="입력" class="btn" id="schedule_add">
        </form>
        <div>
            <input type="button" value="일정 입력" id="mobile_middle_btn">
        </div>
        <p id="header_right" onclick="location.href='./mainPage.jsp'">
            <%=name%>님의 일정
        </p>
    </header>
    <div id="mobile_input">
        <form id="mobile_middle" action="../jsp/scheduleAddAction.jsp">
            <input type="text" class="input" name="schedule"> <br>
            <input type="date" class="input" name="date">
            <input type="time" class="input" name="time">
            <input type="submit" value="입력" class="btn" id="mschedule_add">
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
            <!-- <p class="nav_option teammate" onclick="location.href='./mateSchedulePage.jsp'">
                팀원1
            </p >
            <p class="nav_option teammate" onclick="location.href='./mateSchedulePage.jsp'">
                팀원2
            </p> -->
            <!-- <form action="" class="nav_option teammate">
                <input type="text" value = "<%=team_idx%>" >
                <input type="submit" value= "team[0]" >
            </form> -->
        </div>
    </nav>
    <main>
        <form id="month_form" action="./mainPage.jsp">
            <input type="button" value="<" class="arrow">
            <p id="month">Jan</p>
            <input type="button" value=">" class="arrow">
        </form>
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
        var user_idx = <%=user_idx%>
        console.log("<%=name%>")
        console.log("<%=user_idx%>")
        var team = <%=team%>
        var team_bool = <%=team_bool%>
        //팀원 목록 출력
        var nav_bottom = document.getElementById("nav_bottom")
        //자신을 제외하고 출력
        for(var i=0; i< team[0].length; i++){
            if(team_bool[i] != 1){
                var tmp_form = document.createElement("form")
                var tmp_idx = document.createElement('input')
                var tmp_name = document.createElement("input")

                tmp_form.action="../page/mainPage.jsp"
                tmp_name.type = "submit"
                tmp_name.className = "teammate"
                tmp_name.value = team[0][i]
                tmp_idx.className ="idx_hidden"
                tmp_idx.name = "clickteam_idx"
                tmp_idx.value= team[1][i]
                tmp_form.appendChild(tmp_name)
                tmp_form.appendChild(tmp_idx)
                nav_bottom.appendChild(tmp_form)
            }
            
        }
        //팀원 목록 클릭 시 입력 창 안보임
        var compare = <%=compare%>

        if(compare == 0){
            document.getElementById("header_middle").style.display = "none"
            document.getElementById("mobile_middle_btn").style.display = "none"
        }
        
        //로그인 안할 시 페이지 막음
        if(user_idx == 0){
            alert("로그인 후 이용할 수 있습니다")
            history.back()
        }

        var schedule_al = <%=schedule_al%>
        var date_al = <%=date_al%>
        var time_al = <%=time_al%>

        var s_year = []
        var s_month = []
        var s_date = []

        for(i = 0 ; i < date_al.length; i ++){
            var date_split = date_al[i].split("-")

            s_year.push(date_split[0] )
            s_month.push( date_split[1] )
            s_date.push(date_split[2] ) 
        }

        for(var i = 0; i < s_year.length; i++){
            if(s_year[i] == year && parseInt(s_month) == (month +1)){
                //달력 출력 미완
            }
        }

    </script>
</body>
</html>