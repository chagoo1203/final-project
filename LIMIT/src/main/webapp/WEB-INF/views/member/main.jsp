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
			<div class="product_list list_first">
				<div class="product_item"></div>
			</div>
		</div>
		<script>
		$(function(){
			topBoardList();
		})
		
		
		function topBoardList(){
			$.ajax({
				url : 'topList.pr',
				success : function(data){
					
					
					
				}, error : function(){
					console.log("실패");
				}
			})
		}
		
		</script>
	</div>	<jsp:include page="../common/footer.jsp" />
</body>
</html>