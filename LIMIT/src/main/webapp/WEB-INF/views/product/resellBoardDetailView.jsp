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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js" integrity="sha512-ElRFoEQdI5Ht6kZvyzXhYG9NqjtkmlkfYk0wr6wHxU9JEHakS7UJZNeml5ALk+8IKlU6jDgMabC3vkumRokgJA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
	 	height: auto;
	 	margin : auto;
	}
	#styleWrap > div {
		float : left;
	}
	.styleInfo{
		width : 290px;
		height : 600px;
		display : inline-block;
		margin : auto;		
		margin-top : 20px;
	}
	.style{
           
            width: 20%;
            height: auto;
            text-align: center;
            cursor: pointer;
            border: 1px solid black;
            border-radius:10px;
            margin: 10px;
            margin-left: 40px;
            display : inline-block;
    }
    .style > img{
        width: auto;
        height: auto;
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
		    	<div class="detailSize">
		    		<span>사이즈</span>
		    		<span class="collectSize">모든 사이즈 ▽</span>
		    	</div>
		    	<hr>
		    	<div class="detailPrice">
		    		<span>최근 거래가</span>
		    		<span class="num">${p.resellPrice}</span>
		    		<span>원</span>
		    	</div>
		    	<div class="productButton">
		    		<button type="button" class="btn btn-outline-success buy">구매</button>
		    		<input type="hidden" class="pno" name="productNo" value="${p.productNo}">
		    		<c:if test="${loginUser.userId != null}">
		    		<button type="button" class="btn btn-outline-danger sell">판매</button>
		    		</c:if>
		    	</div>
		    	<c:if test="${loginUser.userId != null}">
		    	<div class="interestProduct">
		    		<form id="insertInterest" method="get" action="">
		    			<input type="hidden" class="userId" name="userId" value="${loginUser.userId}">
		    			<input type="hidden" class="pno" name="productNo" value="${p.productNo}">
			    		<button type="submit" class="btn btn-outline-warning interest");">관심 상품 ${p.likes}</button>
		    		</form>
		    	</div>
		    	</c:if>
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
		    	<div class="priceGraph">
		    		시세 그래프
		    		<br>
		    		<button type="button" id="week">1주일</button>
		    		<button type="button" id="month">한 달</button>
		    		<button type="button" id="year">1년</button>
		    		<canvas id="line-chart" width="550" height="350"></canvas>
		    	</div>
		    </div>
		  </div>
		</div>
	
	</div>
	
	<hr>
	
	<div id="styleWrap">
		<h3 class="infoName">스타일</h3>
			<c:forEach var="s" items="${ listStyle }">
	            <div class="style">
	            	<input type="hidden" value="${ s.styleNo }">
	                <img src="${ s.titleImg }" style="width:210px; height:200px">
	                <p>${ s.nickname }</p>
	                <p>${ s.styleContent }</p> 
	                <p>♥ ${ s.like } 개</p>
	                <p>조회수 ${s.count }</p>
	                <ul>
	 
	              
	                	<c:forEach var="p" items="${ s.tag }">
		                    <li>
		                        <a href="resellDetail.resell?pno=${p.productNo}">
		                            <p class="product_name">${ p.productName }</p>  
		                        </a>
		                    </li>
	                	</c:forEach>
	            
	                </ul>
	            </div>  
            
            </c:forEach> 
	</div>
	
	<br><br clear="both">
	
	
	<script>
           	$(function(){
				$('.productButton >.buy').click(function(){
					location.href = 'resellBuy.resell?pno=' + $(this).next().val();			
				})
           	})
           	
           	$(function(){
           		$('.productButton >.sell').click(function(){
           			location.href = 'resellSell.resell?pno=' + $(this).prev().val();
           		})
           	})
           	
           	$(function(){
           		$('#insertInterest').click(function(){
           			
           				$('#insertInterest').attr('action', 'insertInterest.resell');
           			
           		})
           	})
           	
          /* 	$(document).ready(function(){
           		getGraphWeek();
           	}); */
           	
        	$(document).ready(function(){
           		$('#week').click(function(){
           		 $('#line-chart').remove(); // this is my <canvas> element
           	  	$('.priceGraph').append('<canvas id="line-chart" width="550" height="350"></canvas>');
         		   getGraphWeek();
         	   })
           	});
           	
           	function getGraphWeek(){
           		var timeList = [];
           		var priceList = [];
           		
           		$.ajax({
           			url:"priceGraphWeek.resell",
           			type:"get",
           			data : {productNo : $('.pno').val()},
           			dataType : "json",
           			success:function(data){
           				console.log(data);
           				for(let i = 0; i < data.length; i++){
           					timeList.push(data[i].purchaseDate);
           					priceList.push(data[i].payment);
           				}
           				console.log(timeList);
           				console.log(priceList);
           				new Chart(document.getElementById("line-chart"),{
           					type : 'line',
           					data : {
           						labels : timeList,
           						datasets : [{
           							data : priceList,
           							label : "가격",
           							borderColor : "#000000",
           							fill : false
           						}]
           					},
           					options : {
           						title : {
           							display : true,
           							text : "과연?"
           						}
           					}
           					
           				});
           				
           			},
           			error:function(){
           				console.log("ㄲㅂ");
           			}
           			
           		})
           		
           	}
           	
           	$(document).ready(function(){
           		$('#month').click(function(){
           		 $('#line-chart').remove(); // this is my <canvas> element
            	  	$('.priceGraph').append('<canvas id="line-chart" width="550" height="350"></canvas>');
         		    getGraphMonth();
         	   })
           	});
           	
           	function getGraphMonth(){
           		var timeList = [];
           		var priceList = [];
           		
           		$.ajax({
           			url:"priceGraphMonth.resell",
           			type:"get",
           			data : {productNo : $('.pno').val()},
           			dataType : "json",
           			success:function(data){
           				console.log(data);
           				for(let i = 0; i < data.length; i++){
           					timeList.push(data[i].purchaseDate);
           					priceList.push(data[i].payment);
           				}
           				console.log(timeList);
           				console.log(priceList);
           				new Chart(document.getElementById("line-chart"),{
           					type : 'line',
           					data : {
           						labels : timeList,
           						datasets : [{
           							data : priceList,
           							label : "가격",
           							borderColor : "#000000",
           							fill : false
           						}]
           					},
           					options : {
           						title : {
           							display : true,
           							text : "과연?"
           						}
           					}
           					
           				});
           				
           			},
           			error:function(){
           				console.log("ㄲㅂ");
           			}
           			
           		})
           		
           	}
           	
           	$(document).ready(function(){
           		$('#year').click(function(){
           		 $('#line-chart').remove(); // this is my <canvas> element
            	  	$('.priceGraph').append('<canvas id="line-chart" width="550" height="350"></canvas>');
         		   getGraphYear();
         	   })
           	});
           	
           	function getGraphYear(){
           		let timeList = [];
           		let priceList = [];
           		
           		$.ajax({
           			url:"priceGraphYear.resell",
           			type:"get",
           			data : {productNo : $('.pno').val()},
           			dataType : "json",
           			success:function(data){
           				console.log(data);
           				for(let i = 0; i < data.length; i++){
           					timeList.push(data[i].purchaseDate);
           					priceList.push(data[i].payment);
           				}
           				console.log(timeList);
           				console.log(priceList);
           				new Chart(document.getElementById("line-chart"),{
           					type : 'line',
           					data : {
           						labels : timeList,
           						datasets : [{
           							data : priceList,
           							label : "가격",
           							borderColor : "#000000",
           							fill : false
           						}]
           					},
           					options : {
           						title : {
           							display : true,
           							text : "과연?"
           						}
           					}
           					
           				});
           				
           			},
           			error:function(){
           				console.log("ㄲㅂ");
           			}
           			
           		})
           		
           	}
           	
           	$(function(){
    			
    			$(".style").click(function(){
    					var sno = $(this).children().eq(0).val();
    					 		//$(this).children('.bno').text
    					location.href = "stdetail.bo?sno=" + sno;
    			})
    		})
           	
    </script>
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>