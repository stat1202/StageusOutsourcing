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

    //회원가입 창 값 받아오기
    String email = request.getParameter("email");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String hp = request.getParameter("hp");
    String dept = request.getParameter("Department");

    String email_pattern = "\\w+@\\w+\\.\\w+(\\.\\w+)?";
    String pw_pattern = "^[A-Za-z0-9]{4,20}$";
    String name_pattern = "^[가-힣]{1,20}$";
    String hp_pattern = "^[0-9]*$";

    boolean email_matches = Pattern.matches(email_pattern, email);
    boolean pw_matches = Pattern.matches(pw_pattern, pw);
    boolean name_matches = Pattern.matches(name_pattern, name);
    boolean hp_matches = Pattern.matches(hp_pattern, hp);

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
    // 이름 전화번호 체크
    String sql2 = "SELECT * FROM user WHERE name=? and hp = ?;";

    PreparedStatement query2 = connect.prepareStatement(sql2);

    query2.setString(1, name);
    query2.setString(2, hp);
    ResultSet result2 = query2.executeQuery();

    int check = 0;

    if( result2.next()){
        check = 1;
    }


    if(bool == 0 && check == 0){
        //데이터 넣기
        if(email != "" && pw != "" && name != "" && hp !="" && dept !="Department" ){

            if( email_matches && pw_matches && name_matches && hp_matches && hp.length() == 11){
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
    console.log(<%=email_matches%>)
    console.log(<%=pw_matches%>)
    console.log(<%=name_matches%>)
    console.log(<%=hp_matches%>)
    var bool = <%=bool%>
    var check = <%=check%>
    var email = "<%=email%>"
    var pw = "<%=pw%>"
    var name = "<%=name%>"
    var hp = "<%=hp%>"
    var dept = "<%=dept%>"
    // 정규식 검사
    var reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
    var reg_pw = /^[A-Za-z0-9]{4,20}$/
    var reg_name = /^[가-힣]{1,20}$/
    var reg_hp = /^[0-9]*$/

    if(email ==''){
        alert("이메일을 입력해주십시오.")
        history.back()
    }
    else if(pw==''){
        alert("비밀번호를 입력해주십시오")
        history.back()
    }
    else if(name==''){
        alert("이름을 입력해주십시오")
        history.back()
    }
    else if(hp==''){
        alert("전화번호를 입력해주십시오")
        history.back()
    }
    else if(dept=="Department"){
        alert("부서를 선택해 주십시오")
        history.back()
    }
    // 정규식
    else if( !reg_email.test(email) ){
        alert('형식에 맞게 작성해 주세요. ex) a123@naver.com')
        console.log(reg_email.test)
        history.back()
    }
    else if( !reg_pw.test(pw)){
        alert('4~20자의 영어와 숫자만 입력해 주세요.')
        history.back()
    }
    else if( !reg_name.test(name)){
        alert('올바른 이름 형식이 아닙니다.')
        history.back()
    }
    else if( !reg_hp.test(hp) ){
        alert("숫자만 입력해 주세요.")
        history.back()
    }
    else if(hp.length < 11){
        alert("전화번호의 길이가 짧습니다")
        history.back()
    }
    else if(bool ==1){
        alert("중복된 이메일 입니다.")
        history.back()
    }
    else if(check == 1){
        alert("이미 가입된 회원입니다.")
        history.back()
    }
    else{
        alert("회원가입이 완료되었습니다.")
        location.href="../../loginPage.html"
    }
    </script>
</body>
</html>