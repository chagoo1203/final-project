<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LIMIT</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
	#resellWrap{
        width : 1200px;
        overflow: auto;
        margin: 0 auto;
    }
     #shopMenu{
            font-weight: bold;
            font-size: 30px;
            cursor: pointer;
            margin-top : 10px;
            text-align: center;
        }
    .sizeWrap{
    	width : 700px;
    	height : 800px;
    	margin : auto;
    }
    .productInfo{
    	margin-top : 10px;
    }
    .name{
    	font-size : 20px;
    	text-align : center;
    }
    .content{
    	font-size : 18px;
    	font-weight : thin;
    	text-align : center;
    }
    .detailSize{
    	width : 230px;
    	height : 100px;
    	display : inline-block;
    	text-align : center;
    }	
    .buy{
    	width : 180px;
    	height : 80px;
    	margin : auto;
    }
    .paymentButton{
    	width : 700px;
    	margin : auto;
    }
    .payment{
    	width : 500px;
    	height : 100px;
    	margin-left : 100px;
    }
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	
	<div id="resellWrap">
	
		<div id="shopMenu">구매하기</div>
			<div class="productInfo">
				<p class="name">${p.productName}</p>
				<p class="content">${p.productContent}</p>
			</div>
			<div class="sizeWrap">
				<c:forEach var="s" items="${list}">
					<div class="detailSize">
						<button type="button" class="btn btn-outline-success buy">
						<p>${s.productSize}</p>
						<p>${s.resellPrice}</p>
						</button>
					</div>
				</c:forEach>
			</div>
			<div class="paymentButton">
				<input type="hidden" class="userId" name="userId" value="${loginUser.userId}">
				<input type="hidden" class="productName" name="productName" value="신발1">
				<input type="hidden" class="resellPrice" name="resellPrice" value="250000">
				<button type="button" class="btn btn-outline-success payment">결제하기</button>
			</div>
	</div>
	
	<script>
		$(function(){
			$('.paymentButton >.payment').click(function(){

				$.ajax({
					url : "kakaopay.resell",
					data : {userId : $('.userId').val(),
							productName : $('.productName').val(),
							resellPrice : $('.resellPrice').val()
					},
					dataType : 'json',
					success:function(data){
						//alert(data.tid);
						window.open(data.next_redirect_pc_url);
					},
					error:function(data){
						
					}
				
				})
			
			})
		})
	
	</script>
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>