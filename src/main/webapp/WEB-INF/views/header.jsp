<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JUN's BOARD</title>
<link rel="stylesheet" href="../../resources/css/header.css">
</head>
<body>
	<div class="pos-f-t">
		<nav class="navbar navbar-light my_nav">
			<a class="navbar-brand" href="/">JUN's BOARD</a>
			<ul class="navbar-nav mr-auto my_navbar_nav">
				<li class="nav-item my_nav_item"><a
					class="nav-link my_nav_link" href="/freeBoard/list" id="freeBoard">자유 게시판</a></li>
				<li class="nav-item my_nav_item"><a
					class="nav-link my_nav_link" href="#" id="gallery">사진 갤러리</a></li>
				<li class="nav-item my_nav_item"><a
					class="nav-link my_nav_link" href="#" id="info">문의 하기</a></li>
			</ul>
			<button class="btn btn-md btn_register" type="button">회원 가입</button>
			<button class="navbar-toggler my_navbar_toggler" type="button"
				data-toggle="collapse" data-target="#navbarToggleExternalContent"
				aria-controls="navbarToggleExternalContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</nav>
		<div class="collapse" id="navbarToggleExternalContent">
			<div class="p-4 my_sub_menu">
				<jsp:include page="login.jsp" />
			</div>
		</div>
	</div>
</body>
</html>