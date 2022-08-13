<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
.outer{
    width: 1000px;
    margin-left: 22%;
}
.resellInfo{
    width : 700px;
    margin-top : 30px;
    margin-left: 15%
}
.title {
	font-size: xx-large;
	font-weight: bold;
}
</style>
</head>
<body>
	
	<jsp:include page="../../common/menubar.jsp" />
	
	<div class="outer">
	    <br>
        <p class="title" align="center">상품 등록</p>     
        <hr>
        <br>

        <div class="resellInfo">
            <form action="enrollForm" action="insertProduct.rs" method="post">
                <label>BRAND : </label>
                <select class="form-control" name ="brandName">                    	
                    <c:forEach var ="brand" items = "${brandList}">
                        <option value = "${brand.commonName }">${brand.commonName}</option>
                    </c:forEach>                                                  	                        
                 </select>
                 <br>
                 <label>CATEGORY : </label>
                 <select class="form-control" name ="productTypeName">
                    <c:forEach var ="category" items = "${categoryList}">
                        <option value = "${category.commonName }">${category.commonName}</option>
                    </c:forEach>                                                 	                        
                 </select>
                 <br>
                 <label>COLLECTION : </label>                 	       
                 <select class="form-control" name="collectionName">   
                    <c:forEach var = "collection" items = "${collectionList}">                    		
                        <option value ="${collection.commonName }">${collection.commonName }</option>	                        
                    </c:forEach>
                </select>
                <br>
                <label>PRODUCT NAME: </label>
                <input type="text" class="form-control">
                <br>
                <label>MODEL NO: </label>
                <input type="text" class="form-control">
                <br>
                <label>RELEASE DATE: </label>
                <input type="text" class="form-control">
                <br>
                <label>RELEASE PRICE: </label>
                <input type="text" class="form-control">
                <br>
                <label>PRODUCT CONTENT: </label>
                <textarea name="" id="" rows="10" class="form-control"></textarea>
                <br>
                <button type="submit" class="btn btn-secondary" style="float: right;">다음</button>
            </form>
        </div>
    </div>
	

	<br><br><br><br clear="both">
	<jsp:include page="../../common/footer.jsp" />



</body>
</html>