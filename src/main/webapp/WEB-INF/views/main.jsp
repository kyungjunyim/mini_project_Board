<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../resources/css/main.css">
</head>
<body>
	<div>
		<div class="row row_my_contents">
			<div class="col-xs-6 my_contents_half">
				<div class="contents_title">인기 게시물</div>
				<br>
				<div>
					<table class="table table-hover">
						<c:forEach items="${hotBoardList }" var="hotBoardVO">
							<tr id="${hotBoardVO.boardNumber }">
								<td class="td_board_number">${hotBoardVO.boardNumber }</td>
								<td class="td_board_title"><span class="span_truncate">${hotBoardVO.boardTitle }</span></td>
								<td class="td_board_writer"><span class="span_truncate">${hotBoardVO.boardWriter }</span></td>
								<td class="td_board_reg_date">${hotBoardVO.boardRegDate }</td>
								<td class="td_board_view_cnt"><span class="badge my_badge">${hotBoardVO.boardViewCnt }</span></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div class="col-xs-6 my_contents_half">
				<div class="contents_title">새로올라온 게시물</div>
				<br>
				<div>
					<table class="table table-hover">
						<c:forEach items="${newBoardList }" var="newBoardVO">
							<tr id="${newBoardVO.boardNumber }">
								<td class="td_board_number">${newBoardVO.boardNumber }</td>
								<td class="td_board_title"><span class="span_truncate">${newBoardVO.boardTitle }</span></td>
								<td class="td_board_writer"><span class="span_truncate">${newBoardVO.boardWriter }</span></td>
								<td class="td_board_reg_date">${newBoardVO.boardRegDate }</td>
								<td class="td_board_view_cnt"><span class="badge my_badge">${newBoardVO.boardViewCnt }</span></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<div class="row row_my_contents">
			<div class="col-xs-6 my_contents">
				<div class="contents_title">인기 사진</div>
				<br>
				<div class="row">
					<div class="col col_img">
						<img src="../../resources/images/img_01.jpg" class="img_main">
						<div class="text_img">
							임경준님&nbsp;&nbsp;<span class="badge my_badge">32</span>
						</div>
					</div>
					<div class="col col_img">
						<img src="../../resources/images/img_02.jpg" class="img_main">
						<div class="text_img">
							임경준님&nbsp;&nbsp;<span class="badge my_badge">32</span>
						</div>
					</div>
					<div class="col col_img">
						<img src="../../resources/images/img_03.jpg" class="img_main">
						<div class="text_img">
							임경준님&nbsp;&nbsp;<span class="badge my_badge">32</span>
						</div>
					</div>
					<div class="col col_img">
						<img src="../../resources/images/img_04.jpg" class="img_main">
						<div class="text_img">
							임경준님&nbsp;&nbsp;<span class="badge my_badge">32</span>
						</div>
					</div>
					<div class="col col_img">
						<img src="../../resources/images/img_05.jpg" class="img_main">
						<div class="text_img">
							임경준님&nbsp;&nbsp;<span class="badge my_badge">32</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$("tr").on("click",	function() {
				var boardNumber = this.id;
				self.location = "freeBoard/readPage?page=1&perPageNum=10&searchType&keyword=&boardNumber=" + boardNumber;
			});
</script>
</html>