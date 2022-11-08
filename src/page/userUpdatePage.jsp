<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>


<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UPDATE</title>
    <link rel="stylesheet" href="../css/logo.css">
    <link rel="stylesheet" href="../css/input.css">
    <link rel="stylesheet" href="../css/loginPage.css">
</head>
<body>
    <header>
        <div id="logo">
            UPDATE
        </div>
    </header>
    <main>
        <form action="">
            <input type="text" placeholder="E-mail" class="input" value="asdf123@naver.com">
            <input type="password" placeholder="Password" class="input" minlength="4" maxlength="20">
            <input type="text" placeholder="Name" class="input" maxlength="20" value="한승재">
            <input type="text" placeholder="H.P" class="input" value="010-1111-1111">
            <select name="Department" id="select" class="input" value="H.R">
                <option value="Department">Department</option>
                <option value="H.R">H.R</option>
                <option value="Management">Management</option>
                <option value="Support">Support</option>
                <option value="Accounting">Accounting</option>
            </select>
            <input type="button" value="Log-in" class="input" id="submit">
        </form>
        <script src="../js/userUpdatePage.js"></script>
    </main>
</body>
</html>
