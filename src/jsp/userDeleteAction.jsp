<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<!-- Connector 파일 찾아오는 라이브러리 -->
<%@ page import="java.sql.DriverManager" %>

<!-- 데이터베이스에 연결하는 라이브러리 -->
<%@ page import="java.sql.Connection"%>

<!-- SQL문을 만들어주는 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>

<%@ page import="java.util.ArrayList"%>

<%@ page import="java.util.regex.Pattern"%>
<%
    request.setCharacterEncoding("utf-8");
    //session 없으면0 있으면 받아오기

    int user_idx = 0;
    try{
        user_idx = (int)session.getAttribute("user_idx");
    }
    catch(Exception e){
        user_idx = 0;
    }

    if(user_idx != 0){
        Class.forName("com.mysql.jdbc.Driver");
        Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","stageus","1234");

        //유저 정보 수정
        String sql = "DELETE FROM user WHERE idx = ?; ";

        PreparedStatement query = connect.prepareStatement(sql);
        query.setInt(1, user_idx);                
        //쿼리 문 전송
        query.executeUpdate();
        session.invalidate();

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
        alert("삭제가 완료되었습니다.")
        location.href="../../loginPage.html"
    </script>
</body>
</html>