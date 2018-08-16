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
			<div class="col-xs-6">
				<button class="btn btn-md btn_read_page btn_modify" type="submit" id="btn_modify">수정</button>
			</div>
			<div class="col-xs-6">
				<button class="btn btn-md btn_read_page btn_remove" type="submit" id="btn_remove">삭제</button>
			</div>
			<div class="col-xs-6">
				<button class="btn btn-md btn_read_page btn_list" type="submit" id="btn_list">목록으로</button>
			</div>
		</div>
	</div>
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