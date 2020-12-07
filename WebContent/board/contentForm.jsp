<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글내용</title>
</head>
<body>
<%-- 게시글 내용을 보여주는 Form --%> 
	<table border="1" align="center">
		<tr>
			<td width="50">번호</td>
			<td width="500">${content.article_no }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${content.writer_name }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${content.title }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${content.content }</td>
		</tr>
		<tr>
			<td colspan=3>
				<a href="${contextPath }/article/listArticles.do">[목록]</a> 
				<a href="${contextPath }/article/checkPwd.do?command=mod&article_no=${content.article_no}
										&title=${content.title}&content=${content.content}">[게시글수정]</a>
				<a href="${contextPath }/article/checkPwd.do?command=del&article_no=${content.article_no}">[게시글삭제]</a>
				<c:if test="${not empty content.file_name}">
					<a href="${contextPath }/article/downloadFile.do?article_no=${content.article_no}">[파일다운]</a>
				</c:if>
			</td>
		</tr>
	</table>
</body>
</html>