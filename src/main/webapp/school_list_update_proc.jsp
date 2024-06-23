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
	String Tel = request.getParameter("Tel");
	String Loc = request.getParameter("Loc");
	String Simbol = request.getParameter("Simbol");
	String Intro = request.getParameter("Intro");
	
	ResDTO data = new ResDTO();
	data.setName(Name);
	data.setTel(Tel);
	data.setLoc(Loc);
	data.setSimbol(Simbol);
	data.setIntro(Intro);
	
	ResDAO rdao = new ResDAO();
	rdao.updateInfo(data);
	response.sendRedirect("school_list.jsp");
%>
</body>
</html>