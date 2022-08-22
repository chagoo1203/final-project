<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타일 리스트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style>
    div{
   
        box-sizing: border-box;
    }
    .wrap{
        margin: auto;
        width: 1200px;
       
    }

    #hash_tag{
        width: 100%;
        height: 300px;
    }
    li{
        list-style: none;
    }
    #style_tab_lst > a{	
    	
        text-decoration: none;
        color: black;
    }
    
    #style_tab_lst >  a:link { color: red; text-decoration: none;}
    #style_tab_lst > a:visited { color: black; text-decoration: none;}
    #style_tab_lst > a:hover { color: blue; text-decoration: underline;
    
    
    
    }


    #hash_bar{
        width : 1200px;

        height : 50px;
    
        position: absolute;
        left: 50%;
        top: 40%;
        margin-left: -600px;
        margin-top: -150px;


    }

    #style_tab_lst{
        width : 1200px;

        height : 50px;

        position: absolute;
        left: 50%;
        top: 35%;
        margin-left: -600px;
        margin-top: -150px;
    }
    .style_feeds > div{float: left;}
    .style_feeds{
        width: 1200px;
        height: auto;
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
    }
    .style > img{
        width: auto;
        height: auto;
    }
    
    .productImg {
    	width:50px;
    	height:50px;
    }

    
    #pagingArea{
    	margin-left:500px;
    }
    
    
	.option{
		font-size: larger;
		
		    border: 1px solid rgb(128, 165, 221);
            border-radius: 15px;
            border-width: 2px;
            background-color: rgb(128, 165, 221);
            color: black;
            box-shadow: 1px 1px 1px 1px gray;
            padding: 5px;
            width: 85px;
            transition: all 0.5s; /*0.5초동안 변함*/
            margin-right: 25px;
		
	}
	
	
	.option:hover{
            height:50px; /*변경할 세로사이즈*/
            color: white;
            background: rgb(129, 151, 224); /*변경할 배경색*/
            -webkit-transform:scale(1.2);
            -moz-transform:scale(1.2);
            -ms-transform:scale(1.2);
            -o-transform:scale(1.2);
            transform:scale(1.2);
        }
    

</style>
</head>
<body>

        		



	  <jsp:include page="../common/menubar.jsp" />
    <div class="wrap">
        <div id="style_tab_lst" align="center">
            <a href="style.bo" class="option">최신</a> <a href="style.bo?type=like" class="option">인기</a> <a href="style.bo?type=count" class="option">조회수</a>
        </div>
        <div id="hash_tag">
            <div id="hash_bar" align="center">#나이키 #아디다스 #조던1</div>
        </div>
        
     

        <div class="style_feeds" >
        
            <c:if test="${ not empty loginUser }"> 
	
	            	<button class="btn-check" id="btn-check-outlined" autocomplete="off" >작성</button>
        			<label  id="writerStyle" class="btn btn-outline-primary" for="btn-check-outlined" style="margin-left: 1080px;" >작성</label><br>
        			
	            <br>
			</c:if>
			
			<c:if test="${ empty list}">
				<h1 align="center">등록된 스타일이 없습니다.</h1>
			</c:if>
			
			
			   <script>
					$(function(){
			       		
			   			$("#writerStyle").click(function(){
			   				
			   				location.href = "styleEnrollForm.bo";
			   				
			   			})
			   			
			   		})
   			
       			</script>
			
			
			
			
			
			<c:forEach var="s" items="${ list }">
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
	                    		 <a href="resellDetail.resell?pno=${p.productNo }">	
			                     	<img class="productImg" src="${p.titleImg }">	
			                        <p class="product_name">${ p.productName }</p>  
		                        </a>
		                    </li>
	                	</c:forEach>
	            
	                </ul>
	            </div>  
            
            </c:forEach>                
        </div>
        
        <script>
  		$(function(){
			
			$(".style").click(function(){
					var sno = $(this).children().eq(0).val();
					 		//$(this).children('.bno').text
					location.href = "stdetail.bo?sno=" + sno;
			})
		})
        
        
        </script>
        
        
        
        
        
        
           <br clear="both">
           <br><br>
         <div id="pagingArea">
             <ul class="pagination">
             
             	<c:choose>
	         		<c:when test="${ pi.currentPage eq 1 }">    	
                 		<li class=""><a class="page-link" href="#">Previous</a></li>
             		</c:when>
             		<c:otherwise>
             			<li class="page-item"><a class="page-link" href="style.bo?cpage=${pi.currentPage - 1}">Previous</a></li>
             		</c:otherwise>
                 
             	</c:choose>

                 <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                 	<li class=""><a class="page-link" href="style.bo?cpage=${ p }">${ p }</a></li>
                 </c:forEach>
                 
                 <c:choose>
                 	<c:when test="${ pi.currentPage eq pi.maxPage }">
                 		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                 	</c:when>
                 	<c:otherwise>
             			<li class=""><a class="page-link" href="style.bo?cpage=${pi.currentPage + 1}">Next</a></li>
             		</c:otherwise>
             	</c:choose>
             
             </ul>
         </div>
        
    	
        
    
    </div>
    <br clear="both">
    <jsp:include page="../common/footer.jsp" />
    
    
    
    
</body>
</html>