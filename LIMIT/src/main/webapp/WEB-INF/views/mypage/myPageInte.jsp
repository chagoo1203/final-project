<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
 .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
​		
        #myPageInte {text-align:center;}
        #myPageInte>tbody>tr:hover {cursor:pointer;}
​		
        #pagingArea {width:fit-content; margin:auto;}
        
        #searchForm {
            width:80%;
            margin:auto;
        }
        #searchForm>* {
            float:left;
            margin:5px;
        }
        .select {width:20%;}
        
        .text {width:53%;}
        
        .searchBtn {width:20%;}
        
        .mypageMenu {
	float: left;
    width: 500px;
	font-size: 20px;
	margin-left: 20%;
	margin-top: 100px;
	margin:left;
}

    </style>

</head>
<body>

 
	<jsp:include page="../common/menubar.jsp" />
	
	<div class="mypageMenu">
		<p class="title"></p>
		<a href="myPageBuy.me">구매 상품</a> <br>
		<a href="myPageSell.me">판매 상품</a> <br>
		<a href="myPageInte.me">관심 상품</a>
	</div>
 <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2>관심상품</h2>
            <br>

            <br>
            <br>
            
            <div class="inteContentList">
            
            <table id="myPageInte" class="table table-hover" align="center">
                <thead>
                    <tr>
                    	<th>상품번호</th>
                        <th>상품이름</th>
                        <th>상품</th>
                    </tr>
                </thead>
                <tbody>
                
                   <c:forEach var="i" items="${ list }">
                   <tr>
                   <td>${ i.productNo }</td>
                   <td>${ i.productName }</td>
                   <td>${ i.productContent }</td>
                   <td>
                   
                   </td>
                   </tr>
                   </c:forEach>
                </tbody>
            </table>
            <br>
            </div>

            <div id="pagingArea">
                <ul class="pagination">
                
                <c:choose>
                <c:when test="${ pi.currentPage eq 1 }">
                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                   </c:when>
                   
                   <c:otherwise>
                    <li class="page-item"><a class="page-link" href="myPageInte?cPage=${ pi.currentPage -1 }">Previous</a></li>
                   </c:otherwise>
                   
                   </c:choose>
                   
                   <c:forEach var="p" begin="${pi.startPage }" end="${ pi.endPage }">
                   
                    <li class="page-item"><a class="page-link" href="myPageInte?cPage=${ p }">${ p }</a></li>
					</c:forEach>
					
					<c:choose>
                    <c:when test="${ pi.currentPage eq pi.maxPage }">
                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    </c:when> 
                    
                    <c:otherwise>
                     <li class="page-item"><a class="page-link" href="myPageInte?cPage=${ pi.currentPage + 1 }">Next</a></li>
                    </c:otherwise>
                    
                    </c:choose>
                </ul>
            </div>
​</div>
          
​
         
          
            <br><br>
        </div>

        <br><br>
​	
    
    
     <script>
            	$(function(){
					$('#myPageInte>tbody>tr').click(function(){
						location.href = 'resellDetail.resell?pno=' + $(this).children().eq(0).text();
					})
            	})
            </script>
    
    
  <jsp:include page="../common/footer.jsp" />
​

</body>
</html>