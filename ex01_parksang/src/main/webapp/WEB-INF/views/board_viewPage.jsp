<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script><!-- 핸들러 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
function button_click(str){	
	if(str=="updateDB") {
		alert('업데이트');
		myForm.method='GET';
		myForm.action='board_updateForm';	//form이름.action='버튼눌렀을때 가고싶은 페이지'		
	}

	else if(str=="deleteDB"){
		myForm.action='board_delete';
	}
	//else if(str=="reply"){
		//myForm.action='reply.jsp';
	//}
	else if(str=="relist") {
		alert("목록");
		myForm.method='GET';
		myForm.action='board_listPage';
	}

}
</script>
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-num={{num}}>
<i class="fa fa-comments bg-blue"></i>
 <div class="timeline-item" >
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
  </span>
  <h3 class="timeline-header"><strong>{{num}}</strong> -{{replyer}}</h3>
  <div class="timeline-body">{{replytext}} </div>
    <div class="timeline-footer">
     <a class="btn btn-info btn-xs" 
	    data-toggle="modal" data-target="#modifyModal">Modify</a>
    </div>
  </div>			
</li>
{{/each}}
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
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body" data-num>
        <p><input type="text" id="replytext" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
        <button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>   
</div>
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

	var id = ${boardVO.id};
	
	var replyPage = 1;

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
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}

		target.html(str);
	};

	$("#repliesDiv").on("click", function() {

		if ($(".timeline li").size() > 1) {
			return;
		}
		getPage("replies/" + id + "/1");

	});
	

	$(".pagination").on("click", "li a", function(event){
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		getPage("replies/"+id+"/"+replyPage);
		
	});
	

	$("#replyAddBtn").on("click",function(){
		 
		 var replyerObj = $("#newReplyWriter");
		 var replytextObj = $("#newReplyText");
		 var replyer = replyerObj.val();
		 var replytext = replytextObj.val();
		
		  
		  $.ajax({
				type:'post',
				url:'replies/',
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "POST" },
				dataType:'text',
				data: JSON.stringify({id:id, replyer:replyer, replytext:replytext}),
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("등록 되었습니다.");
						replyPage = 1;
						getPage("replies/"+id+"/"+replyPage );
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
	
	

	$("#replyModBtn").on("click",function(){
		  
		  var num = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'put',
				url:'replies/'+num,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({replytext:replytext}), 
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						getPage("replies/"+id+"/"+replyPage );
					}
			}});
	});

	$("#replyDelBtn").on("click",function(){
		  
		  var num = $(".modal-title").html();
		  var replytext = $("#replytext").val();
		  
		  $.ajax({
				type:'delete',
				url:'replies/'+num,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "DELETE" },
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("삭제 되었습니다.");
						getPage("replies/"+id+"/"+replyPage );
					}
			}});
	});
	
</script>


<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "/sboard/modifyPage");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	$("#removeBtn").on("click", function(){
		formObj.attr("action", "/sboard/removePage");
		formObj.submit();
	});
	
	$("#goListBtn ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/sboard/list");
		formObj.submit();
	});
	
});
</script>



</body>
</html>