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
				<label>제목</label>
				<input type="text" name="boardTitle" placeholder="제목을 입력하세요">
			</div>
			<div>
				<label>내용</label>
				<textarea name="boardContent" rows="3" placeholder="내용..."></textarea>
			</div>
			<div>
				<label>작성자</label>
				<input type="text" name="boardWriter" placeholder="작성자를 입력하세요">
			</div>
		</div>
		<div>
			<button type="submit">등록하기</button>
		</div>
	</form>
</body>
</html>