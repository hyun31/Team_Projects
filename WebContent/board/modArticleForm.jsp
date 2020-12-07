<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
<%-- 게시글 수정하는 Form  --%>
	<div>
	<form method="post" action="${contextPath }/article/modArticle.do">
	번호: <br>
	${param.article_no } <br>
	<input type="hidden" name="article_no" value="${param.article_no }">
	제목: <br>
	<input type="text" name="title" value="${param.title }"> <br>
	내용: <br>
	<textarea rows="20" cols="80" name="content">${param.content }</textarea> <br>
	<input type="submit" value="글 수정">
	</form>
	</div>
</body>
</html>