<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<a href="myPageInte.me">관심 상품</a>
	</div>
 <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2>구매상품</h2>
            <br>

            <br>
            <br>
            <table id="myPageBuy" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>거래번호</th>
                        <th>상품이름</th>
                        <th>상품</th>
                    </tr>
                </thead>
                <tbody>
                   <c:forEach var="i" items="${ list }">
                   <tr>
                   <td>${ i.TRADE_NO }</td>
                   <td>${ i.PRODUCT_NAME }</td>
                   <td>${ i.PRODUCT_CONTENT }</td>
                   
                   
                   </tr>
                   </c:forEach>
                </tbody>
            </table>
            <br>
​			
            <div id="pagingArea">
                <ul class="pagination">
                
                <c:choose>
                <c:when test="${ pi.currentPage eq 1 }">
                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                   </c:when>
                   
                   <c:otherwise>
                    <li class="page-item"><a class="page-link" href="myPageBuy?cPage=${ pi.currentPage -1 }">Previous</a></li>
                   </c:otherwise>
                   
                   </c:choose>
                   
                   <c:forEach var="p" begin="${pi.startPage }" end="${ pi.endPage }">
                   
                    <li class="page-item"><a class="page-link" href="myPageBuy?bPage=${ p }">${ p }</a></li>
					</c:forEach>
					
					<c:choose>
                    <c:when test="${ pi.currentPage eq pi.maxPage }">
                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    </c:when> 
                    
                    <c:otherwise>
                     <li class="page-item"><a class="page-link" href="myPageBuy?bPage=${ pi.currentPage + 1 }">Next</a></li>
                    </c:otherwise>
                    
                    </c:choose>
                </ul>
            </div>
​
          
​
         
          
            <br><br>
        </div>
        <br><br>
​
    </div>
  <jsp:include page="../common/footer.jsp" />
​

</body>
</html>