<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>필터</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <style>
  	.resellFilter{
     		width : 300px;
     		height : 100%;
     		margin : auto;
     }
  
  </style>
</head>
<body>

	<div class="container-fluid">
		  <div class="row">
		    <div class="resellFilter" style="border : 1px solid red;">
		    
                <ul>
               	     카테고리 <br><br>
                    <span>
                    	<div>
	                        <input type="checkbox" name="clothes" id="clothes">
	                        <label for="clothes">의류</label>
                        </div>
                        <div>
	                        <input type="checkbox" name="shoes" id="shoes">
	                        <label for="shoes">신발</label>
                        </div>
                        <div>
	                        <input type="checkbox" name="etc" id="etc">
	                        <label for="etc">기타</label>
                        </div>
                    </span>
                </ul>
                <ul>
                	브랜드 <br><br>
                	<span>
                		<c:forEach var="b" items="${brand}">
	                		<div>
		                        <input type="checkbox" name="${b.brandName}" id="${b.brandName}">
		                        <label for="${b.brandName}">${b.brandName}</label>
	                        </div>
                        </c:forEach>
                	</span>
                	</ul>
                <ul>
                	컬렉션 <br><br>
                	<span>
                		<c:forEach var="c" items="${collection}">
	                		<div>
		                        <input type="checkbox" name="${c.collectionName}" id="${c.collectionName}">
		                        <label for="${c.collectionName}">${c.collectionName}</label>
	                        </div>
                        </c:forEach>
                	</span>
                	
                	</ul>
                <ul>신발 사이즈</ul>
                <ul>
                	의류 사이즈 <br><br>
                	<span>
                		<button>XS</button>
                		<button>S</button>
                		<button>M</button>
                		<button>L</button>
                		<button>XL</button>
                		<button>XXL</button>
                		<br>
                		<button>85</button>
                		<button>90</button>
                		<button>95</button>
                		<button>100</button>
                		<button>105</button>
                		<button>110</button>
                	</span>
                	</ul>
                <ul>
                	가격 <br><br>
                	<span>
                		<div>
                		<input type="checkbox" name="price1" id="price1">
	                    <label for="price1">10만원 이하</label>
	                    </div>
	                    <div>
	                    <input type="checkbox" name="price2" id="price2">
	                    <label for="price2">10만원 ~ 30만원 미만</label>
	                    </div>
	                    <div>
	                    <input type="checkbox" name="price3" id="price3">
	                    <label for="price3">30만원 ~ 50만원 미만</label>
	                    </div>
	                    <div>
	                    <input type="checkbox" name="price4" id="price4">
	                    <label for="price4">50만원 이상</label>
	                    </div>
                	</span>
            	</ul>
		    	
		    	
	    </div>

</body>
</html>