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

    //내 정보값 받아오기
    String email = request.getParameter("email");
    String name = request.getParameter("name");
    String hp_tmp = request.getParameter("hp");
    String dept = request.getParameter("Department");
    String hp = "";
    if(hp_tmp.contains("-")){
        for(int i=0; i < hp_tmp.split("-").length; i++){
            hp += hp_tmp.split("-")[i];
        }
    }

    String email_pattern = "\\w+@\\w+\\.\\w+(\\.\\w+)?";
    String name_pattern = "^[가-힣]{1,20}$";
    String hp_pattern = "^[0-9]*$";

    boolean email_matches = Pattern.matches(email_pattern, email);
    boolean name_matches = Pattern.matches(name_pattern, name);
    boolean hp_matches = Pattern.matches(hp_pattern, hp);
    //세션 있고 정규식 만족하면 업데이트 진행
    if(user_idx != 0 ){
        if(email != "" && name != "" && hp != "" && dept != "Department" ){
            if( email_matches && name_matches && hp_matches && hp.length() == 11){

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","stageus","1234");
            
                    //유저 정보 수정
                    String sql = "UPDATE user SET email = ?, name = ?, hp = ?, dept = ? WHERE idx = ?; ";
            
                    PreparedStatement query = connect.prepareStatement(sql);
                    query.setString(1, email);
                    query.setString(2, name);
                    query.setString(3, hp);
                    query.setString(4, dept);
                    query.setInt(5, user_idx);                
                    //쿼리 문 전송
                    query.executeUpdate();
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
    var email = "<%=email%>"
    var name = "<%=name%>"
    var hp = "<%=hp%>"
    var dept = "<%=dept%>"
    // 정규식 검사
    var reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
    var reg_name = /^[가-힣]{1,20}$/
    var reg_hp = /^[0-9]*$/

    if(email ==''){
        alert("이메일을 입력해주십시오.")
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
    else if( !reg_name.test(name)){
        alert('올바른 이름 형식이 아닙니다.')
        history.back()
    }
    else if( !reg_hp.test(hp) || hp.length != 11){
        alert("전화번호의 길이가 길거나 짧습니다.")
        history.back()
    }
    else{
        // alert("회원정보 수정 완료")
        location.href="../page/userinfoPage.jsp"
    }
    </script>
</body>
</html>