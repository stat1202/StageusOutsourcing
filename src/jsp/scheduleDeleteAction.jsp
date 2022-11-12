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

    int s_idx = Integer.parseInt(request.getParameter("s_idx"));
    int u_idx = Integer.parseInt(request.getParameter("u_idx"));
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","stageus","1234");

    //유저 정보 삭제
    int bool = 0;
    if( user_idx == u_idx ){
        bool = 1;
        String sql = "DELETE FROM schedule WHERE s_idx = ?; ";
        PreparedStatement query = connect.prepareStatement(sql);
        
        query.setInt(1, s_idx);
        
        query.executeUpdate();    
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
        var bool = <%=bool%>
        if(bool ==1){
            alert("일정 삭제!")
            location.href ="../page/mainPage.jsp"
        }
        else{
            alert("삭제 권한이 없습니다.")
            location.href ="../page/mainPage.jsp"
        }
        
    </script>
</body>
</html>