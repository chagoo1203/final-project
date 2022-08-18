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
.resellImg{
		border-right : thin solid black;
		width : 600px;
		height : 100%;
		float : left;
		margin-top : 30px;
	}
	.resellInfo{
		height : 100%;
		width : 600px;
		margin-top : 30px;
		float : right;
	}
	.resellInfo > div{
		margin-left : 50px;
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
		<h3 align="center">주문 정보</h3>
		<div class="container-fluid">
		  <div class="row">
		    <div class="resellImg">
		    <p>${p.productName}</p>
		    <p>${p.productContent}</p>
		    <p>${ri.resellPrice}</p>
		    <p>${ri.productSize}</p>
		    </div>
		    <div class="resellInfo">
		    	<input type="text" class="recevierName" name="recevierName" value="${loginUser.userName}" required>
		    	<input type="text" class="recevierPhone" name="recevierPhone" value="${loginUser.phone}" required>
		    	<input type="text" class="recevierAddress" name="recevierAddress" value="${loginUser.address}" required>
		    	<input type="text" class="orderComment" name="orderComment" value="" required> 
		    </div>
		   </div>
		  </div>
	
	</div>
	
	<div class="paymentButton">
		<input type="hidden" class="buyer" name="buyer" value="${loginUser.userId}">
		<input type="hidden" class="seller" name="seller" value="${ri.seller}">
		<input type="hidden" class="payment" name="payment" value="${ri.resellPrice}">
		<input type="hidden" class="resellNo" name="resellNo" value="${ri.resellNo}">
		<input type="hidden" class="productNo" name="productNo" value="${p.productNo}">
		<input type="hidden" class="productName" name="productName" value="${p.productName}">
		<button type="button" class="btn btn-outline-success payment">결제하기</button>
	</div>
			
	<script>
		$(function(){
			$('.paymentButton >.payment').click(function(){

				$.ajax({
					url : "kakaopay.resell",
					data : {recevierName : $('.recevierName').val(),
						    recevierPhone : $('.recevierPhone').val(),
						    recevierAddress : $('.recevierAddress').val(),
						    orderComment : $('.orderComment').val(),
						    payment : $('.payment').val(),
						    productNo : $('.productNo').val(),
						    resellNo : $('.resellNo').val(),
						    buyer : $('.buyer').val(),
						    seller : $('.seller').val(),
						    productName : $('.productName').val()
					},
					dataType : 'json',
					success:function(data){
						//alert(data.tid);
						window.open(data.next_redirect_pc_url, "결제중", "width=900, height=900, top=100, left=100");
						location.href="paymentResult.resell";
					},
					error:function(data){
						alert("결제에 실패했습니다. 다시 시도해주세요.");
					}
				
				})
			
			})
		})
	
	</script>
	
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>