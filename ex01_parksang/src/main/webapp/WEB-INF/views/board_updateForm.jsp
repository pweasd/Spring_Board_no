<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
function button_click(str){	
	if(str=="write") {
		myForm.method='GET';
		myForm.action='board_update';	//form이름.action='버튼눌렀을때 가고싶은 페이지'		
	}
	else if(str=="no") {
		myForm.method='GET';
		myForm.action='board_listPage';		
	}
}
</script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
<form method='post' action="board_update">
<table class="table table-striped table-bordered">
	<tr>
		<td>번호</td>
		<td><input type="hidden" name="id" value="${boardVO.id}">${boardVO.id}</td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type = "text" name = "title" value="${boardVO.title}" required></td>
	</tr>
	<tr>
		<td>일자</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.date}" /></td>
	</tr>
	<tr>
		<td>조회수</td><td>${boardVO.view}</td>
	</tr>
	<tr>
		<td>내용</td><!--내용칸 공간지정,빈칸 방지-->
		<td><textarea body style="resize:none;width:100%; overflow-x:hidden; overflow-y:auto;" name="content" cols="100" rows="13" required>${boardVO.content}</textarea></td>
	</tr>
</table>
<table width = 100%>
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
	<tr><!--쓰기버튼,취소버튼-->
		<td align=right width=90%><input type="submit" value="쓰기" class="btn btn-info" onclick="button_click(write)"></td>
		<td align=right><input type="submit" value="취소" class="btn btn-info" onclick="button_click(no)"></td>			
	</tr>

</table>
</form>	
</div>
</body>
</html>