<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../resources/css/login.css">
</head>
<body>
	<form action="/user/loginPost" method="post">
		<div class="row row_login">
			<div class="col-xs-6 col_login">
				<input type="text" class="input_id" name="userId" placeholder="아이디">
			</div>
			<div class="col-xs-6 col_login">
				<input type="password" class="input_pwd" name="userPwd" placeholder="비밀번호">
			</div>
			<div class="col-xs-6 col_login">
				<button type="submit" class="btn btn-md btn_login" id="btn_login">로그인</button>
			</div>
			<div class="col-xs-6 col_login" style="width: 120px">
				<input type="checkbox" name="useCookie">
				<span style="line-height: 36px;">&nbsp;로그인 유지</span>
			</div>
			<div class="col-xs-6 col_login" style="width: 200px">
				<a class="a_row_login" href="#" style="line-height: 36px;">아이디/비밀번호 찾기</a>
			</div>
		</div>
	</form>
</body>
</html>