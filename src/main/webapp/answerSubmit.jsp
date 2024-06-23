<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.AnswerDAO" %>
<%@ page import="model.AnswerDTO" %>
<%
    request.setCharacterEncoding("UTF-8");

    int aboutId = Integer.parseInt(request.getParameter("aboutId"));
    String userId = request.getParameter("userId");
    String answerMessage = request.getParameter("answerMessage");

    AnswerDTO answer = new AnswerDTO();
    answer.setAboutId(aboutId);
    answer.setUserId(userId);
    answer.setAnswerMessage(answerMessage);

    AnswerDAO dao = new AnswerDAO();
    boolean success = dao.insertAnswer(answer);

    if (success) {
        response.sendRedirect("aboutList.jsp");
    } else {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>답변 제출 실패</title>
</head>
<body>
    <h2>답변 제출 실패</h2>
    <p>답변 제출 중 오류가 발생했습니다. 관리자만 답변을 작성할 수 있습니다.</p>
    <a href="aboutList.jsp">돌아가기</a>
</body>
</html>
<%
    }
%>
