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
</head>
<body>
    <h2>관리자 메인 페이지</h2>
    <h3>답변 목록</h3>
    <table border="1">
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
    <br>
    <a href="aboutList.jsp">About 목록</a>
    <br>
    <a href="logout.jsp">로그아웃</a>
</body>
</html>
