<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<table border="1" align="center">
		<tr>
			<td colspan=4 width="700"><a href="${contextPath }/article/wrtieArticleForm.do">[게시판글쓰기]</a></td>
		</tr>
		<tr align="center">
			<td width="30">번호</td>
			<td width="400">제목</td>
			<td width="70">작성자</td>
			<td width="40">조회수</td>
		</tr>
		<c:choose>
		<%-- articleList가 null이면 등록된 글이 없음 --%>
			<c:when test="${ articleList == null}">
				<tr>
					<td colspan=4><b>등록된 글이 없습니다.</b></td>
				</tr>
			</c:when>
			<%-- articleList가 null이 아니면 등록된 글이 있음 --%>
			<c:when test="${articleList != null }">
				<c:forEach var="article" items="${articleList }">
					<tr>
						<td>${article.article_no }</td>
						<td><a href="${contextPath }/article/contentForm.do?article_no=${article.article_no}">${article.title }</a></td>
						<td>${article.writer_name }</td>
						<td>${article.read_cnt }</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
		<tr>
			<td colspan=4>
			<%-- 페이징 번호 보여주는 jsp include --%>
				<jsp:include page="/board/paging.jsp">
					<jsp:param value="${paging.page }" name="page" />
					<jsp:param value="${paging.beginPage }" name="beginPage" />
					<jsp:param value="${paging.endPage }" name="endPage" />
					<jsp:param value="${paging.prev }" name="prev" />
					<jsp:param value="${paging.next }" name="next" />
				</jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>