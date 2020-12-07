<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
	<%-- 삭제를 위한 암호확인을 할때 --%>
		<c:when test="${param.command == 'del' }">
			<form method="post" action="${contextPath }/article/delArticle.do">
			
				게시글을 삭제하시려면 암호를 입력하세요 <br> 
				암호: <input type="password" name="pwd"> <br>
				<input type="hidden" name="article_no" value="${param.article_no }"> 
				<input type="submit" value="게시글  삭제하기">
			</form>
		</c:when>
		<%-- 수정을 위한 암호확인을 할때 --%>
		<c:when test="${param.command == 'mod' }">
			<form method="post" action="${contextPath }/article/modArticleForm.do">
				게시글을 수정하시려면 암호를 입력하세요 <br>
				 암호: <input type="password" name="pwd"> <br>
				 <input type="hidden" name="article_no" value="${param.article_no }">
				 <input type="hidden" name="title" value="${param.title }">
				 <input type="hidden" name="content" value="${param.content }" > 
				 <input type="submit" value="게시글  수정하기">
			</form>
		</c:when>
	</c:choose>
</body>
</html>