<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!-- Connector 파일 찾아오는 라이브러리 -->
<%@ page import="java.sql.DriverManager" %>

<!-- 데이터베이스에 연결하는 라이브러리 -->
<%@ page import="java.sql.Connection"%>

<!-- SQL문을 만들어주는 라이브러리 -->
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>

<%
    request.setCharacterEncoding("utf-8");

    //전 페이지에서 받아온 email pw 저장
    String email = request.getParameter("email");
    String pw = request.getParameter("pw");

    //데이터베이스 연결 커넥터 파일 찾아옴
    Class.forName("com.mysql.jdbc.Driver");
    //데이터 베이스 로그인? 같은 서버일때 localhost 다르면 아이피 주소
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","stageus","1234");

    //SQL문 준비
    String sql = "SELECT * from user WHERE email = ? AND password = ?;";
    //전송 준비중인 sql 의미 보낼 준비 상태로 만들어줌
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, email);
    query.setString(2, pw);

    ResultSet result = query.executeQuery();

    //로그인 정보가 올바르지 않으면 0 아니면 user idx에 저장
    int user_idx = 0; 
    String user_name = "";
    String user_dept = "";
    if(result.next()){
        user_idx = result.getInt("idx");
        user_name = result.getString("name");
        user_dept = result.getString("dept");
    }
    // 세션에 등록
    session.setAttribute("user_idx", user_idx);
    session.setAttribute("user_name", user_name);
    session.setAttribute("user_dept", user_dept);
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
        var user_idx = <%=user_idx%>
        var email = "<%=email%>"
        var pw = "<%=pw%>"

        var reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
        var reg_pw = /^[A-Za-z0-9]{4,20}$/
        console.log(email)
        if(email ==''){
            alert("이메일을 입력해주십시오")
            history.back()
        }
        else if(pw==''){
            alert("비밀번호를 입력해주십시오")
            history.back()
        }
        else if( !reg_email.test(email) ){
            alert('형식에 맞게 작성해 주세요. ex) a123@naver.com')
            history.back()
        }
        else if( !reg_pw.test(pw)){
            alert('4~20자의 영어와 숫자만 입력해 주세요.')
            history.back()
        }
        else if( user_idx == 0){
            alert("Email 또는 PW가 잘못되었습니다.")
            history.back()
        }
        else{
            // alert("로그인 성공")
            location.href="../page/mainPage.jsp"
        }

    </script>
</body>
</html>