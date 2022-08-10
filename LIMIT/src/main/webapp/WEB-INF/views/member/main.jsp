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
            padding:5% 5%;
            background-color:white;
        }
  #list_detail {
  		border : 1px solid lightgray;
  		width : 320px;
  		height : 400px;
  		display : inline-box;
  		margin : 0 0 ;
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
				<div id="product_item"></div>
			</div>
		</div>
		<script>
		$(function(){
			topBoardList();
			$(document).on("click","#product_item > div", function(){
	            location.href="#?pno=" + $(this).children().eq(0).val();
	        });
		})
		
		
		function topBoardList(){
			$.ajax({
				url : 'topList.pr',
				success : function(data){
					let value=''
					for(let i in data){
						value += '<div id="list_detail">'
							   + '<input type="hidden" name="productName" value="' + data[i].productNo + '">'
							   + '<img src="' + data[i].titleImg + '">'
							   + '<p>' + data[i].brandName + '</p>'
							   + '<p>' + data[i].productName + '</p>'
							   + '<p>' + data[i].releasePrice + '</p>'
							   + '<p>' + data[i].likes + '</p>'
							   + '<p>' + data[i].count + '</p>'
							   + '</div>'
					}
					$('#product_item').html(value);

				}, error : function(){
					console.log("실패");
				}
			})
		}
		
		</script>
	</div>	<jsp:include page="../common/footer.jsp" />
</body>
</html>