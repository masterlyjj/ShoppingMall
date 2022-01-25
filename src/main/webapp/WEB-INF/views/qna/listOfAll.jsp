<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="/resources/js/file.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style type="text/css">
img {
	width: 100px;
	height: 100px;
}
</style>
</head>
<body>

	<jsp:include page="../header.jsp" />
	<jsp:include page="../sidebar.jsp" />
<div class="container" style=" font-size : small;">
<h4>QnA 목록</h4>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">이미지</th>
				<th scope="col">상품명</th>
				<th scope="col">QnA</th>
				<th scope="col">QnA 작성일</th>
				<th scope="col">비고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pt.list}" var="vo" varStatus="i">
				<tr>
					<td>${i.count}</td>
					<td><div data-item_no="${vo.item_no}" data-item_name="${vo.item_name}" data-file_name="${vo.file_name}" class="uploadedList${i.index}"></div></td>
					<td><a style="text-decoration: none; color: #000;" href="/item/read/${vo.item_no}">${vo.item_name}</a></td>
					<td>${vo.qna_title}</td>
					<td>${vo.qna_regdate}</td>
					<td>
						<a class="btn btn-outline-primary btn-sm" href="/qna/update/${vo.qna_no}">수정</a>
						<a class="btn btn-outline-primary btn-sm" class="delete" href="/qna/delete/${vo.qna_no}">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div style="margin-left: 40%">
	<jsp:include page="pageOfAll.jsp" />
	</div>
</div>
	<jsp:include page="../footer.jsp" />
<script type="text/javascript">
$(document).ready(function(){
	var vo ="${pt.list}";
	var arr = eval(vo);
	for(var i=0; i<arr.length; i++){
		var div_class = ".uploadedList"+i;
		var item_no = $(div_class).attr("data-item_no");
		var item_name = $(div_class).attr("data-item_name");
		var file_name = $(div_class).attr("data-file_name");
		var item = uploadedItemForRead(file_name,item_no);
		$(div_class).append(item);
	}
	
	$('.delete').click(function() { 
		var result = confirm('삭제 하시겠습니까?'); 
		if(result) { 
			var link = $(this).href;
			location.assign(link);
		} else { 
			event.preventDefault();
		} 
	}); 
	
});
</script>
</body>
</html>