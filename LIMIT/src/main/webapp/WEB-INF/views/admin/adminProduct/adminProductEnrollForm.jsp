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
.outer > div{
	float: left;
}
#file-area{
	float : left;
}
.resellimg{
    width : 300px;
    margin-top : 30px;
    
}
.resellInfo{
    width : 550px;
    margin-top : 30px;
    margin-left: 30px;
    float : left;
}
.imgList{
    width : 250px;
    height : 250px;
    margin-left : 50px;
    margin-top : 30px;
    margin-right: 50px;
    display:block;
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

       	<form action="insertProduct.rs" method="post" enctype="multipart/form-data">
            <!-- 이미지 미리 보기 영역 -->
            <div class="resellimg" style = "float : left;">
                <p style="text-align: center;">IMAGE</p>
                <img class="imgList" id="titleImg">
                <img class="imgList" id="contentImg1">
                <img class="imgList" id="contentImg2">
                <img class="imgList" id="contentImg3">
            </div>
            <div id="file-area">
                <input type="file" name="resellImg" id="file1" required onchange="loadImg(this, 1)">
                <input type="file" name="resellImg" id="file2" onchange="loadImg(this, 2)">
                <input type="file" name="resellImg" id="file3" onchange="loadImg(this, 3)">
                <input type="file" name="resellImg" id="file4" onchange="loadImg(this, 4)">
            </div>
            <script>

                $(function(){
                    $("#file-area").hide();

                    $("#titleImg").click(function(){
                        $("#file1").click();
                    });

                    $("#contentImg1").click(function(){
                        $("#file2").click()
                    });
                    $("#contentImg2").click(function(){
                        $("#file3").click()
                    });
                    $("#contentImg3").click(function(){
                        $("#file4").click()
                    });
                })

                function loadImg(inputFile, num){

                    if(inputFile.files.length == 1) {   // 파일이 있을경우
                        
                        var reader = new FileReader();

                        reader.readAsDataURL(inputFile.files[0]);
                    
                        reader.onload = function(e){
                            switch(num){
                                case 1 : $("#titleImg").attr("src", e.target.result); break;
                                case 2 : $("#contentImg1").attr("src", e.target.result); break;
                                case 3 : $("#contentImg2").attr("src", e.target.result); break;
                                case 4 : $("#contentImg3").attr("src", e.target.result); break;
                            }
                        }
                    }
                    else {
                        switch(num){
                            case 1 : $("#titleImg").attr("src", ""); break;
                            case 2 : $("#contentImg1").attr("src", ""); break;
                            case 3 : $("#contentImg2").attr("src", ""); break;
                            case 4 : $("#contentImg3").attr("src", ""); break;
                        }
                    }
                }
            </script>
        	<div class="resellInfo">
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
                <input type="text" class="form-control" name="productName">
                <br>
                <label>MODEL NO: </label>
                <input type="text" class="form-control" name="modelNo">
                <br>
                <label>RELEASE DATE: </label>
                <input type="text" class="form-control" name="releaseDate">
                <br>
                <label>RELEASE PRICE: </label>
                <input type="text" class="form-control" name="releasePrice">
                <br>
                <label>PRODUCT CONTENT: </label>
                <input type="text" class="form-control" name="productContent">
                <br>
                <button type="submit" class="btn btn-secondary" style="float: right;">다음</button>
        		</div>
    	</form>
    </div>
	

	<br><br><br><br clear="both">
	<jsp:include page="../../common/footer.jsp" />



</body>
</html>