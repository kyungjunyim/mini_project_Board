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
<link rel="stylesheet" href="../../resources/css/modifyPage.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="my_contents">
		<form role="form" action="modifyPage" method="post">
			<input type="hidden" name="page" value="${cri.page }">
			<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
			<input type="hidden" name="searchType" value="${cri.searchType }">
			<input type="hidden" name="keyword" value="${cri.keyword }">
			<input type="hidden" name="boardNumber" value="${boardVO.boardNumber }">
			
			<div class="row row_register">
				<div class="col-xs-6 col_label">
					<label class="label_register">제목</label>
				</div>
				<div class="col-xs-6">
					<input type="text" class="input_title" name="boardTitle" value="${boardVO.boardTitle }">
				</div>
			</div>
			<div class="row row_register">
				<div class="col-xs-6 col_label">
					<label class="label_register">내용</label>
				</div>
				<div class="col-xs-6">
					<textarea name="boardContent" class="input_content">${boardVO.boardContent }</textarea>
				</div>
			</div>
			<div class="row row_register">
				<div class="col-xs-6 col_label">
					<label class="label_register">작성자</label>
				</div>
				<div class="col-xs-6">
					<input type="text" class="input_writer" name="boardWriter" value="${boardVO.boardWriter }" readonly>
				</div>
				<div class="col-xs-6">
					<button class="btn btn-md btn_save" type="submit" id="btn_save">저장</button>
				</div>
				<div class="col-xs-6">
					<button class="btn btn-md btn_cancel" type="submit" id="btn_cancel">취소</button>
				</div>
			</div>		
		</form>
	</div>
</body>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");

		console.log(formObj);

		$("#btn_save").on("click", function() {
			formObj.submit();
		});

		$("#btn_cancel").on("click",function() {
			self.location = "/freeBoard/list?page=${cri.page }&perPageNum=${cri.perPageNum }"
					+ "&searchType=${cri.searchType }&keyword=${cri.keyword }";
		});
	});
</script>
</body>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="../../resources/js/bootstrap.js"></script>
</html>