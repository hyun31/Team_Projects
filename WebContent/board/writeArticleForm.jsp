<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판글쓰기</title>
</head>
<body>
<%-- 게시판글쓰기 Form --%>
	<div>
		<form method="post" action="${contextPath }/article/addArticle.do"
					encType="multipart/form-data">
			제목 : <br> <input type="text" name="title"> <br>
			비밀번호 : <br> <input type="password" name="pwd"> <br>
			내용 : <br>
			<textarea rows="20" cols="80" name="content"></textarea> <br>
			<input type="submit" value="새 글 등록">
			파일첨부 <input type="file" name="fileName">
		</form>
	</div>
</body>
</html>