<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
<title>게시판</title>
</head>
<body>
<div class="container">
	<font size=7 color=black>게시판</font><br><br>
	
	<table class="table table-hover">
	<thead>
		<tr>
			<th>
			<font size=4 color=white>번호</font>
			</th>
			<th>
			<font size=4 color=white>제목</font>
			</th>
			<th>
			<font size=4 color=white>등록일</font>
			</th>
			<th>
			<font size=4 color=white>조회수</font>
			</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="list">
		<tr>
			<td width=15% style="text-align:center;">
			<b>${list.id}</b>			
			</td>
			<td><a href='board_view?id=${list.id}'>
			<font size=4>${list.title}</font>
			</a></td>
			<td width=20% style="text-align:center;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${list.date}" /></td>
			<td width=10% style="text-align:center;">${list.view}</td>
		</tr>
		</c:forEach>
	</tbody>
	</table>
<hr/>
<form method='post' action="board_insertForm">
	
		<!-- <input type=hidden value= name="num"> -->
		<button type="submit" class="btn btn-info float-right">글쓰기</button>	
	
</form>	
	<div class="center-block">
		<ul class="pagination justify-content-center">
			<li class="page-item"><a href="#" class="page-link">1</a></li>
			<li class="page-item"><a href="#" class="page-link">2</a></li>
			<li class="page-item"><a href="#" class="page-link">3</a></li>
			<li class="page-item"><a href="#" class="page-link">4</a></li>
			<li class="page-item"><a href="#" class="page-link">5</a></li>
		</ul>
	</div>
</div>

<script src="js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</body>
</html>