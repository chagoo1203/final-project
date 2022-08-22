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
        background-color: white;
        width: 1500px;
        margin:auto;
  }
  .innerOuter {
        border:1px solid lightgray;
        width:80%;
        margin:auto;
        padding:5% 5%;
        background-color: white;
  }
  .list_detail {
  		width : 260px;
  		height : 380px;
 		float : left;
  		margin : auto;
  		border-radius : 6px;
  		
  }
  .list_detail:hover {
  		cursor:pointer;
	  	background-color : #F9CACA ;
	  	border-radius : 6px;	
  }
  .list_detail > img{
  		display: block; 
  		margin: 0px auto;
  		height: 250px;
  }
  .product_list{
	  	width : 100%;
	  	height : 820px;
  }
  .list_detail > p{
  	    margin : 0px;
  }
  .likesCountWrap{
  	    display : inline-block;
  }
  #thumbnail{
  		width : 250px;
  		border-radius : 6px;
  		
  }
  .text > input{
  		width : 500px;
		margin : auto;
		display : inline;
  }
  .text > select{
  		width : 120px;
  }
  #count{
  		margin-left : 20px;
  }
  #searchButton{
  		width : 75px;
  		display : inline;
  		margin-bottom : 5px;
  }
  
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="content">
		<br><br>
		<div class="innerOuter">
			<h4>최신 상품</h4>
			<br clear="both"><br>
			<form name="search-form" action="getSearchProduct.pr" >
                <div class="text" align="center">
                	 <input type="hidden" name="currentPage" value="1">
                	 <select class="custom-select" name="condition" style="margin-bottom:4px">
                        <option value="brandName">브랜드명</option>
                        <option value="collectionName">컬렉션명</option>
                        <option value="productName">상품명</option>
                    </select>
                    <input type="text" class="form-control" name="keyword" >
                	<button type="submit" id="searchButton" class="searchBtn btn btn-secondary">검색</button>
                </div>
			</form>
			<table></table>
            
            
			<br>
			<a href="resellList.resell" style="float:right; color:lightgrey;">>>더보기</a>
			<br>
			<br clear="both">
			<div class="product_list list_first">
				<div id="product_item"></div>
			</div>
		</div>
		<script>
			$(function(){
				topBoardList();
				$(document).on("click","#product_item > div", function(){
		            location.href="resellDetail.resell?pno=" + $(this).children().eq(0).val();
		        });
			})
			
			
			function topBoardList(){
				$.ajax({
					url : 'topList.pr',
					success : function(data){
						let value=''
						var j = 8;
						if(data.length < 8){
							j = data.length;
						}
						for( var i = 0 ; i < j ; i ++ ){
							value += '<div class="list_detail">'
								   + '<input type="hidden" name="productNo" value="' + data[i].productNo + '">'
								   + '<img id="thumbnail" src="' + data[i].titleImg + '">'
								   + '<p>' + data[i].brandName + '</p>'
								   + '<p>' + data[i].productName + '</p>'
								   + '<p>' + data[i].releasePrice + '</p>'
								   + '<p class = "likesCountWrap" id="likes">♥ ' + data[i].likes + '</p>'
								   + '<p class = "likesCountWrap" id="count">Count ' + data[i].count + '</p>'
								   + '</div>'
						}
						$('#product_item').html(value);
						
					}, error : function(){
						console.log("실패");
					}
				})
			}
			
		</script>

	</div>	
	<br clear="both">
	<jsp:include page="../common/footer.jsp" />
</body>
</html>