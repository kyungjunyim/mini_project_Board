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
<link rel="stylesheet" href="../../resources/css/readPage.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<form role="form" action="modifyPage" method="post">
		<input type="hidden" name="boardNumber"
			value="${boardVO.boardNumber }"> <input type="hidden"
			name="page" value="${cri.page }"> <input type="hidden"
			name="perPageNum" value="${cri.perPageNum }"> <input
			type="hidden" name="searchType" value="${cri.searchType }"> <input
			type="hidden" name="keyword" value="${cri.keyword }">
	</form>

	<div class="my_contents">
		<div class="row row_register">
			<div class="col-xs-6 col_label">
				<label class="label_register">제목</label>
			</div>
			<div class="col-xs-6">
				<input type="text" class="input_title" name="boardTitle"
					value="${boardVO.boardTitle }" readonly>
			</div>
		</div>
		<div class="row row_register">
			<div class="col-xs-6 col_label">
				<label class="label_register">내용</label>
			</div>
			<div class="col-xs-6">
				<textarea name="boardContent" class="input_content" readonly>${boardVO.boardContent }</textarea>
			</div>
		</div>
		<div class="row row_register">
			<div class="col-xs-6 col_label">
				<label class="label_register">작성자</label>
			</div>
			<div class="col-xs-6">
				<input type="text" class="input_writer" name="boardWriter"
					value="${boardVO.boardWriter }" readonly>
			</div>
			<c:if test="${sessionScope.login.userName == boardVO.boardWriter || sessionScope.login.userName == '관리자' }">
				<div class="col-xs-6">
					<button class="btn btn-md btn_read_page btn_modify" type="submit"
						id="btn_modify">수정</button>
				</div>
				<div class="col-xs-6">
					<button class="btn btn-md btn_read_page btn_remove" type="submit"
						id="btn_remove">삭제</button>
				</div>
			</c:if>
			<c:if test="${sessionScope.login.userName != boardVO.boardWriter && sessionScope.login.userName != '관리자'}">
				<div class="col-xs-6">
					<button class="btn btn-md btn_modify btn_disable" type="submit"
						id="btn_modify" disabled>수정</button>
				</div>
				<div class="col-xs-6">
					<button class="btn btn-md btn_remove btn_disable" type="submit"
						id="btn_remove" disabled>삭제</button>
				</div>
			</c:if>
			<div class="col-xs-6">
				<button class="btn btn-md btn_read_page btn_list" type="submit"
					id="btn_list">목록으로</button>
			</div>
		</div>
	</div>

	<c:if test="${not empty sessionScope.login }">
		<form action="registerReply" method="post">
			<input type="hidden" name="boardNumber" value="${boardVO.boardNumber }">
			<input type="hidden" name="replyWriter" value="${sessionScope.login.userName }">
			<div class="my_contents">
				<div class="row row_register">
					<div class="col-xs-6 col_label">
						<label class="label_register"><strong>${sessionScope.login.userName }</strong></label>
					</div>
					<div class="col-xs-6">
						<input type="text" name="replyText" class="input_title"
							placeholder="댓글 입력">
					</div>
				</div>
				<div class="row row_register">
					<div class="col-xs-6">
						<button class="btn btn-md btn_read_page btn_modify" type="submit"
							id="btn_modify" style="margin-left: 756px;">등록</button>
					</div>
				</div>
			</div>
		</form>
	</c:if>
	<c:if test="${not empty replies }">
		<div class="my_contents">
			<c:forEach items="${replies }" var="replyVO">
				<div class="row row_register" style="margin-bottom: 25px;">
					<div class="col-xs-6 col_label" style="text-align: center;">
						<span><strong>${replyVO.replyWriter }</strong></span><br> <span>
							<fmt:formatDate pattern="MM-dd HH:mm"
								value="${replyVO.replyUpdateDate }" />
						</span><br> <span><a href=''>수정</a>&nbsp;<a href=''>삭제</a></span>
					</div>
					<div class="col-xs-6 col_reply">
						<input type="text" name="boardContent" class="input_title"
							value="${replyVO.replyText }" style="height: 40px;" readonly>
					</div>
				</div>
			</c:forEach>
			<div>
				<ul class="pagination justify-content-center">
					<c:if test="${pageMaker.prev }">
						<li class="page-item my_page_item"><a
							href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }"
							class="page-link my_page_link">&laquo;</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">
						<c:if test="${pageMaker.cri.page == idx }">
							<li class="active page-item my_page_item"><a
								href="list${pageMaker.makeSearch(idx) }"
								class="page-link my_page_link">${idx }</a></li>
						</c:if>
						<c:if test="${pageMaker.cri.page != idx }">
							<li class="page-item my_page_item"><a
								href="list${pageMaker.makeSearch(idx) }"
								class="page-link my_page_link">${idx }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
						<li class="page-item my_page_item"><a
							href="list${pageMaker.makeSearch(pageMaker.endPage + 1) }"
							class="page-link my_page_link">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</c:if>
</body>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);

		$("#btn_modify").on("click", function() {
			formObj.attr("action", "/freeBoard/modifyPage");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$("#btn_remove").on("click", function() {
			formObj.attr("action", "/freeBoard/removePage");
			formObj.submit();
		});

		$("#btn_list").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/freeBoard/list");
			formObj.submit();
		});
	});
</script>
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
					self.location = "register";
				});
			});
</script>
</body>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="../../resources/js/bootstrap.js"></script>
</html>