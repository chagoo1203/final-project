<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리셀 상품 리스트</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script> 
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
     		height : 900px;
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
		    	
		    	<div id="mainContentForm">
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
		    	<br clear="both">
		    	<div id="pagingArea">
	             <ul class="pagination">
	             
	             	<c:choose>
		         		<c:when test="${ pi.currentPage eq 1 }">    	
	                 		<li class=""><a class="page-link" href="#">Previous</a></li>
	             		</c:when>
	             		<c:otherwise>
	             			<li class="page-item"><a class="page-link" href="resellList.resell?cpage=${pi.currentPage - 1}">Previous</a></li>
	             		</c:otherwise>
	                 
	             	</c:choose>
	
	                 <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                 	<li class=""><a class="page-link" href="resellList.resell?cpage=${ p }">${ p }</a></li>
	                 </c:forEach>
	                 
	                 <c:choose>
	                 	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                 		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                 	</c:when>
	                 	<c:otherwise>
	             			<li class=""><a class="page-link" href="resellList.resell?cpage=${pi.currentPage + 1}">Next</a></li>
	             		</c:otherwise>
	             	</c:choose>
	             
	             </ul>
	         </div>
		    	
	    	</div>
	    	
		    	
	    	
		  </div>
		  
		  
		  
		  <script>
            	
            	$(document).on("click", "img", function(){
		        	var pno = $(this).next().children('.pno').val();      	
		        	location.href = "resellDetail.resell?pno="+pno; 
		        })
            	
            	$("select[name=option]").change(function(){
            		location.href = 'resellList.resell?option=' + $(this).val();
            	})
            	
            	var cpage =1;
		        var productTypeName = [];
		        var brandName = [];        
		        var collectionName = [];
		        
		        $(document).on("change", "input[name=productTypeName]", function(){
		            productTypeName = [];
		            $("input[name=productTypeName]:checked").each(function(e){
		                productTypeName.push($(this).val());
		            });
		            ajaxLoadToUsedBoardPaging();  
		        })
		        $(document).on("change", "input[name=brandName]", function(){
		            brandName = [];
		            $("input[name=brandName]:checked").each(function(e){
		                brandName.push($(this).val());
		            });            
		            ajaxLoadToUsedBoardPaging();
		        })
		        $(document).on("change", "input[name=collectionName]", function(){
		            collectionName = [];
		            $("input[name=collectionName]:checked").each(function(e){
		                collectionName.push($(this).val());
		            });            
		            ajaxLoadToUsedBoardPaging();
		        })
		        
		    function ajaxLoadToUsedBoardPaging(page){
	            if(page){
	                cpage = page;
	            }        
	        	$("#pagingArea").empty();         
	        	var result ="";
	        	$.ajax({
	        			url : "aJaxLoadtoUsedBoardPaging.resell",
	        			traditional: true,   			
	        			data : {cpage : cpage, productTypeName : productTypeName, brandName : brandName, collectionName : collectionName},
	        			success : function(pi){
	        			
	        				if(pi.currentPage == 1){
	        					result += '<button class = "btn btn-outline-secondary disabled" onclick="aJaxLoadtoUsedBoardPaging(' + (pi.currentPage - 1) + ')" >&lt;</button>'	
	        				}
	        				else{
	        					result += '<button class = "btn btn-outline-secondary" onclick="aJaxLoadtoUsedBoardPaging(' + (pi.currentPage - 1) + ')" >&lt;</button>'
	        				}
	        				
	        				
	        				for(var i = pi.startPage; i <= pi.endPage; i++){
	                           
	                            if(i != pi.currentPage){
	                                result +=  '<button class ="btn btn-outline-secondary"  onclick="aJaxLoadtoUsedBoardPaging(' + i + ')">'+ i +'</button>';
	                            }else{
	                                result +=  '<button class="btn btn-outline-secondary" disabled>' + i + '</button>'
	                            }
	                        }
	        				if(pi.currentPage < pi.maxPage){
	                            result += '<button class = "btn btn-outline-secondary"  onclick="aJaxLoadtoUsedBoardPaging(' + (recipan[1].currentPage + 1) +')">&gt;</button>';
	                        }
	        			
	        				$("#pagingArea").append(result);
	        				ajaxLoadToUsedBoardPage(pi);
	        			}
	        	})
	        }
		        
	        function ajaxLoadToUsedBoardPage(pi){
	            $("#mainContentForm").empty();
	            var result = "";
	            var startRow = (pi.currentPage - 1) * pi.boardLimit + 1;
	            var endRow = startRow + pi.boardLimit - 1;
            
	            $.ajax({
	                url : "aJaxLoadtoUsedBoard.resell",
	                traditional: true,
	                data : {cpage : cpage, productTypeName : productTypeName, brandName : brandName, collectionName : collectionName, startRow : startRow, endRow : endRow},
	                success : function(list){
	                	console.log(list);
	                	for(let i in list){
	                		console.log(i + '번쨰');
	                		result += '<div class="thumbnail" align="center">' + 
	                		'<img class="resellThumbnail" src="' + list[i].titleImg + '">' +
	                		'<div class="productInfo" align="left">' +
	                            '<input type="hidden" name="productNo" class="pno" value="' + list[i].productNo +'">' +
	                        '<p class="brand">' + list[i].brandName + '</p>' +
	                        '<p class="name">' + list[i].productName + '</p>' +
	                        '<p class="translatedName">' + list[i].productContent + '</p>' +
	                        '<P>♥ ' + list[i].likes + '</P>' +
	                        '</div>' +
	                    	'</div>';
	                	}
	                	$("#mainContentForm").append(result);
	                },error : function(){
						console.log("test");
	                }
	            })
        	}	
            	
            </script>
        
	
	<jsp:include page="../common/footer.jsp" />
	

</body>
</html>