<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원가입</title>
</head>
<body>
    <h1>회원가입</h1>
    <form method="post" action="sign_up_action.jsp">
        <label for="userID">아이디:</label>
        <input type="text" id="userID" name="userID" required>
        <br>
        <label for="userPassword">비밀번호:</label>
        <input type="password" id="userPassword" name="userPassword" required>
        <br>
        <label for="userName">유저 명:</label>
        <input type="text" id="userName" name="userName" required>
        <br>
        <label for="userGender">성별:</label>
        <input type="text" id="userGender" name="userGender" required>
        <br>
        <label for="userEmail">이메일:</label>
        <input type="email" id="userEmail" name="userEmail" required>
        <br>
        <input type="submit" value="회원가입">
    </form>
    
    <button onclick="window.location.href='sign_in.jsp'">로그인</button>
</body>
</html>
