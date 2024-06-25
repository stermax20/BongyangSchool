<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.AnswerDAO" %>
<%@ page import="model.AnswerDTO" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 메인 페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        h1, h3 {
            color: #2c3e50;
        }
        h1 {
            margin-bottom: 20px;
            text-align: center;
        }
        h3 {
            margin-bottom: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #2c3e50;
            color: white;
        }
        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tbody tr:hover {
            background-color: #ddd;
        }
        a {
            color: #3498db;
            text-decoration: none;
            margin-right: 15px;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>관리자 메인 페이지</h1>
        <h3>답변 목록</h3>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>사용자 ID</th>
                    <th>답변 메시지</th>
                    <th>작성일</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    AnswerDAO answerDAO = new AnswerDAO();
                    List<AnswerDTO> answers = answerDAO.getAllAnswers();
                    for (AnswerDTO answer : answers) {
                %>
                <tr>
                    <td><%= answer.getAnswerId() %></td>
                    <td><%= answer.getUserId() %></td>
                    <td><%= answer.getAnswerMessage() %></td>
                    <td><%= answer.getCreatedAt() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <a href="main.jsp">홈으로</a>
        <a href="aboutList.jsp">About 목록</a>
        <a href="logout.jsp">로그아웃</a>
    </div>
</body>
</html>
