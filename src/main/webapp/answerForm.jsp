<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.AnswerDAO" %>
<%@ page import="model.AnswerDTO" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>답변 작성</title>
</head>
<body>
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
                <td>메시지:</td>
                <td><textarea name="answerMessage" rows="5" cols="40"></textarea></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="답변 제출"></td>
            </tr>
        </table>
    </form>
<%
    } else {
%>
    <h2>접근 불가</h2>
    <p>관리자만 답변을 작성할 수 있습니다.</p>
<%
    }
%>
</body>
</html>
