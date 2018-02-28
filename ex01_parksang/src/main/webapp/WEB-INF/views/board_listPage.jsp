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
<script src="/resources/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
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
			<td><a href='board_viewPage${pageMaker.makeQuery(pageMaker.cri.page)}&id=${list.id}'>
			<font size=4>${list.title}</font>
			</a></td>
			<td width=20% style="text-align:center;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${list.date}" /></td>
			<td width=10% style="text-align:center;"><span class="badge bg-red">${list.view}</span></td>
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
		<c:if test ="${pageMaker.prev}">
			<li class="page-item"><a href="board_listPage?page=${pageMaker.startPage - 1}" class="page-link">&laquo;</a></li>
		</c:if>
		
		<c:forEach begin="${pageMaker.startPage}" 
		end="${pageMaker.endPage}" var="idx">
			<li class="page-item"
				<c:out value="${pageMaker.cri.page == idx?'class = active':''}"/>>
				<a href="board_listPage?page=${idx}" class="page-link">${idx}</a>
			</li>
		</c:forEach>
		
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li class="page-item"><a href="board_listPage?page=${pageMaker.endPage + 1}" class="page-link">&raquo;</a></li>
		</c:if>
		</ul>
	</div>
</div>

</body>
</html>