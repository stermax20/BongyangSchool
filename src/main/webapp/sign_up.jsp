<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원가입</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            color: #333;
        }
        h1 {
            color: #2c3e50;
            margin-bottom: 20px;
        }
        form {
            background-color: #fff;
            padding: 55px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 300px;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }
        input[type="text"], input[type="password"], input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #3498db;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #2980b9;
        }
        button {
            background-color: #2ecc71;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: -45px;
        }
        button:hover {
            background-color: #27ae60;
        }
    </style>
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
