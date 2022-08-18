<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리셀 상품 리스트</title>
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
     .resellList{
     		width : 900px;
     		margin : auto;
     		margin-top : 0px;
     		height : 100%;
     }
     .resellList div{
     
     
     }
     .thumbnail{
     		width : 225px;
     		margin : auto;
     		float : left;
     		box-sizing : border-box;
     }
     .thumbnail > img{
     		width : 200px;
     		height : 200px;
     		margin : auto;
     		display : inline-block;
     }
     .productInfo{
     	margin-left : 15px;
     
     }
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	
		<div id="resellWrap">
	
		<div id="shopMenu">Shop</div>
		
        <div align="right">
			<select id="changeFilter" name="option">
				<option value="기본">기본</option>
				<option value="조회수">조회수</option>
				<option value="좋아요">좋아요</option>
				<option value="판매량">판매량</option>
				<option value="발매일자">발매일자</option>
			</select>
		</div>
        
        <jsp:include page="resellBoardFilter.jsp" />
        
		    <div class="resellList" >
		    	
		    	<c:forEach var="b" items="${list}">
		    	<div class="thumbnail" align="center">
					<img class="resellThumbnail" src="${b.titleImg}">
					<div class="productInfo" align="left">
						<input type="hidden" name="productNo" class="pno" value="${b.productNo}">
						<p class="brand">${b.brandName}</p>
						<p class="name">${b.productName}</p>
						<p class="translatedName">${b.productContent}</p>
						<p class="price">${b.resellPrice}</p>
						<P>♥ ${b.likes}</P>
					</div>    	
		    	</div>
		    	</c:forEach>
		    	
	    	</div>
		  </div>
		  
		  <script>
            	$(function(){
					$('.resellList>div').click(function(){
						location.href = 'resellDetail.resell?pno=' + $(this).children().children('.pno').val();			
					})
            	})
            	
            	$("select[name=option]").change(function(){
            		location.href = 'resellList.resell?option=' + $(this).val();
            	})
            </script>
        
	
	<jsp:include page="../common/footer.jsp" />
	

</body>
</html>