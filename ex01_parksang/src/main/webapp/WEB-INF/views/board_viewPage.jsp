<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 한글 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap 4.0 -->
<link rel="stylesheet" href="/resources/css/bootstrap.css" />
<!-- jQuery -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Bootstrap Handlebar -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- Bootstrap Javascript -->
<!-- <script src="/resources/js/bootstrap.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


<script id="template" type="text/x-handlebars-template">
<table class="table table-bordered">
{{#each .}}
<tr class="replyLi" data-num={{num}}>
	<td class="timeline-item">
		<p class="timeline-header text-secondary font-weight-light">{{num}} - {{replyer}}<br>{{prettifyDate regdate}}</p>
		
		<p class="timeline-body font-weight-bold">{{replytext}}</p>
		
		<div class="timeline-footer">
			<a class="btn btn-light" role="button" data-toggle="modal" data-target="#modifyModal" id="test">댓글 수정</a>
			
		</div>
	</td>
</tr>
{{/each}}
</table>
</script>

<script>
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth() + 1;
	var date = dateObj.getDate();
	return year + "/" + month + "/" + date;
});

	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);

	}
</script>
<script>
	var id = ${boardVO.id};
	
	var replyPage = 1;

	$(document).ready(function() {
		//$("#test").click(function(){
			//alert("눌렸냐");
			//console.log("#test");
		//});
		function getPage(pageInfo) {
			$.getJSON(pageInfo, function(data) {
				printData(data.list, $("#repliesDiv"), $('#template'));
				printPaging(data.pageMaker, $(".pagination"));
				
				$("#modifyModal").modal('hide');
			});
		}
		
		var printPaging = function(pageMaker, target) {
			var str = "";
			
			if (pageMaker.prev) {
				str += "<li class='page-item'><a class='page-link' href='"+(pageMaker.startPage-1)+"'> << </a></li>";
			}
			
			for (var i=pageMaker.startPage, len=pageMaker.endPage; i <= len; i++) {
				var strClass = pageMaker.cri.page == i? ' active' : '';
				str += "<li class='page-item'"+strClass+"><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			}
			
			if (pageMaker.next) {
				str += "<li class='page-item'><a class='page-link' href='"+(pageMaker.endPage + 1)+"'> >> </a></li>";
			}
			
			target.html(str);
		}
		
		$("#repliesDiv").on("click", function() {
			
			if($(".timeline li").size() > 1) {
				return;
			}
			
			getPage("/replies/" + id + "/1");
		});
		
		$(".pagination").on("click", "li a", function(event) {
			event.preventDefault();
			replyPage = $(this).attr("href");
			//alert("id: " + id + "/replyPage: " +replyPage);
			getPage("/replies/" + id + "/" + replyPage);
		
		});
		
		$("#replyAddBtn").on("click", function() {
			
			var replyerObj = $("#newReplyWriter");
			var replytextObj = $("#newReplyText");
			var replyer = replyerObj.val();
			var replytext = replytextObj.val();
			
			$.ajax({
				type:'post',
				url:'/replies/',
				headers: {
					"Content-type": "application/json",
					"X-HTTP-Method-Override": "POST" },
				dataType: 'text',
				data: JSON.stringify({id:id, replyer:replyer, replytext:replytext}),
				success:function(result) {
					console.log("result:" + result);
					if (result == 'SUCCESS') {
						alert("댓글이 등록되었습니다.");
						replyPage = 1;
						getPage("/replies/" + id + "/" + replyPage);
						replyerObj.val("");
						replytextObj.val("");
					}
				}});
		});
		
		$(".timeline").on("click", ".replyLi", function(event){
			
			var reply = $(this);
			
			$("#replytext").val(reply.find('.timeline-body').text());
			$(".modal-title").html(reply.attr("data-num"));
		
		});
		
		$("#replyModBtn").on("click", function() {
			
			var num = $(".modal-title").html();
			var replytext = $("#replytext").val();
			//alert(comment_id);
			//alert(comment_content);
			
			$.ajax({
				type:'put',
				url:'/replies/'+num,
				headers: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "PUT" },
					data:JSON.stringify({replytext:replytext}), 
				dataType:'text',
				success:function(result) {
					console.log("result: " + result);
					if (result == 'SUCCESS') {
						alert("댓글이 수정되었습니다.");
						getPage("/replies/"+id+"/"+replyPage);
					}
			}});
		});
		
		$("#replyDelBtn").on("click", function() {
			
			var num = $(".modal-title").html();
			var replytext = $("#replytext").val();
			
			$.ajax({
				type:'delete',
				url:'/replies/'+num,
				headers: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "DELETE" },
				dataType:'text',
				success:function(result) {
					console.log("result: " + result);
					if (result == 'SUCCESS') {
						alert("댓글이 삭제되었습니다.");
						getPage("/replies/"+id+"/"+replyPage);
					}
			}});
		});
		
		
	});
