<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession session2 = request.getSession(false);
    
    if (session != null) {
        session.invalidate();
    }
    
    response.sendRedirect("index.jsp");
%>
