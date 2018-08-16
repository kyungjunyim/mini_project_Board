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
<link rel="stylesheet" href="../../resources/css/register.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="my_contents">
		<form role="form" method="post">
			<div class="row row_register">
				<div class="col-xs-6 col_label">
					<label class="label_register">제목</label>
				</div>
				<div class="col-xs-6">
					<input type="text" class="input_title" name="boardTitle" placeholder="제목...">
				</div>
			</div>
			<div class="row row_register">
				<div class="col-xs-6 col_label">
					<label class="label_register">내용</label>
				</div>
				<div class="col-xs-6">
					<textarea name="boardContent" class="input_content" placeholder="내용..."></textarea>
				</div>
			</div>
			<div class="row row_register">
				<div class="col-xs-6 col_label">
					<label class="label_register">작성자</label>
				</div>
				<div class="col-xs-6">
					<input type="text" class="input_writer" name="boardWriter" value="${sessionScope.login.userId }" readonly>
				</div>
				<div class="col-xs-6">
					<button class="btn btn-md btn_new" type="submit">등록하기</button>
				</div>
			</div>				
		</form>
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
					self.location = "register";
				});
			});
</script>
</body>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="../../resources/js/bootstrap.js"></script>
</html>