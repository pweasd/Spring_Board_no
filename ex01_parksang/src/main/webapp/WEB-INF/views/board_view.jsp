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
		if(str=="updateDB") myForm.action='board_updateForm';	//form이름.action='버튼눌렀을때 가고싶은 페이지'
		if(str=="deleteDB") myForm.action='board_delete';
		if(str=="reply") myForm.action='reply.jsp';
}
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
<form method='post' name="myForm">
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
<table width = 100%><!--글 수정 버튼, 삭제버튼-->
	<tr>
		<td width = 72%>
		<input type = "hidden" value="${boardVO.id}" name="id">
		</td>
		<td width=7% align=right><input type="submit" value="수정" align =right class="btn btn-info" onclick='button_click("updateDB")'></td>
		<td width=7% align=right><input type="submit" value="삭제" class="btn btn-info" onclick='button_click("deleteDB")'></td>	
		<td width=7% align=right><input type="submit" value="답글" class="btn btn-info" onclick='button_click("reply")'></td>
</form>
<form action="list">		
		<!-- <input type=hidden value= name="num"> -->
		<td width=7% align=right><button type="submit" class="btn btn-info pull-right">목록</button></td>
	</tr>
</form>
</table>	
</div>
</body>
</html>