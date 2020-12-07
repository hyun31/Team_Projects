<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.*" import="java.util.*"
	import="java.net.URLDecoder"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
</head>
<body>
	<div>
		안녕하세요!!!!!!!!!!!!!
		<%--  getParameter로 name을 불러서 호출함 --%>>
		<%=request.getParameter("name")%>님, 회원가입 축하합니다. <br> 
		<%-- 가입성공화면 보여주고 가입창으로 되돌아가기 --%>
		<a href=/pilot/main.html>처음으로 돌아가기</a>
	</div>
</body>
</html>