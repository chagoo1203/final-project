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
        <p class="title" align="center">상품 상세 보기</p>     
        <hr>
        <br>

       	<form action="updateProduct.rs" method="post" enctype="multipart/form-data">
       	<input type ="hidden" value ="${p.productNo}" name ="productNo">
            <!-- 이미지 미리 보기 영역 -->
            <div class="resellimg" style = "float : left;">
                <p style="text-align: center;">IMAGE</p>
                <c:forEach var="i" begin="0" end="3">
                	<img class="imgList" id="Img${i}" src="${list[i].filePath }${list[i].changeName }">
                	<c:if test="${not empty list[i]}">
                	<input type="hidden" name = "fileNo" value = "${list[i].fileNo}"/>	
                	</c:if>
                </c:forEach>
            </div>
            <div id="file-area">
                <input type="file" name="resellImg" id="file0" onchange="loadImg(this, 1)">
                <input type="file" name="resellImg" id="file1" onchange="loadImg(this, 2)">
                <input type="file" name="resellImg" id="file2" onchange="loadImg(this, 3)">
                <input type="file" name="resellImg" id="file3" onchange="loadImg(this, 4)">
            </div>
            <script>

                $(function(){
                    $("#file-area").hide();

                    $(document).on("click", "#Img0", function(){
                        $("#file0").click()
                    });

                    $(document).on("click", "#Img1", function(){
                        $("#file1").click()
                    });
                    
                    $(document).on("click", "#Img2", function(){
                        $("#file2").click()
                    });
                    $(document).on("click", "#Img3", function(){
                        $("#file3").click()
                    });
                })

                function loadImg(inputFile, num){

                    if(inputFile.files.length == 1) {   // 파일이 있을경우
                        
                        var reader = new FileReader();

                        reader.readAsDataURL(inputFile.files[0]);
                    
                        reader.onload = function(e){
                            switch(num){
                                case 1 : $("#Img0").attr("src", e.target.result); break;
                                case 2 : $("#Img1").attr("src", e.target.result); break;
                                case 3 : $("#Img2").attr("src", e.target.result); break;
                                case 4 : $("#Img3").attr("src", e.target.result); break;
                            }
                        }
                    }
                    else {
                        switch(num){
                            case 1 : $("#Img0").attr("src", ""); break;
                            case 2 : $("#Img1").attr("src", ""); break;
                            case 3 : $("#Img2").attr("src", ""); break;
                            case 4 : $("#Img3").attr("src", ""); break;
                        }
                    }
                }
            </script>
        	<div class="resellInfo">
                <label>BRAND : </label>
                <input type="text" readonly class="form-control" name="brandName" value="${p.brandName}">
                <br>
                <label>CATEGORY : </label>
                <input type="text" readonly class="form-control" name="productTypeName" value="${p.productTypeName}">
                <br>
                <label>COLLECTION : </label>                 	       
                <input type="text" readonly class="form-control" name="collectionName" value="${p.collectionName}">
                <br>
                <label>PRODUCT NAME: </label>
                <input type="text" class="form-control" name="productName" value="${p.productName}">
                <br>
                <label>MODEL NO: </label>
                <input type="text" class="form-control" name="modelNo" value="${p.modelNo}">
                <br>
                <label>RELEASE DATE: </label>
                <input type="text" class="form-control" name="releaseDate" value="${p.releaseDate}">
                <br>
                <label>RELEASE PRICE: </label>
                <input type="text" class="form-control" name="releasePrice" value="${p.releasePrice}">
                <br>
                <label>PRODUCT CONTENT: </label>
                <input type="text" class="form-control" name="productContent" value="${p.productContent}">
                <br>
                
                <c:choose>
                	<c:when test="${p.status eq 'Y'}">
		        		<a href="delete.rs?rno=${p.productNo}" class="btn btn-warning">삭제하기</a>
		        		<button type="reset" class="btn btn-secondary" >이전으로</button>
		        		<a href="admin.ad" class="btn btn-secondary">목록가기</a>
		                <button type="submit" class="btn btn-secondary" style="float: right;">수정</button>
                	</c:when>
                	<c:otherwise>
                		<a href="restore.rs?rno=${p.productNo}" class="btn btn-warning">복구</a>
                		<a href="admin.ad" class="btn btn-secondary">목록가기</a>
                	</c:otherwise>
                </c:choose>
                
        		</div>
    	</form>
    </div>
	

	<br><br><br><br clear="both">
	<jsp:include page="../../common/footer.jsp" />

	

</body>
</html>