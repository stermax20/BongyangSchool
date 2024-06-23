<%@page import="model.ResDAO"%>
<%@page import="model.ResDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String Name = request.getParameter("Name");
    ResDAO rdao = new ResDAO();
    rdao.deleteInfo(Name);
    response.sendRedirect("school_list.jsp");
%>
</body>
</html>
