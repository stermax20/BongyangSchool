<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About 정보 입력</title>
</head>
<body>
    <h2>About 정보 입력</h2>
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
            <td></td>
            <td><input type="submit" value="제출"></td>
        </tr>
    </table>
    </form>
</body>
</html>