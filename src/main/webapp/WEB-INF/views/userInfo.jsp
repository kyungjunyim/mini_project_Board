<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../resources/css/userInfo.css">
</head>
<body>
	<form action="/user/logout" method="post">
		<div class="row row_login">
			<div class="col-xs-6 col_login">
				<span style="line-height: 36px;">${sessionScope.login.userName }님 환영합니다!</span>
			</div>
			<div class="col-xs-6 col_login">
				<button type="submit" class="btn btn-md btn_login" id="btn_login">로그아웃</button>
			</div>
			<div class="col-xs-6 col_login" style="width: 200px">
				<a class="a_row_login" href="#" style="line-height: 36px;">정보 수정</a>
			</div>
		</div>
	</form>
</body>
</html>