<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form role="form" method="post">
		<div>
			<div>
				<label>번호</label>
				<input type="text" name="boardNumber" value="${boardVO.boardNumber }" readonly="readonly">
			</div>
			<div>
				<label>제목</label>
				<input type="text" name="boardTitle" value="${boardVO.boardTitle }">
			</div>			
			<div>
				<label>내용</label>
				<textarea name="boardContent" rows="3">${boardVO.boardContent }</textarea>
			</div>
			<div>
				<label>작성자</label>
				<input type="text" name="boardWriter" value="${boardVO.boardWriter }" readonly="readonly">			
			</div>
		</div>
	</form>
	<div>
		<button type="submit" id="btn_save">저장</button>
		<button type="submit" id="btn_cancel">취소</button>
	</div>
</body>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		$("#btn_save").onclick(function() {
			formObj.submit();
		});
		
		$("#btn_cancel").onclick(function() {
			self.location = "/board/listAll";
		})
	});
</script>
</html>