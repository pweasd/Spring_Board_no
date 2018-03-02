<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="/resources/js/bootstrap.min.js"></script>
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