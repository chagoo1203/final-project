<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타일 리스트</title>
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
    a{
        text-decoration: none;
        color: black;
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
            height: 70%;
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


    .option  {
        font-size: larger;
    }
    #pagingArea{
    	margin-left:500px;
    }

</style>
</head>
<body>
	  <jsp:include page="../common/menubar.jsp" />
    <div class="wrap">
        <div id="style_tab_lst" align="center">
            <a href="" class="option">최신</a> <a href="" class="option">인기</a> <a href="" class="option">팔로잉</a>
        </div>
        <div id="hash_tag">
            <div id="hash_bar" align="center">#나이키 #아디다스 #조던1 </div>
        </div>
        

        <div class="style_feeds" >
        
            <c:if test="${ not empty loginUser }"> 
	            <a href="styleEnrollForm.bo" style="margin-left: 1080px;">작성하기</a>
	            <br>
			</c:if>
			
			<c:if test="${ empty list}">
				<h1 align="center">등록된 스타일이 없습니다.</h1>
			</c:if>
			
			<c:forEach var="s" items="${ list }">
	            <div class="style">
	            	<input type="hidden" value="${ s.styleNo }">
	                <img src="${ s.titleImg }" style="width:210px; height:200px">
	                <p>${ s.styleContent }</p>
	                <ul>
	                    <li>
	                        <a href="">
	                            <p class="product_name">Nike Air Force 1 '07 Low White </p>    
	                            <p class="price_box">132000원</p>
	                        </a>
	                    </li>
	                    <li>
	                        <a href="">
	                            <p class="product_name">Jordan 1 Retro Low OG Black and Dark Powder Blue </p>    
	                            <p class="price_box">132000원</p>
	                        </a>
	                    </li>
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