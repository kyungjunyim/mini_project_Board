<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
		<td><a href='/board/read?boardNumber=${boardVO.boardNumber }'>${boardVO.boardTitle }</a></td>
		<td>${boardVO.boardWriter }</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.boardRegDate }" /></td>
		<td><span>${boardVO.boardViewCnt }</span></td>
	</tr>
	</c:forEach>
</table>
</body>
<script>
	var result = "${msg}";
	if(result == "success") {
		alert("처리가 완료되었습니다.");
	}
</script>
</html>