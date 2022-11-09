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

    //회원가입 창 값 받아오기
    String email = request.getParameter("email");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String hp = request.getParameter("hp");
    String dept = request.getParameter("Department");

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","stageus","1234");
    //중복 체크
    String sql = "SELECT email FROM user;";

    PreparedStatement query = connect.prepareStatement(sql);
    //query.setString(1, email);
    ResultSet result = query.executeQuery();
    //
    int bool = 0;
    while(result.next()){
        if(result.getString("email").equals(email) ){
            bool = 1;
        }
    }


    if(bool == 0){
        //데이터 넣기
        String sql_insert = "INSERT INTO user (email, password, name, hp, dept) VALUES (?,?,?,?,?);";

        PreparedStatement query_insert = connect.prepareStatement(sql_insert);
        query_insert.setString(1, email);
        query_insert.setString(2, pw);
        query_insert.setString(3, name);
        query_insert.setString(4, hp);
        query_insert.setString(5, dept);
        //쿼리 문 전송
        query_insert.executeUpdate();
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
            alert("중복된 아이디 입니다.")
            history.back()
        }
        else{
            alert("회원가입이 완료되었습니다.")
            location.href="../../loginPage.html"
        }
    </script>
</body>
</html>