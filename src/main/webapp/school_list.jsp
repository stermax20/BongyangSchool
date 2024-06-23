<%@page import="model.ResDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ResDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>봉양면 학교 정보 목록</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    ResDAO rdao = new ResDAO();
    ArrayList<ResDTO> list = rdao.allSchoolInfo();
%>
<h2>봉양면 학교 정보 목록</h2>
<button onclick="location.href='school_register.jsp'">등록하기</button>
<button onclick="location.href='main.jsp'">홈으로</button>

<table border="1">
    <tr height="50">
        <td align="center" width="150">학교이름</td>
        <td align="center" width="150">전화번호</td>
        <td align="center" width="150">위치</td>
        <td align="center" width="150">학교상징</td>
        <td align="center" width="500">학교소개</td>
    </tr>

<%
    for(int i = 0; i < list.size(); i++) {
        ResDTO rdto = list.get(i);
%>
    <tr height="50">
        <td align="center" width="200">
            <a href="school_list_update.jsp?Name=<%=rdto.getName() %>"><%=rdto.getName() %></a>
        </td>
        <td align="center" width="100"><%=rdto.getTel() %></td>
        <td align="center" width="250"><%=rdto.getLoc() %></td>
        <td align="center" width="100"><%=rdto.getSimbol() %></td>
        <td align="center" width="100"><%=rdto.getIntro() %></td>
    </tr>
<%
    }
%>    
</table>
</body>
</html>
