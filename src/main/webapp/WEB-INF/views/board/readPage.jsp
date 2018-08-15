<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form role="form" action="modifyPage" method="post">
	<input type="hidden" name="boardNumber" value="${boardVO.boardNumber }">
	<input type="hidden" name="page" value="${cri.page }">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
</form>

<div>
	<div>
		<div>
			<label>제목</label>
			<input type="text" name="boardTitle" value="${boardVO.boardTitle }" readonly="readonly">
		</div>
		<div>
			<label>내용</label>
			<textarea name="boardContent" rows="3" readonly="readonly">${boardVO.boardContent }</textarea>
		</div>
		<div>
			<label>작성자</label>
			<input type="text" name="boardWriter" value="${boardVO.boardWriter }" readonly="readonly">
		</div>		
	</div>
</div>

<div>
	<button type="submit" id="btn_modify">수정</button>
	<button type="submit" id="btn_remove">삭제</button>
	<button type="submit" id="btn_list">목록으로</button>
</div>

</body>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);
		
		$("#btn_modify").onclick(function() {
			formObj.attr("action", "/board/modifyPage");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$("#btn_remove").onclick(function() {
			formObj.attr("action", "/board/removePage");
			formObj.submit();
		});
		
		$("#btn_list").onclick(function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/board/listPage");
			formObj.submit();
		});
	});
	
</script>
</html>