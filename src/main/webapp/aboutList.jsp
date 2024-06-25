<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.AboutDAO" %>
<%@ page import="model.AboutDTO" %>
<%@ page import="model.AnswerDAO" %>
<%@ page import="model.AnswerDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About 목록</title>
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
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #3498db;
            color: #fff;
        }
        td ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        td ul li {
            background-color: #ecf0f1;
            padding: 5px;
            margin: 5px 0;
            border-radius: 5px;
        }
        a {
            color: #3498db;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
            margin-left: 20px;
            margin-right: 20px;
        }
        .button-container button {
            background-color: #3498db;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .button-container button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <h1>About 목록</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>사용자 ID</th>
            <th>제목</th>
            <th>메시지</th>
            <th>작성일</th>
            <th>답변</th>
        </tr>
        <%
            AboutDAO aboutDao = new AboutDAO();
            AnswerDAO answerDao = new AnswerDAO();
            List<AboutDTO> abouts = aboutDao.getAllAbouts();
            for(AboutDTO about : abouts) {
        %>
        <tr>
            <td><%= about.getAboutId() %></td>
            <td><%= about.getUserId() %></td>
            <td><%= about.getTitle() %></td>
            <td><%= about.getMessage() %></td>
            <td><%= about.getCreatedAt() %></td>
            <td>
                <ul>
                    <%
                        List<AnswerDTO> answers = answerDao.getAllAnswersByAboutId(about.getAboutId());
                        for(AnswerDTO answer : answers) {
                    %>
                    <li><%= answer.getAnswerMessage() %> - <%= answer.getCreatedAt() %></li>
                    <%
                        }
                    %>
                </ul>
                <a href="answerForm.jsp?aboutId=<%= about.getAboutId() %>">답변 작성</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    <div class="button-container">
        <button onclick="location.href='aboutForm.jsp'">새 About 정보 입력</button>
        <button onclick="location.href='main.jsp'">홈으로</button>
    </div>
    <%@ include file="footer.jsp"%>
</body>
</html>
