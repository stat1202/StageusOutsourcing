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
    String clickteam_name = "";
    int compare = 1;
    try{
        clickteam_idx = Integer.parseInt(request.getParameter("clickteam_idx"));
        clickteam_name = request.getParameter("clickteam_name");
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
    String sql_s = "SELECT * FROM schedule WHERE idx = ? ORDER BY date ASC, time ASC;";
    PreparedStatement query_s = connect.prepareStatement(sql_s);
    //자기 자신 일정
    if(compare == 1){
        query_s.setInt(1, user_idx);
    }
    else{
        query_s.setInt(1, clickteam_idx);
    }
    ResultSet result_s = query_s.executeQuery();

    ArrayList s_idx_al = new ArrayList();
    ArrayList schedule_al = new ArrayList();
    ArrayList date_al = new ArrayList();
    ArrayList time_al = new ArrayList();
    ArrayList user_idx_al = new ArrayList();
    while(result_s.next()){
        user_idx_al.add(result_s.getInt("idx"));
        s_idx_al.add(result_s.getInt("s_idx"));
        schedule_al.add( "\""+ result_s.getString("schedule") + "\"");
        date_al.add("\""+  result_s.getString("date") + "\"");
        time_al.add("\""+  result_s.getString("time") + "\"");
    }

    //
    String cur_month = request.getParameter("month_value");
    String cur_year = request.getParameter("year_value");
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
        <form id="header_middle" action="../jsp/scheduleAddAction.jsp">
            <input type="text" class="input" name="schedule" maxlength="20">
            <input type="date" class="input" name="date">
            <input type="time" class="input" name="time">
            <input type="submit" value="입력" class="btn" id="schedule_add">
        </form>
        <div>
            <input type="button" value="일정 입력" id="mobile_middle_btn">
        </div>
        <form id="header_right" action="../jsp/logoutAction.jsp">
            <p id="teammate">
                <%=clickteam_name%>의 일정
            </p>
            <p id="profile" onclick="location.href='./mainPage.jsp'">
                <%=name%>님
            </p>
            <input type="submit" id="Log-out" value="Log-out">
        </form>
        
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
            <p id="month"></p>
            <input type="text" value = "" name="clickteam_name" id="clickteam_name">
            <input type="text" value = "" name="clickteam_idx" id="clickteam_idx">
            <input type="text" id="month_value" name="month_value">
            <input type="text" id="year_value" name="year_value">
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
                var tmp_namevalue = document.createElement("input")

                tmp_form.action="../page/mainPage.jsp"
                tmp_name.type = "submit"
                tmp_name.className = "teammate"
                tmp_name.value = team[0][i]
                tmp_namevalue.className ="idx_hidden"
                tmp_namevalue.name = "clickteam_name"
                tmp_namevalue.value= team[0][i]
                tmp_idx.className ="idx_hidden"
                tmp_idx.name = "clickteam_idx"
                tmp_idx.value= team[1][i]
                
                tmp_form.appendChild(tmp_name)
                tmp_form.appendChild(tmp_namevalue)
                tmp_form.appendChild(tmp_idx)
                nav_bottom.appendChild(tmp_form)
                console.log(tmp_namevalue.value)
            }
            
        }
        //팀원 목록 클릭 시 입력 창 안보임
        var compare = <%=compare%>

        if(compare == 0){
            document.getElementById("header_middle").style.display = "none"
            document.getElementById("mobile_middle_btn").style.display = "none"
        }
        else{
            document.getElementById("teammate").style.display = "none"
        }
        
        //로그인 안할 시 페이지 막음
        if(user_idx == 0){
            alert("로그인 후 이용할 수 있습니다")
            location.href = "../../loginPage.html"
        }
        var s_idx = <%=s_idx_al%>
        var schedule_al = <%=schedule_al%>
        var date_al = <%=date_al%>
        var time_al = <%=time_al%>
        var user_idx_al = <%=user_idx_al%>
        var s_year = []
        var s_month = []
        var s_date = []

        for(i = 0 ; i < date_al.length; i ++){
            var date_split = date_al[i].split("-")

            s_year.push(date_split[0] )
            s_month.push( date_split[1] )
            s_date.push(date_split[2] ) 
        }

        //달력 출력 
        function printSchedule(){
            for(var i = 0; i < s_year.length; i++){
            if(s_year[i] == year && parseInt(s_month[i]) == (month +1)){
                //일정 출력 요소 만들기
                var tmp_form = document.getElementById(s_date[i])
                var tmp_time = document.createElement("p")
                tmp_time.className = "time"
                tmp_time.innerHTML = time_al[i]

                // console.log(tmp_time)
                var tmp_promise = document.createElement("div")
                tmp_promise.className = "promise"

                var tmp_promise_left = document.createElement("promise_left")
                tmp_promise_left.className = "promise_left"

                var tmp_schedule = document.createElement("p")
                tmp_schedule.innerHTML = schedule_al[i]
                tmp_schedule.className="schedule"
                // console.log(tmp_schedule)

                var tmp_hidden = document.createElement("div")
                tmp_hidden.className="update_hidden"
                
                var tmp_updatetext = document.createElement("input")
                tmp_updatetext.className = "update_text"
                tmp_updatetext.value = schedule_al[i]
                tmp_updatetext.name = "update_text"

                var tmp_idx = document.createElement("input")
                tmp_idx.value = s_idx[i]
                tmp_idx.style.display = "none"
                tmp_idx.name ="s_idx"
                
                var tmp_year = document.createElement("input")
                tmp_year.value = cur_year
                tmp_year.style.display = "none"
                tmp_year.name = "year_value"
                tmp_year.className = "year_value"

                var tmp_month = document.createElement("input")
                tmp_month.value = cur_month
                tmp_month.style.display = "none"
                tmp_month.name = "month_value"

                var tmp_user = document.createElement("input")
                tmp_user.value = user_idx_al[i]
                tmp_user.style.display = "none"
                tmp_user.name = "u_idx"

                var tmp_ok = document.createElement("input")
                tmp_ok.setAttribute("type", "submit")
                tmp_ok.value = "확인"
                tmp_ok.className = "ok_btn"
                
                tmp_ok.addEventListener("click",ok_scheduleClick)

                tmp_hidden.appendChild(tmp_month)
                tmp_hidden.appendChild(tmp_year)
                tmp_hidden.appendChild(tmp_user)
                tmp_hidden.appendChild(tmp_idx)
                tmp_hidden.appendChild(tmp_updatetext)
                tmp_hidden.appendChild(tmp_ok)

                tmp_promise_left.appendChild(tmp_schedule)
                tmp_promise_left.appendChild(tmp_hidden)

                // console.log(tmp_promise_left)
                // 수정 삭제 버튼 추가

                var tmp_promise_right = document.createElement("div")
                tmp_promise_right.className = "promise_right"

                var tmp_update = document.createElement("input")
                tmp_update.setAttribute("type", "button")
                tmp_update.value ="수정"
                tmp_update.className="update_btn"
                tmp_update.addEventListener("click", update_scheduleClick)

                var tmp_delete = document.createElement("input")
                tmp_delete.setAttribute("type", "submit")
                tmp_delete.value ="삭제"
                tmp_delete.className= "delete_btn"
                tmp_delete.addEventListener("click", delete_scheduleClick)

                if(compare == 0){
                    tmp_update.style.display = "none";
                    tmp_delete.style.display = "none";
                    tmp_schedule.style.width = "170px";
                }

                tmp_promise_right.appendChild(tmp_update)
                tmp_promise_right.appendChild(tmp_delete)

                tmp_promise.appendChild(tmp_promise_left)
                tmp_promise.appendChild(tmp_promise_right)

                // tmp_schedule_main.appendChild(tmp_time)
                // tmp_schedule_main.appendChild(tmp_promise)
                tmp_form.appendChild(tmp_time)
                tmp_form.appendChild(tmp_promise)
                }
            }
        }

        function printCalendar(){
            monthName.innerHTML = month_names[month]
            monthValue.value = month+1
            
            yearValue.value = year
            var schedule_div = document.getElementById("schedule_div")
            for(var i = 0; i < num_day; i++){
                var tmpdate = document.createElement('p')
                tmpdate.setAttribute('class','day')
            
                tmpdate.innerHTML = (i+1) + "일"
            
                var tmpday = new Date(year, month, i+1).getDay()
                if(tmpday== '6'){
                    tmpdate.style.color = 'blue'
                }
                if(tmpday=='0'){
                    tmpdate.style.color = 'red'
                }
                
                var tmpdiv = document.createElement("div")
                tmpdiv.className = "schedule_all"


                var tmpform = document.createElement('form')
                tmpform.setAttribute("class", "schedule_form")
                if( i < 10){
                    tmpform.id = "0" + (i+1)
                }else{
                    tmpform.id= i+1
                }
                
                tmpdiv.appendChild(tmpdate)
                tmpdiv.appendChild(tmpform)
            
                schedule_div.appendChild(tmpdiv)
            }
            printSchedule()
            
        }

        function rightArrowClick(){
            var schedule_div = document.getElementById("schedule_div")
            if(month < 11 ){
                month += 1
            }
            else if( month >= 11){
                month = month - 12 + 1
                year += 1
            }
            num_day = new Date( year, month+1, 0).getDate()
            console.log(month)
            while(schedule_div.hasChildNodes()){
                schedule_div.removeChild(schedule_div.firstChild)
            }
            printCalendar()

            var clickteam_name = document.getElementById("clickteam_name")
            var clickteam_idx = document.getElementById("clickteam_idx")

            if( compare == 1){
                clickteam_name.value = "<%=name%>"
                clickteam_idx.value = "<%=user_idx%>"
            }
            else{
                clickteam_name.value = "<%=clickteam_name%>"
                clickteam_idx.value = "<%=clickteam_idx%>"
            }
            document.getElementById("month_form").submit()
        }

        function leftArrowClick(){
            var schedule_div = document.getElementById("schedule_div")
            if(month <= 11 && month > 0){
                month -=1
            }
            else if(month <= 0){
                month = month + 12 - 1
                year -= 1
            }
            
            console.log(month)
            num_day = new Date( year, month-1, 0).getDate()

            while(schedule_div.hasChildNodes()){
                schedule_div.removeChild(schedule_div.firstChild)
            }
            printCalendar()
            
            var clickteam_name = document.getElementById("clickteam_name")
            var clickteam_idx = document.getElementById("clickteam_idx")

            if( compare == 1){
                clickteam_name.value = "<%=name%>"
                clickteam_idx.value = "<%=user_idx%>"
            }
            else{
                clickteam_name.value = "<%=clickteam_name%>"
                clickteam_idx.value = "<%=clickteam_idx%>"
            }
            document.getElementById("month_form").submit()
        }

        // 달력 만들기
        var cur_month = <%=cur_month%>
        var cur_year = <%=cur_year%>
        
        if(cur_month == null && cur_year == null){
            today = new Date()
            year = today.getFullYear()
            month = today.getMonth()
            cur_month = month+1
            cur_year = year
        }
        else{
            year = cur_year
            month = cur_month-1
        }
        //0 - 1월 11 - 12월
        console.log(cur_month)
        console.log(cur_year )
        var month_names = ['Jan', 'Feb', "Mar", "Apr", "May","June", "July", "Aug", "Sep","Oct","Nov","Dec"]

        var num_day = new Date( year, month+1, 0).getDate()

        var monthName = document.getElementById("month")
        var monthValue = document.getElementById("month_value")
        var yearValue = document.getElementById("year_value")
        //달력 버튼  기능 추가
        var arrow = document.getElementsByClassName("arrow")

        arrow[1].addEventListener("click", rightArrowClick)
        arrow[0].addEventListener("click", leftArrowClick)
        printCalendar()
    </script>
</body>
</html>