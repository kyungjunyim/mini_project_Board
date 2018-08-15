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
	<input type="hidden" name="searchType" value="${cri.searchType }">
	<input type="hidden" name="keyword" value="${cri.keyword }">
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

<div>
	<div>
		<div>
			<div>
				<h3>댓글 등록</h3>
			</div>
			<div>
				<label>작성자</label>
				<input type="text" placeholder="작성자를 입력하세요" id="new_reply_writer">
				<label>내용</label>
				<input type="text" placeholder="내용" id="new_reply_text">
			</div>
			<div>
				<button type="submit" id="btn_add_reply">등록</button>
			</div>
		</div>
	</div>
</div>

<ul class="timeline">
	<li id="div_replies">
		<span>댓글 목록</span>
	</li>
</ul>
<div>
	<ul id="pagination"></ul>
</div>

</body>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script>
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);
		
		$("#btn_modify").on("click", function() {
			formObj.attr("action", "/sboard/modifyPage");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$("#btn_remove").on("click", function() {
			formObj.attr("action", "/sboard/removePage");
			formObj.submit();
		});
		
		$("#btn_list").on("click", function() {
			formObj.attr("method", "get");
			formObj.attr("action", "/sboard/list");
			formObj.submit();
		});
	});
</script>
<script id="template" type="text/x-handlebars-template">
	{{#each .}}
	<li class="li_reply" data-replyNumber={{replyNumber}}>
	<i class="fa fa-comments bg-blue"></i>
		<div>
			<span>
				<i class="fa fa-clock-o"></i>{{prettifyDate replyRegDate}}
			</span>
			<h3><strong>{{replyNumber}}</strong> -{{replyWriter}}</h3>
			<div>
				<a data-toggle="modal" data-target="#modifyModal">Modify</a>
			</div>
		</div>
	</li>
	{{/each}}
</script>
<script>
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObje.getDate();
		return year + "/" + month + "/" + date;
	});
	
	var printData = function(replyArr, target, templateObject) {
		var template = Handlebars.compile(templateObject.html());
		
		var html = template(replyArr);
		$(".li_reply").remove();
		target.after(html);
	}
</script>
<script>
	var boardNumber = ${boardVO.boardNumber };
	var replyPage = 1;
	
	function getPage(pageInfo) {
		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#div_replies"), $("#template"));
			printPaging(data.pageMaker, $("#pagination"));
			
			$("#modifyModal").modal("hide");
		});
	}
	
	var printPaging = function(pageMaker, target) {
		var str = "";
		
		if(pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1) + "'> << </a></li>";
		}
		
		for(var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li><a href='" + (pageMaker.endPage + 1) + "'> >> </a></li>";
		}
		
		target.html(str);
	}
</script>
<script>
	$("#div_replies").on("click", function() {
		if($(".timeline li").size() > 1) {
			return;
		}
		getPage("/replies/" + boardNumber + "/1");
	});
	
	$("#pagination").on("click", "li a", function(e) {
		e.preventDefault();
		replyPage = $(this).attr("href");
		getPage("/replies/" + boardNumber + "/" + replyPage);
	});
	$("#btn_add_reply").on("click", function() {
		var replyWriterObj = $("#new_reply_writer");
		var replyTextObj = $("#new_reply_text");
		var replyWriter = replyWriterObj.val();
		var replyText = replyTextObj.val();
		
		$.ajax({
			type: 'post',
			url: '/replies/',
			headers: {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "POST"
			},
			dataType= 'text',
		});
	});
</script>
</html>