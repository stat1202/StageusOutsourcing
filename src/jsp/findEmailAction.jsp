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
    String name = request.getParameter("name");
    String hp = request.getParameter("hp");

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","stageus","1234");
    //이메일 전화번호 일치하는 것 찾기
    String sql = "SELECT email FROM user WHERE name = ? and hp = ?;";

    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, name);
    query.setString(2, hp);

    ResultSet result = query.executeQuery();

    String email = "";
    int bool = 0;
    if(result.next()){
        bool = 1;
        email = result.getString("email");
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
        if(bool == 1){
            alert("회원님의 이메일은 <%=email%> 입니다.")
            location.href="../../loginPage.html"
        }
        else{
            alert("회원정보와 일치하는 이메일이 없습니다.")
            history.back()
        }
    </script>
</body>
</html>