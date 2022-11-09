<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign-up</title>
    <link rel="stylesheet" href="../css/loginPage.css">
</head>
<body>
    <header>
        <h1 id="logo" onclick="location.href='../../loginPage.html'">
            SIGN-UP
        </h1>
    </header>
    <main>
        <form action="../jsp/signupAction.jsp" id="form">
            <input type="text" placeholder="E-mail" class="input">
            <input type="password" placeholder="Password" class="input" minlength="4" maxlength="20">
            <input type="text" placeholder="Name" class="input" maxlength="20">
            <input type="text" placeholder="H.P    '-' 를 제외하고 입력" class="input" maxlength="11">
            <select name="Department" id="select" class="input">
                <option value="Department">Department</option>
                <option value="H.R">H.R</option>
                <option value="Management">Management</option>
                <option value="Support">Support</option>
                <option value="Accounting">Accounting</option>
            </select>
            <input type="button" value="Log-in" class="input" id="submit">
        </form>
    </main>
    <script src="../js/signupPage.js">
        

    </script>
</body>
</html>
