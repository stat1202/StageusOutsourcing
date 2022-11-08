<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<!DOCTYPE html>
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
        <form action="">
            <div id="user_info_div">
                <div class="user_info">
                    <p>
                        이름
                    </p>
                    <p class="info">
                        한승재
                    </p>
                    <input type="text" value="한승재" class="hidden">
                </div>
                <div class="user_info">
                    <p >
                        이메일
                    </p>
                    <p class="info">
                        asdf123@naver.com
                    </p>
                    <input type="text" value="asdf123@naver.com" class="hidden">
                </div>
                
                <div class="user_info">
                    <p>
                        부서
                    </p>
                    <p class="info">
                        H.R
                    </p>
                    <select name="Department" id="select" class="hidden">
                        <option value="Department">Department</option>
                        <option value="H.R">H.R</option>
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
                        010-1111-1111
                    </p>
                    <input type="text" value="010-1111-1111" class="hidden">
                </div>
            </div>
            <nav>
                <input type="button" value="수정" class="btn" id="update">
                <input type="button" value="확인" class="btn" id="ok"> 
                <input type="button" value="삭제" class="btn" id="delete">
            </nav>
        </form>
        <script src="../js/userinfoPage.js"></script>
    </main>
    
</body>
</html>