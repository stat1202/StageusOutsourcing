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
    String email = "";
    String dept = "";
    String hp_part = "";
    String hp = "";
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
        email = result.getString("email");
        dept = result.getString("dept");
        hp_part = result.getString("hp");

        String hp1 = hp_part.substring(0,3);
        String hp2 = hp_part.substring(3,7);
        String hp3 = hp_part.substring(7,11);
        hp = hp1 + "-" + hp2 + "-" + hp3;
    }
%>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>userInfoPage</title>
    <link rel="stylesheet" href="../css/userinfoPage.css">
</head>
<body>
    <header>
        <div id="logo">
            My info
        </div>
    </header>
    <main>
        <form action='' id="form">
            <div id="user_info_div">
                <div class="user_info">
                    <p>
                        이름
                    </p>
                    <p class="info">
                        <%=name%>
                    </p>
                    <input type="text" value="<%=name%>" class="hidden" name="name">
                </div>
                <div class="user_info">
                    <p >
                        이메일
                    </p>
                    <p class="info">
                        <%=email%>
                    </p>
                    <input type="text" value="<%=email%>" class="hidden" name="email">
                </div>
                
                <div class="user_info">
                    <p>
                        부서
                    </p>
                    <p class="info">
                        <%=dept%>
                    </p>
                    <select name="Department" id="select" class="hidden">
                        <option value="Department">Department</option>
                        <option value="H.R" >H.R</option>
                        <option value="Management">Management</option>
                        <option value="Support">Support</option>
                        <option value="Accounting">Accounting</option>
                    </select>
                </div>
                <div class="user_info">
                    <p>
                        연락처
                    </p>
                    <p class="info">
                        <%=hp%>
                    </p>
                    <input type="text" value="<%=hp%>" class="hidden" name="hp" maxlength="13">
                </div>
            </div>
            <nav>
                <input type="button" value="수정" class="btn" id="update">
                <input type="submit" value="확인" class="btn" id="ok"> 
                <input type="submit" value="삭제" class="btn" id="delete">
            </nav>
        </form>
        
    </main>
    <script src="../js/userinfoPage.js"></script>
    <script>
        var user_idx = <%=user_idx%>
        if(user_idx == 0){
            alert("로그인 후 이용할 수 있습니다")
            location.href = "../../loginPage.html"
        }
    </script>
</body>
</html>