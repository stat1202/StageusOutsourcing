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

    String update_text = request.getParameter("update_text");
    String update_time = request.getParameter("update_time");
    int s_idx = Integer.parseInt(request.getParameter("s_idx"));
    int u_idx = Integer.parseInt(request.getParameter("u_idx"));

    int bool = 1;
    if( user_idx == u_idx){
        bool = 1;
        if( update_text != "" && update_text.length() <= 20 ){
            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","stageus","1234");
        
            //유저 정보 가져오기
            String sql = "UPDATE schedule SET schedule = ?, time = ? WHERE s_idx = ?; ";
            PreparedStatement query = connect.prepareStatement(sql);
        
            query.setString(1, update_text);
            query.setString(2, update_time);
            query.setInt(3, s_idx);
            
            query.executeUpdate();    
        }
    }
    else{
        bool = 0;
    }
    int month_value = Integer.parseInt(request.getParameter("month_value"));
    int year_value = Integer.parseInt(request.getParameter("year_value"));  
    
    
    
%>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    일정 수정 액션
    <%=update_time%>
    <%=s_idx%>
    <%=update_text%>
    <script>
        var bool = <%=bool%>
        if(bool==1){
            // alert("일정 수정 완료!")
            location.href ="../page/mainPage.jsp?month_value=" + "<%=month_value%>" +"&year_value=" + "<%=year_value%>"
        }
        else{
            alert("수정 권한이 없습니다..")
            location.href ="../page/mainPage.jsp?month_value=" + "<%=month_value%>" +"&year_value=" + "<%=year_value%>"
        }
    </script>
</body>
</html>