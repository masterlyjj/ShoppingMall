<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="/resources/js/board.js" type="text/javascript"></script>
</head>
<body>





<button id="btn_reviewui_show">댓글쓰기</button> <br>




<div id="reviewContainer" style="display: none">
	작성자: <input id="member_id"><br>
	리뷰: <input id="review_content"><br>
평점 : <select id="review_grade">

<option value=5 selected>5점</option>

<option value=4>4점</option>

<option value=3>3점</option>

<option value=2>2점</option>

<option value=1>1점</option>

</select><br>
	<button id="btn_review_input">리뷰 완료</button>	
</div>








<script type="text/javascript">
var board_no = ${vo.board_no};

$(document).ready(function(){
	
	
	
	
	
	getRepliesPage(board_no, 1, $("#replies"));
	
	
	$("#replies").on("click", ".reply_page_left", function(event) {
		event.preventDefault();
		var curPage = $(this).attr("href");
		
		if(curPage > 1){
			
			getRepliesPage(board_no, --curPage, $("#replies"));
		}
		
		
	});
	
	$("#replies").on("click", ".reply_page_right", function(event) {
		event.preventDefault();
		var curPage = $(this).attr("href");
		var totalPage = $(this).attr("data-totalPage");
		
		
		
		if(curPage < totalPage){
			
			getRepliesPage(board_no, ++curPage, $("#replies"));
		}
		
		
	});
	
	
	$("#replies").on("click", ".reply_page_no", function() {
		var curPage = $(this).text();
		
		getRepliesPage(board_no, curPage, $("#replies"));
	});
	
	
	
	
	
	$("#replies").on("click", ".btn_review_delete", function() {
		var review_no = $(this).attr("data-review_no");
		
		$.ajax({
			type : "delete",
			url : "/replies/"+review_no,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : "text",
			success : function(result) {
				if(result == "SUCCESS"){
					alert("삭제되었습니다.");
					getAllReplies(board_no, $("#replies"));
				}
			}
		});
		
	});
	
	
	$("#btn_reviewui_update").click(function() {
		var review_no = $("#sp_reviewui_review_no").text();
		var review_grade = $("#div_reviewui_review_grade").val();
		var review_content = $("#div_reviewui_review_content").val();
		
		console.log(review_grade);
		console.log(review_content);
		
		$.ajax({
			type : "put",
			url : "/replies/"+review_no,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			dataType : "text",
			data : JSON.stringify({
				review_content : review_content,
				review_grade : review_grade
				
			}), 
			success : function(result) {
				if(result == "SUCCESS"){
					alert("수정되었습니다.");
					getAllReplies(board_no, $("#replies"));
				}
			}
		});
	});
	
	
	
	
	
	
	$("#replies").on("click", ".btn_review_updateui_form", function() {
		
		var review_no = $(this).attr("data-review_no");
		$("#sp_reviewui_review_no").text(review_no);
		
		var member_id = $(this).attr("data-member_id");
		$("#sp_reviewui_member_id").text(member_id);
		

		var review_grade = $(this).siblings(".review_grade").text();
		$("div_reviewui_review_grade").val(review_grade);
		
		var review_content = $(this).prev(".review_content").text();
		$("#div_reviewui_review_content").val(review_content);
	
		console.log(review_grade);
		console.log(review_content);
		
		
		$("#staticBackdrop").modal("show");
	});
	
	
	
	$("#btn_review_input").click(function() {
		var member_id = $("#member_id").val();
		var review_content = $("#review_content").val();
		var review_grade = $("#review_grade").val();
		
		if(member_id == ''){
			$("#member_id").focus();
			return;
		}
		
		if(review_content == ''){
			$("#review_content").focus();
			return;
		}
		
		if (review_grade == '') {
			$("review_grade").focus();
			return;
		}
	
		
		$.ajax({
			type : "post",
			url : "/replies",
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : "text",
			data : JSON.stringify({
				board_no : board_no,
				member_id : member_id,
				review_content : review_content,
				review_grade : review_grade
			}), 	
			success : function(result) {
				if(result=="SUCCESS"){
					$("#member_id").val("");
					$("#review_content").val("");
					$("#review_grade").val("");
					$("#reviewContainer").hide();
					
					getAllReplies(board_no, $("#replies"));
					
				}
				
			}
		});
		
		
	});
	

	$("#btn_reviewui_show").click(function() {
		$("#reviewContainer").toggle();
	});
	

	$("body").on("click", ".updateui", function() {
		location.assign("/board/updateui/${vo.board_no}/${curPage}");
	});
	
	
	
	
	
});

</script>



</body>
</html>