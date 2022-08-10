<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        #detailFormWrap{
        	
            width: 1200px;
            margin: 0 auto;
            height: 400px;
        }
        #detaiHeaderWrap{
            
            height: 50px;
        }
        #categoryWrap, #brandWrap, #collectionWrap{
            width : 33%;
            height: 100%;
            float:left;
        }
        .categoryLogWrap{
            width : 45%;
            height: 100%;
            border-right: 2px solid gray;            
            text-align: center;
            float : left;
        }
        .categoryLogWrap > p{
            color : gray;
            font-weight: bold;
        }
        .categoryValueWrap{
            width : 30%;
            height: 100%;
            float : left;
            text-align: center;
            margin-left: 30px;
        }
        .categoryValueWrap > p{
            background-color: black;
            color : white;
            font-weight: middle;
            border-radius: 5%;
        }
        #detailMainContentWrap{
            margin-top: 10px;
            width: 1200px;
            height: 550px;
            border-bottom : 2px solid gray;
            border-top : 2px solid gray;
        }
        
        #mainContentWrap{
            width: 100%;
            height: 400px;
            margin-top: 30px;
            
            float : left;
            border-bottom: 2px solid gray;
        }
        #imgSliderWrap{
            float:left;
            margin-top: 50px;
            margin-left: 100px;
            height: 300px;
            width : 320px;
            
        }

        .slider{
            width: 315px;
            height: 100%;
            position: relative;
            margin: 0 auto;
            overflow: hidden;
        }
        .slider input[type=radio]{
            display: none;
        }

        ul.imgs{
            padding: 0;
            margin: 0;
        }
        ul.imgs li{
            position: absolute;
            left: 640px;
            transition-delay: 1s;
            list-style: none;
            padding: 0;
            margin: 0;
        }
        #imgholder > li > img{
            width: 320px;
            height: 302px;
        }
        .bullets{
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            bottom: 20px;
            z-index: 2;
        }
        .bullets label{
            display: inline-block;
            border-radius: 50%;
            background-color: rgba(0,0,0,0.55);
            width: 20px;
            height: 20px;
            cursor: pointer;
        }

        .slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
            background-color: #fff;
        }
        .slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
            background-color: #fff;
        }
        .slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
            background-color: #fff;
        }
        .slider input[type=radio]:nth-child(4):checked~.bullets>label:nth-child(4){
            background-color: #fff;
        }

        .slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){
            left: 0;
            transition: 0.5s;
            z-index:1;
        }
        .slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
            left: 0;
            transition: 0.5s;
            z-index:1;
        }
        .slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3){
            left: 0;
            transition: 0.5s;
            z-index:1;
        }
        .slider input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(4){
            left: 0;
            transition: 0.5s;
            z-index:1;
        }
        #mainContentTextWrap{
            margin-left: 70px;
            margin-top: 100px;
            width: 500px;
            height: 100px;
            
            float : left;
        }
        #mainContentBtnWrap{
            margin-left: 120px;
            margin-top: 20px;
            width: 550px;
            height: 75px;
            
            
            float : left;
        }
        #mainContentTitleWrap,#mainContentPriceWrap{
            width: 100%;
            height: 50%;
            float : left;
            box-sizing: border-box;
            margin-top : -10px;
            font-weight: bold;
            
        }
        #mainContentPriceWrap{
            height: 50%;
            border-bottom: 2px solid gray;
            font-weight: bold;
        }
        .btnWrap{
            margin-left: 45px;
            width: 125px;
            height: 65px;
            
            float:left;
            
        }
        #titleLogWrap{
            width: 150px;
            height: 70px;
            
            margin-left: 50px;
            margin-top: 30px;
            float: left;
        }
       </style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<br><br>
	
	<div id = "detailFormWrap">
        <div id="detaiHeaderWrap">
            <div id ="categoryWrap">
                <div class="categoryLogWrap">
                    <p>종류별</p>
                </div>
                <div class="categoryValueWrap">
                    <p>${usedBoard.productTypeName}</p>
                </div>
            </div>
            <div id ="brandWrap">
                <div class="categoryLogWrap">
                    <p>BRAND</p>
                </div>
                <div class="categoryValueWrap" style ="margin-top : -10px">
                    <p>${usedBoard.brandName }</p>
                </div>
            </div>
            <div id = "collectionWrap">
                <div class="categoryLogWrap">
                    <p>COLLECTION</p>
                </div>
                <div class="categoryValueWrap">
                    <p>${usedBoard.collectionName }</p>
                </div>
            </div>
        </div>


        <div id="detailMainContentWrap">
            <div id="mainContentWrap">
                <div id="imgSliderWrap">
                    <div class="slider">                    	                    
                        <c:set var = "i" value = "1"/>
                        <c:forEach var = "img" items = "${usedImgList}">                        	
                        	<c:choose>
                        		<c:when test="${i eq 1}">
                        			<input type="radio" name="slide" id="slide${i}" checked>
                        		</c:when>
                        		<c:otherwise>
                        			<input type="radio" name="slide" id="slide${i}">
                        		</c:otherwise>
                        	</c:choose>                        	                 
                        	<c:set var = "i" value = "${i + 1}"/>       	
                        </c:forEach>
                        <ul id="imgholder" class="imgs">
                        	<c:forEach var = "img" items = "${ usedImgList}">                        		
                        		<li><img src="${img.filePath }${img.changeName }"></li>
                        	</c:forEach>                                                       
                        </ul>
                        <div class="bullets">
	                        <c:forEach var ="j" begin ="1" end ="${i-1}">
	                        	<label for="slide${j }">&nbsp;</label>
	                        </c:forEach>
                        </div>
                    </div>
                </div>

                <div id="mainContentTextWrap">
                    <div id="mainContentTitleWrap">
                        <p>ㄹㅇ 개급처</p>
                    </div>
                    
                    <div id="mainContentPriceWrap">
                        <p>50,000</p>
                    </div>
                </div>

                <div id = "mainContentBtnWrap">
                    <div class = "btnWrap">
                        <input type="checkbox" class="btn-check" id="btn-check-2-outlined" checked autocomplete="off">
                        <label class="btn btn-outline-secondary btn-lg" for="btn-check-2-outlined" style="width: 100%; height : 100%; padding-top: 15px;">관심 상품</label><br>

                    </div>
                    
                    <div class = "btnWrap">
                        <button type="button" class="btn btn-dark btn-lg" style="width: 100%; height : 100%;">연락하기</button>
                    </div>
                </div>
            </div>
            <div id="titleLogWrap">
                <p style="font-weight: bold; font-size : large;">PRODUCT INTRODUCE</p>
            </div>
        </div>
        <div id="introduceWrap" style="width: 1100px; height: 300px; margin-left: 50px; margin-top:25px; float:left;">
			${usedBoard.boardContent }
        </div>
        
        <c:if test="${loginUser.userId eq usedBoard.boardWriter}">
            <div id="updateDeleteWrap" align="center">
                <button type="button" class="btn btn-outline-dark" onclick="location.href='update.used?boardNo=${usedBoard.boardNo}'">수정</button>
                <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    삭제
                </button>
            </div>
        </c:if>
    </div>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">삭제 하려고 ?</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              다시 안돌려줌
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="button" class="btn btn-danger" onclick="location.href = 'delete.used?boardNo=${usedBoard.boardNo}'">Delete</button>
            </div>
          </div>
        </div>
    </div>
    <br style="clear : both;"/>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>