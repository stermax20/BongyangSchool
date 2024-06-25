<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.AnswerDAO" %>
<%@ page import="model.AnswerDTO" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>답변 작성</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .container {
            width: 60%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        h2 {
            color: #2c3e50;
            margin-bottom: 20px;
            text-align: center;
        }
        form {
            margin-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        td {
            padding: 12px;
            vertical-align: top;
        }
        textarea {
            width: calc(100% - 24px);
            padding: 10px;
            margin-right: 500px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            resize: vertical;
        }
        input[type="submit"] {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 12px 20px;
            margin-right: 400px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #2980b9;
        }
        .message {
            color: #e74c3c;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <div class="container">
<%
    HttpSession session2 = request.getSession();
    String userId = (String) session.getAttribute("USERID");

    if ("admin".equals(userId)) {
%>
        <h2>관리자님, 답변을 작성해 주세요</h2>
        <form action="answerSubmit.jsp" method="post">
            <input type="hidden" name="aboutId" value="<%= request.getParameter("aboutId") %>">
            <input type="hidden" name="userId" value="<%= userId %>">
            <table>
                <tr>
                    <td><label for="answerMessage">메시지:</label></td>
                    <td><textarea id="answerMessage" name="answerMessage" rows="5" required></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: right;"><input type="submit" value="답변 제출"></td>
                </tr>
            </table>
        </form>
<%
    } else {
%>
        <h2 class="message">접근 불가</h2>
        <p class="message">관리자만 답변을 작성할 수 있습니다.</p>
<%
    }
%>
    </div>
</body>
</html>
