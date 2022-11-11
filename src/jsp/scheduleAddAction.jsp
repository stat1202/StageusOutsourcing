<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
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
    //session 불러오기
    int user_idx = 0;
    try{
        user_idx = (int)session.getAttribute("user_idx");
    }
    catch(Exception e){
        user_idx = 0;
    }

    //일정 불러오기 
    String schedule = request.getParameter("schedule");
    String date = request.getParameter("date");
    String time = request.getParameter("time");

    if(user_idx != 0 ){
        //공백이 아니면 데이터 넣기
        if( schedule != "" && date != "" && time != "" && schedule.length() <= 20 ){
            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","stageus","1234");
        
            //유저 정보 가져오기
            String sql = "INSERT INTO schedule (schedule, date, time, idx) VALUES (?,?,?,?); ";
        
            PreparedStatement query = connect.prepareStatement(sql);
        
            query.setString(1, schedule);
            query.setString(2, date);
            query.setString(3, time);
            query.setInt(4, user_idx);
            
            query.executeUpdate();    
        }
        
    }
    

%>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <script>
        alert("일정 추가 성공!")
        location.href ="../page/mainPage.jsp"
    </script>
</body>
</html>