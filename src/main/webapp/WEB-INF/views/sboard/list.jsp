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
<div>
	<select name="searchType">
		<option value="n" <c:out value="${cri.searchType == null ? 'selected' : '' }"/>>---</option>
		<option value="t" <c:out value="${cri.searchType eq 't' ? 'selected' : '' }"/>>제목</option>
		<option value="c" <c:out value="${cri.searchType eq 'c' ? 'selected' : '' }"/>>내용</option>
		<option value="w" <c:out value="${cri.searchType eq	'w' ? 'selected' : '' }"/>>작성자</option>
		<option value="tc" <c:out value="${cri.searchType eq 'tc' ? 'selected' : '' }"/>>제목 / 내용</option>
		<option value="cw" <c:out value="${cri.searchType eq 'cw' ? 'selected' : '' }"/>>내용 / 작성자</option>
		<option value="tcw" <c:out value="${cri.searchType eq 'tcw' ? 'selected' : '' }"/>>제목 / 내용 / 작성자</option>
	</select>
	<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
	<button id="btn_search">검색</button>
	<button id="btn_new">새 글</button>
</div>
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