<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Insert title here</title>
</head>
<body>
<div class="container">
<form method='post' action="board_write"> <!-- enctype="multipart/form-data" -->
<table class="table table-hover">
<tbody>
	<tr>
		<th class="table-active"><font color=white>번호</font></th>
		<td>신규</td>
		<!-- <input type=hidden value= name="num"> -->
	</tr>
	<tr>
		<th class="table-active"><font color=white>제목</font></th>
		<td><input type = "text" name ="title" autofocus required></td>
	</tr>
	<tr>
		<th class="table-active"><font color=white>일자</font></th>
		<td>${datetime}</td>
	</tr>
	<tr>
		<th class="table-active"><font color=white>내용</font></th><!--내용에 들어가는 스크롤바 중 가로 스크롤바 숨기고 세로 스크롤바 오토-->
		<td><textarea body style="resize:none;width:100%; overflow-x:hidden; overflow-y:auto;" name="content" cols="100" rows="13" required></textarea></td>
	</tr>
	<tr>
		<th class="table-active"><font color=white>첨부파일</font></th><!--첨부파일 3개-->
		<td>
		<input type="file" name="uploadFile" id="uploadFile"> 
		<input type="file" name="uploadFile2" id="uploadFile2">
		<input type="file" name="uploadFile3" id="uploadFile3">
		</td>			
	</tr>
</tbody>
</table>
<table width = 100% border = 0>
<tr>
<td align=right width=90%><button type="submit" class="btn btn-info">쓰기</button></td>
</form>
<form action="list">
<td align=right width=10%><button type="submit" class="btn btn-info">취소</button></td>
</tr>
</form>
</table>
</div>
</body>
</html>