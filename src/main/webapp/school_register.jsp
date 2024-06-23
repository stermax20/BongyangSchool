<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학교 등록</title>
</head>
<body>
	<h2>학교 등록</h2> <button onclick="location.href='main.jsp'">홈으로</button>
	<form action="school_register_proc.jsp" method="post">
	<table width="500" border="1">
	<tr height="50">
		<td align="center" width="120">학교이름 </td>
		<td align="center" width="200"><input type="text" name="Name" placeholder="학교이름을 입력하세요" size="40"></td>
	</tr>
	<tr height="50">
		<td align="center" width="120">전화번호 </td>
		<td align="center" width="200"><input type="text" name="Tel" placeholder="전화번호를 입력하세요" size="40"></td>
	</tr>
	<tr height="50">
		<td align="center" width="120">학교위치 </td>
		<td align="center" width="200"><input type="text" name="Loc" placeholder="학교위치를 입력하세요" size="40"></td>
	</tr>
	<tr height="50">
		<td align="center" width="120">학교상징 </td>
		<td align="center" width="200"><input type="text" name="Simbol" placeholder="학교상징을 입력하세요" size="40"></td>
	</tr>
	<tr height="50">
            <td align="center" width="200">학교상징 </td>
                <td align="center" width="200"><textarea name="Intro" placeholder="학교소개를 입력하세요" rows="5" cols="40"></textarea>
            </td>
        </tr>
</table>
<input type="submit" value="등록하기">
</form>
</body>
</html>