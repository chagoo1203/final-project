<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>필터</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
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
		    <div class="resellFilter">
		    
                <ul>
               	     카테고리 <br><br>
                    <span>
                    	<div>
	                        <input type="checkbox" name="productTypeName" id="clothes" value="clothes">
	                        <label for="clothes">의류</label>
                        </div>
                        <div>
	                        <input type="checkbox" name="productTypeName" id="shoes" value="shoes">
	                        <label for="shoes">신발</label>
                        </div>
                        <div>
	                        <input type="checkbox" name="productTypeName" id="etc" value="etc">
	                        <label for="etc">기타</label>
                        </div>
                    </span>
                </ul>
                <ul>
                	브랜드 <br><br>
                	<span>
                		<c:forEach var="b" items="${brand}">
	                		<div>
		                        <input type="checkbox" name="brandName" id="${b.commonName}" value="${b.commonName}">
		                        <label for="${b.commonName}">${b.commonName}</label>
	                        </div>
                        </c:forEach>
                	</span>
                	</ul>
                <ul>
                	컬렉션 <br><br>
                	<span>
                		<c:forEach var="c" items="${collection}">
	                		<div>
		                        <input type="checkbox" name="collectionName" id="${c.commonName}" value="${c.commonName}">
		                        <label for="${c.commonName}">${c.commonName}</label>
	                        </div>
                        </c:forEach>
                	</span>
                	
                	</ul>
		    	
		    	
	    </div>

</body>
</html>