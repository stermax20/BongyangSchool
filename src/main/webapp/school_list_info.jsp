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
	ResDTO rdto = rdao.selectName(Name);
%>
	<table border="1">
	<tr height="50">
		<td align="center" width="120">학교이름 </td>
		<td align="center" width="200"><%=rdto.getName()%></td>
	</tr>
	<tr height="50">
		<td align="center" width="120">전화번호 </td>
		<td align="center" width="200"><%=rdto.getTel()%></td>
	</tr>
	<tr height="50">
		<td align="center" width="120">학교위치 </td>
		<td align="center" width="200"><%=rdto.getLoc()%></td>
	</tr>
	<tr height="50">
		<td align="center" width="120">학교상징 </td>
		<td align="center" width="200"><%=rdto.getSimbol()%></td>
	</tr>
	<tr height="50">
		<td align="center" width="120">학교소개 </td>
		<td align="center" width="200"><%=rdto.getIntro()%></td>
	</tr>
	<tr height="50">
	<td align="center" colspan="2">
	<button onclick="location.href='school_list_update.jsp?Name=<%=rdto.getName()%>'">수정하기</button>
	<button onclick="location.href='school_list_delete_proc.jsp?Name=<%=rdto.getName()%>'">삭제하기</button>
</td>
</tr>
</table>
</body>
</html>