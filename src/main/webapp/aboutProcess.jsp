<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.AboutDAO" %>
<%@ page import="model.AboutDTO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About 정보 처리</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        
        String userId = request.getParameter("userId");
        String title = request.getParameter("title");
        String message = request.getParameter("message");
        
        AboutDTO about = new AboutDTO();
        about.setUserId(userId);
        about.setTitle(title);
        about.setMessage(message);
        
        AboutDAO dao = new AboutDAO();
        boolean success = dao.insertAbout(about);
        
        if(success) {
    %>
        <h2>About 정보가 성공적으로 저장되었습니다.</h2>
    <%
        } else {
    %>
        <h2>About 정보 저장에 실패했습니다.</h2>
    <%
        }
    %>
    <a href="aboutForm.jsp">다시 입력하기</a>
    <a href="aboutList.jsp">About 목록 보기</a>
</body>
</html>