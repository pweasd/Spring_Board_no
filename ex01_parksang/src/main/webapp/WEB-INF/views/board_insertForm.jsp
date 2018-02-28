<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
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