<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<body>
<jsp:include page="../header.jsp">
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
	<button type="button" id="btn_search">검색</button>
	<button type="button" id="btn_new">새 글</button>
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
		<td><a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&boardNumber=${boardVO.boardNumber }'>${boardVO.boardTitle }</a></td>
		<td>${boardVO.boardWriter }</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.boardRegDate }" /></td>
		<td><span>${boardVO.boardViewCnt }</span></td>
	</tr>
	</c:forEach>
</table>
<div>
	<ul>
		<c:if test="${pageMaker.prev }">
			<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
		</c:if>
		
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
			<li
				<c:out value="${pageMaker.cri.page == idx ? 'class=active' : '' }" />>
				<a href="list${pageMaker.makeSearch(idx) }">${idx }</a>
			</li>
		</c:forEach>
		
		<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
			<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1) }">&raquo;</a></li>
		</c:if>
		
	</ul>
</div>
</body>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btn_search").on("click", function(e) {
			self.location = "list" + "${pageMaker.makeQuery(1) }" + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($("#keywordInput").val());
		});
		
		$("#btn_new").on("click", function() {
			self.location = "register";
		});
	});
</script>
</html>