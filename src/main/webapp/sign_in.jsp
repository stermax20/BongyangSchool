<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>로그인</title>
</head>
<body>
    <h1>로그인</h1>
    <form method="post" action="sign_in_action.jsp">
        <label for="userID">아이디:</label>
        <input type="text" id="userID" name="userID" required>
        <br>
        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" required>
        <br>
        <input type="submit" value="로그인">
    </form>

    <button onclick="window.location.href='sign_up.jsp'">회원가입</button>
</body>
</html>