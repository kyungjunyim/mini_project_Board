<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성 일자</th>
		<th>조회수</th>
	</tr>
	<c:forEach items="${list }" var="boardVO">
	<tr>
		<td>${boardVO.boardNumber }</td>
		<td><a href='/board/readPage${pageMaker.makeQuery(pageMaker.cri.page) }&boardNumber=${boardVo.boardNumber }'>${boardVO.boardTitle }</a></td>
		<td>${boardVO.boardWriter }</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.boardRegDate }" /></td>
		<td><span>${boardVO.boardViewCnt }</span></td>
	</tr>
	</c:forEach>
</table>
<div>
	<ul>
		<c:if test="${pageMaker.prev }">
			<li><a href="listPage${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
		</c:if>
		
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
			<li
				<c:out value="${pageMaker.cri.page == idx ? 'class=active' : '' }" />>
				<a href="listPage${pageMaker.makeQuery(idx) }">${idx }</a>
			</li>
		</c:forEach>
		
		<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
			<li><a href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1) }">&raquo;</a></li>
		</c:if>
		
	</ul>
</div>
</body>
</html>