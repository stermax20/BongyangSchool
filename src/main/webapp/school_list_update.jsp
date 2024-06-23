<%@page import="model.ResDAO"%>
<%@page import="model.ResDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
function confirmDelete() {
    return confirm('정말 삭제하시겠습니까?');
}
</script>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    String Name = request.getParameter("Name");
    ResDAO rdao = new ResDAO();
    ResDTO rdto = rdao.selectName(Name);
%>
<form action="school_list_update_proc.jsp" method="post">
    <table border="1">
        <tr height="50">
            <td align="center" width="120">학교이름 </td>
            <td align="center" width="200">
                <input type="hidden" name="Name" value="<%=rdto.getName() %>">
                <%=rdto.getName()%></td>
        </tr>
        <tr height="50">
            <td align="center" width="120">전화번호 </td>
            <td align="center" width="200"><input type="text" name="Tel" size="40"
                    value="<%=rdto.getTel()%>"></td>
        </tr>
        <tr height="50">
            <td align="center" width="120">학교위치 </td>
            <td align="center" width="200"><input type="text" name="Loc" size="40"
                    value="<%=rdto.getLoc()%>"></td>
        </tr>
        <tr height="50">
            <td align="center" width="120">학교상징 </td>
            <td align="center" width="200"><input type="text" name="Simbol" size="40"
                    value="<%=rdto.getSimbol()%>"></td>
        </tr>
        <tr height="50">
            <td align="center" width="120">학교소개 </td>
            <td align="center" width="200"><input type="text" name="Intro" size="40"
                    value="<%=rdto.getIntro()%>"></td>
        </tr>
    </table>
    <input type="submit" value="확인">
    <input type="button" value="삭제" onclick="if(confirmDelete()) location.href='school_list_delete_proc.jsp?Name=<%=rdto.getName() %>';">
    <input type="button" value="취소" onclick="location.href='school_list.jsp'">
</form>
</body>
</html>
