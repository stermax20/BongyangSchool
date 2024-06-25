<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학교 등록</title>
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
    h2 {
        color: #2c3e50;
        margin-bottom: 20px;
    }
    button {
        background-color: #3498db;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
        margin: -60px 0 0 460px;
    }
    button:hover {
        background-color: #2980b9;
    }
    form {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 540px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    td {
        border: 1px solid #ccc;
        padding: 10px;
        text-align: center;
    }
    input[type="text"], textarea {
        width: 100%;
        padding: 10px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }
    input[type="submit"] {
        background-color: #2ecc71;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    input[type="submit"]:hover {
        background-color: #27ae60;
    }
</style>
</head>
<body>
    <h1>학교 등록</h1>
    <form action="school_register_proc.jsp" method="post">
        <table width="500" border="1">
            <tr height="50">
                <td align="center" width="120">학교이름</td>
                <td align="center" width="200"><input type="text" name="Name" placeholder="학교이름을 입력하세요" size="40"></td>
            </tr>
            <tr height="50">
                <td align="center" width="120">전화번호</td>
                <td align="center" width="200"><input type="text" name="Tel" placeholder="전화번호를 입력하세요" size="40"></td>
            </tr>
            <tr height="50">
                <td align="center" width="120">학교위치</td>
                <td align="center" width="200"><input type="text" name="Loc" placeholder="학교위치를 입력하세요" size="40"></td>
            </tr>
            <tr height="50">
                <td align="center" width="120">학교상징</td>
                <td align="center" width="200"><input type="text" name="Simbol" placeholder="학교상징을 입력하세요" size="40"></td>
            </tr>
            <tr height="50">
                <td align="center" width="120">학교소개</td>
                <td align="center" width="200"><textarea name="Intro" placeholder="학교소개를 입력하세요" rows="5" cols="40"></textarea></td>
            </tr>
        </table>
        <input type="submit" value="등록하기">
    </form>
    <button onclick="location.href='main.jsp'">홈으로</button>
</body>
</html>
