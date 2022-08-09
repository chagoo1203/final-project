<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<style>
.content {
            background-color:white;
            width: 1500px;
            margin:auto;
        }
 .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="content">
		<br><br>
		<div class="innerOuter">
			<h4>최신 상품</h4>
			<br>
			<a href="list.pr" style="float:right; color:lightgrey;">>>더보기</a>
			<br>
			<table id="boardList" class="table table-hover" align="center">
			<thead>
				<tr>
					<th>상품 이름</th>	
					<th>작성자</th>	
					<th>조회수</th>	
					<th>작성일</th>	
					<th>첨부파일</th>	
				</tr>
			</thead>
			<tbody>
				<!-- 현재 조회수가 가장 높은 상위 5개의 게시글 조회해서 뿌리기(ajax를 이용해서) -->
			</tbody>
			</table>
		</div>
		<script>
			
		</script>
	</div>	<jsp:include page="../common/footer.jsp" />
</body>
</html>