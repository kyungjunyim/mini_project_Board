<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JUN's BOARD</title>
<link rel="stylesheet" href="../../resources/css/bootstrap.min.css">
<link rel="stylesheet" href="../../resources/css/hotList.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="my_contents">
		<div class="row row_search_bar">
			<div class="col-xs-6 col_search_bar">
				<button type="button" class="btn btn-md btn_new" id="btn_new">글
					작성하기</button>
			</div>
			<div class="col-xs-6 col_search_bar">
				<select class="select_free_board" name="searchType">
					<option value="n"
						<c:out value="${cri.searchType == null ? 'selected' : '' }"/>>---</option>
					<option value="t"
						<c:out value="${cri.searchType eq 't' ? 'selected' : '' }"/>>제목</option>
					<option value="c"
						<c:out value="${cri.searchType eq 'c' ? 'selected' : '' }"/>>내용</option>
					<option value="w"
						<c:out value="${cri.searchType eq	'w' ? 'selected' : '' }"/>>작성자</option>
					<option value="tc"
						<c:out value="${cri.searchType eq 'tc' ? 'selected' : '' }"/>>제목
						/ 내용</option>
					<option value="cw"
						<c:out value="${cri.searchType eq 'cw' ? 'selected' : '' }"/>>내용
						/ 작성자</option>
					<option value="tcw"
						<c:out value="${cri.searchType eq 'tcw' ? 'selected' : '' }"/>>제목
						/ 내용 / 작성자</option>
				</select>
			</div>
			<div class="col-xs-6 col_search_bar">
				<input type="text" class="input_keyword" name="keyword"
					id="keywordInput" placeholder="검색어 입력" value="${cri.keyword }">
			</div>
			<div class="col-xs-6 col_search_bar">
				<button type="button" class="btn btn-md btn_search" id="btn_search">검색</button>
			</div>
		</div>

		<table class="table table-hover">
			<tr>
				<th class="td_board_number">번호</th>
				<th>제목</th>
				<th class="td_board_writer">작성자</th>
				<th class="td_board_reg_date">작성 일자</th>
				<th class="td_board_view_cnt">조회수</th>
			</tr>
			<c:forEach items="${list }" var="boardVO">
			<tr id="${boardVO.boardNumber }">
				<td class="td_board_number">${boardVO.boardNumber }</td>
				<td class="td_board_title"><span class="span_truncate">${boardVO.boardTitle }</span></td>
				<td class="td_board_writer"><span class="span_truncate">${boardVO.boardWriter }</span></td>
				<td class="td_board_reg_date"><fmt:formatDate pattern="MM-dd HH:mm" value="${boardVO.boardRegDate }" /></td>
				<td class="td_board_view_cnt"><span class="badge my_badge">${boardVO.boardViewCnt }</span></td>
			</tr>
			</c:forEach>
		</table>
		<div>
			<ul class="pagination justify-content-center">
				<c:if test="${pageMaker.prev }">
					<li class="page-item my_page_item"><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }" class="page-link my_page_link">&laquo;</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					<c:if test="${pageMaker.cri.page == idx }">
						<li class="active page-item my_page_item">
							<a href="list${pageMaker.makeSearch(idx) }" class="page-link my_page_link">${idx }</a>
						</li>
					</c:if>
					<c:if test="${pageMaker.cri.page != idx }">
						<li class="page-item my_page_item">
							<a href="list${pageMaker.makeSearch(idx) }" class="page-link my_page_link">${idx }</a>
						</li>
					</c:if>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
					<li class="page-item my_page_item">
						<a href="list${pageMaker.makeSearch(pageMaker.endPage + 1) }" class="page-link my_page_link">&raquo;</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(
			function() {
				$("#btn_search").on(
						"click",
						function(e) {
							self.location = "list"
									+ "${pageMaker.makeQuery(1) }"
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword="
									+ encodeURIComponent($("#keywordInput")
											.val());
						});

				$("#btn_new").on("click", function() {
					<c:if test="${empty sessionScope.login}">
						alert("로그인 후에 이용해주세요!");
						$(".my_navbar_toggler").click();
					</c:if>
					<c:if test="${not empty sessionScope.login}">
						self.location = "register";
					</c:if>
				});
			});
	$("tr").on("click", function() {
		var boardNumber = this.id;
		self.location = "readPage" + "${pageMaker.makeSearch(pageMaker.cri.page) }" + "&boardNumber=" + boardNumber;
	});
</script>
</body>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="../../resources/js/bootstrap.js"></script>
</html>