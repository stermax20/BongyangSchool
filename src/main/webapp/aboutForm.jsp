<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About 정보 입력</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        h1 {
            color: #2c3e50;
            margin-bottom: 20px;
            text-align: center;
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        td {
            padding: 10px;
        }
        label {
            font-weight: bold;
        }
        input[type="text"], textarea {
            width: calc(100% - 22px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        textarea {
            resize: vertical;
            height: 100px;
        }
        input[type="submit"] {
            background-color: #3498db;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            float: right; /* 우측 배치 */
        }
        input[type="submit"]:hover {
            background-color: #2980b9;
        }
        button {
            background-color: #3498db;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            float: left;
        }
        button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <h1>About 정보 입력</h1>
    <form action="aboutProcess.jsp" method="post">
        <table>
            <tr>
                <td><label for="userId">사용자 ID:</label></td>
                <td><input type="text" id="userId" name="userId" required></td>
            </tr>
            <tr>
                <td><label for="title">제목:</label></td>
                <td><input type="text" id="title" name="title" required></td>
            </tr>
            <tr>
                <td><label for="message">메시지:</label></td>
                <td><textarea id="message" name="message" required></textarea></td>
            </tr>
            <tr>
                <td>
                    <button onclick="location.href='main.jsp'">홈으로</button>
                </td>
                <td>
                    <input type="submit" value="제출">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
