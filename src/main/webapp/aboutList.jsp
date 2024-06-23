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
</head>
<body>
    <h2>About 목록</h2>
    <table border="1">
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
    <br>
    <a href="aboutForm.jsp">새 About 정보 입력</a>
    <button onclick="location.href='main.jsp'">홈으로</button>
</body>
</html>
