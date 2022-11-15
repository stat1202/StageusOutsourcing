<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!-- Connector 파일 찾아오는 라이브러리 -->
<%@ page import="java.sql.DriverManager" %>

<!-- 데이터베이스에 연결하는 라이브러리 -->
<%@ page import="java.sql.Connection"%>

<!-- SQL문을 만들어주는 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>

<%
    session.invalidate();
%>

<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    로그아웃
    <script>
        // alert("로그아웃 되었습니다.")
        location.href='../../loginPage.html'
    </script>
</body>
</html>