</script>

<title>Insert title here</title>

</head>
<body>


<!-- BoardVO가 아니라 boardVO -->
<div class="container">
	<font size=7 color=black>
	게시판
	</font>	
	<br><br>

<table class="table table-hover">

<tr>
	<th width=20% class="table-active"><font size=4 color=white><p class="text-center">번호</p></font></th><td><font size=4>${boardVO.id}</font></td>
</tr>
<tr>
	<th class="table-active"><font size=4 color=white><p class="text-center">제목</p></font></th><td><font size=4>${boardVO.title}</font></td>
</tr>
<tr>
	<th class="table-active"><font size=4 color=white><p class="text-center">일자</p></font></th><td><font size=4>
	<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.date}" /></font></td>
</tr>
<tr>
	<th class="table-active"><font size=4 color=white><p class="text-center">내용</p></font></th><td><font size=4>${boardVO.content}</font></td>
</tr>
</table>
<script type="text/javascript">
function button_click(str){	
	if(str=="updateDB") {
		myForm.method='GET';
		myForm.action='board_updateForm';		
	}

	if(str=="deleteDB") {
		myForm.action='board_delete';
	}
	if(str=="relist") {
		alert('리스트');
		myForm.method='GET';
		myForm.action='board_listPage';		
	}
}
</script>
<form method='post' name="myForm">
<table width = 100%><!--글 수정 버튼, 삭제버튼-->

	<tr>
		<td width = 72%>
		<input type = "hidden" value="${boardVO.id}" name="id">
		<input type='hidden' name='page' value ="${cri.page}">
    	<input type='hidden' name='perPageNum' value ="${cri.perPageNum}">
		</td>
		<td width=7% align=right><button type="submit" class="btn btn-info" onclick='button_click("updateDB")'>수정</button></td>
		<td width=7% align=right><button type="submit" class="btn btn-info" onclick='button_click("deleteDB")'>삭제</button></td>	
		<td width=7% align=right><button type="submit" class="btn btn-info">답글</button></td>
		<td width=7% align=right><button type="submit" class="btn btn-info" onclick='button_click("relist")'>목록</button></td>
	</tr>

</table>
</form>
	<div class="row">
		<div class="col-md-12">

			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">ADD NEW REPLY</h3>
				</div>
				<div class="box-body">
					<label for="newReplyWriter">Writer</label> <input
						class="form-control" type="text" placeholder="USER ID"
						id="newReplyWriter"> <label for="newReplyWriter">Reply
						Text</label> <input class="form-control" type="text"
						placeholder="REPLY TEXT" id="newReplyText">

				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" class="btn btn-info" id="replyAddBtn">ADD REPLY</button>
				</div>
			</div>


			<!-- The time line -->
			<ul class="timeline">
				<!-- timeline time label -->
				<li class="time-label" id="repliesDiv"><span class="bg-green">Replies List </span></li>
			</ul>

			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

				</ul>
			</div>
		</div>
	</div>

	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
		
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title text-left"></h4>
					<h3></h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				
				<div class="modal-body" data-num>
					<p><input type="text" id="replytext" class="form-control"></p>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replyModBtn">수정</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
			
		</div>
		
	</div>
</div>

</body>
</html>