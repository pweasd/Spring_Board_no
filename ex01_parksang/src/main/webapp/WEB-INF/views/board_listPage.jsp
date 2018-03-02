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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="/resources/js/bootstrap.min.js"></script>
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