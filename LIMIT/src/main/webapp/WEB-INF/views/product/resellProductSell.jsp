<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LIMIT</title>
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
	.imgList{
		
		width : 450px;
		height : 450px;
		margin-left : 75px;
		margin-top : 30px;
	}
	.productInfo{
		margin-top : 30px;
	}
	.brandName{
		font-size : 20px;
		font-weight : bold;
	}
	.productName{
		font-size : 18px;
	}
	.productContent{
		font-weight : lighter;
	}
	.detailSize{
		font-size : 14px;
	}
	.collectSize{
		padding-left : 350px;
	}
	.detailPrice{
		font-size : 14px;
	}
	.num{
		font-size : 20px;
		padding-left : 330px;
	}
	.productButton{
		margin-top : 30px;
		text-align : center;
	}
	.productButton > button{
		width : 270px;
		height : 70px;
		display : inline-block;
	}
	.interestProduct  button{
		width : 548px;
		margin-top : 10px;
	}
	.infoName{
		font-size : 18px; 
		font-weight : bold; 
		margin-left:50px; 
		margin-top:20px;
	}
	.priceGraph{
		height : 600px;
		margin-top : 30px;
	}
	#styleWrap{
	 	width : 1200px;
        overflow: auto;
        margin: 0 auto;
	}
	.styleInfo{
		width : 290px;
		height : 600px;
		display : inline-block;
		margin : auto;		
		margin-top : 20px;
	}

</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	
	
	<div id="resellWrap">
		
		<div class="container-fluid">
		  <div class="row">
		    <div class="resellImg">
		    
		    	<c:forEach var="a" items="${list}">
		    		<img class="imgList" src="${a.filePath}${a.changeName}">
		    	</c:forEach>
		    
		    </div>
		    <div class="resellInfo">
		    	<div class="productInfo">
		    		<p class="brandName">${p.brandName}</p>
		    		<p class="productName">${p.productName}</p>
		    		<p class="productContent">${p.productContent}</p>
		    	</div>
		    	<form id="insertSellProduct" method="get" action="insertSellProduct.resell">
		    	<input type="hidden" class="pno" name="productNo" value="${p.productNo}">
		    	<input type="hidden" class="userId" name="seller" value="${loginUser.userId}">
		    	<div class="detailSize">
		    		<span>사이즈</span>
		    		<input type="text" class="size" name="productSize" placeholder="판매하실 제품의 사이즈를 입력해주세요." required>
		    	</div>
		    	<hr>
		    	<div class="detailPrice">
		    		<span>최근 거래가</span>
		    		<input type="text" class="price" name="resellPrice" placeholder="판매하실 제품의 가격을 입력해주세요." required>
		    		<span>원</span>
		    	</div>
		    	<button type="submit">등록하기</button>
		    	</form>
		    	
		    	<hr>
		    	<h3 class="infoName">상품 정보</h3>
		    	<div class="detailInfo">
		    		<div>
		    			<span>모델 번호</span>
		    			<span>${p.modelNo}</span>
		    		</div>
		    		<div>
		    			<span>발매일</span>
		    			<span>${p.releaseDate}</span>
		    		</div>
		    		<div>
		    			<span>발매가</span>
		    			<span>${p.releasePrice}</span>
		    		</div>
		    	</div>
		    </div>
		  </div>
		</div>
	
	</div>
	
	<hr>
	
	
	
	<jsp:include page="../common/footer.jsp" />
	
	

</body>
</html>