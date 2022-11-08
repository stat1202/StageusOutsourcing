<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>userInfoPage</title>
    <link rel="stylesheet" href="../css/logo.css">
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
                    <div>
                        이름
                    </div>
                    <div>
                        한승재
                    </div>
                </div>
                <div class="user_info">
                    <div>
                        이메일
                    </div>
                    <div>
                        asdf123@naver.com
                    </div>
                </div>
                
                <div class="user_info">
                    <div>
                        부서
                    </div>
                    <div>
                        H.R
                    </div>
                </div>
                <div class="user_info">
                    <div>
                        연락처
                    </div>
                    <div>
                        010-1111-1111
                    </div>
                </div>
            </div>
            <nav>
                <input type="button" value="수정" class="btn" id="update">
                <input type="button" value="삭제" class="btn" id="delete">
            </nav>
        </form>
        <script src="../js/userinfoPage.js"></script>
    </main>
    
</body>
</html>