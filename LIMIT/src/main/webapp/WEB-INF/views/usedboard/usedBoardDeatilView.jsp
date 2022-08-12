<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        * {box-sizing:border-box}
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

        /* Slideshow container */
        .slideshow-container {
        max-width: 1000px;
        position: relative;
        margin: auto;
        }

        /* Hide the images by default */
        .mySlides {
        display: none;
        }

        /* Next & previous buttons */
        .prev, .next {
        cursor: pointer;
        position: absolute;
        top: 50%;
        width: auto;
        margin-top: -22px;
        padding: 16px;
        color: white;
        font-weight: bold;
        font-size: 18px;
        transition: 0.6s ease;
        border-radius: 0 3px 3px 0;
        user-select: none;
        }

        /* Position the "next button" to the right */
        .next {
        right: 0;
        border-radius: 3px 0 0 3px;
        }

        /* On hover, add a black background color with a little bit see-through */
        .prev:hover, .next:hover {
        background-color: rgba(0,0,0,0.8);
        }

        /* Caption text */
        .text {
        color: #f2f2f2;
        font-size: 15px;
        padding: 8px 12px;
        position: absolute;
        bottom: 8px;
        width: 100%;
        text-align: center;
        }

        /* Number text (1/3 etc) */
        .numbertext {
        color: #f2f2f2;
        font-size: 12px;
        padding: 8px 12px;
        position: absolute;
        top: 0;
        }

        /* The dots/bullets/indicators */
        .dot {
        cursor: pointer;
        height: 15px;
        width: 15px;
        margin: 0 2px;
        background-color: #bbb;
        border-radius: 50%;
        display: inline-block;
        transition: background-color 0.6s ease;
        }

        .active, .dot:hover {
        background-color: #717171;
        }

        /* Fading animation */
        .faded {
        animation-name: faded;
        animation-duration: 1.5s;
        }

        @keyframes faded {
        from {opacity: .4}
        to {opacity: 1}
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
                    <div class="slideshow-container" style="width: 100%; height : 100%">                   	                    
                        <c:set var = "i" value = "1"/>
                        <c:forEach var = "img" items = "${usedImgList}">                        	                        	
                            <div class="mySlides faded" style="width: 100%; height : 100%">
                                <div class="numbertext">${i} / ${fn:length(usedImgList)}</div>
                                <img src="${img.filePath }${img.changeName }" style="width:100%; height : 100%">                                
                              </div>
                        	<c:set var = "i" value = "${i + 1}"/>       	
                        </c:forEach>
                        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                        <a class="next" onclick="plusSlides(1)">&#10095;</a>                        
                    </div>
                    <br>      
                    <!-- The dots/circles -->
                    <div style="text-align:center">
                        <c:set var = "i" value = "1"/>
                        <c:forEach var = "img" items = "${usedImgList}">
                            <span class="dot" onclick="currentSlide(${i})"></span>                            
                            <c:set var = "i" value = "${i + 1}"/>       	
                        </c:forEach>
                    </div>
                </div>
                <script>
                    let slideIndex = 1;
                    showSlides(slideIndex);
            
                    // Next/previous controls
                    function plusSlides(n) {
                    showSlides(slideIndex += n);
                    }
            
                    // Thumbnail image controls
                    function currentSlide(n) {
                    showSlides(slideIndex = n);
                    }
            
                    function showSlides(n) {
                    let i;
                    let slides = document.getElementsByClassName("mySlides");
                    let dots = document.getElementsByClassName("dot");
                    if (n > slides.length) {slideIndex = 1}
                    if (n < 1) {slideIndex = slides.length}
                    for (i = 0; i < slides.length; i++) {
                        slides[i].style.display = "none";
                    }
                    for (i = 0; i < dots.length; i++) {
                        dots[i].className = dots[i].className.replace(" active", "");
                    }
                    slides[slideIndex-1].style.display = "block";
                    dots[slideIndex-1].className += " active";
                    }
                </script>
                <div id="mainContentTextWrap">
                    <div id="mainContentTitleWrap">
                        <p>${usedBoard.boardTitle}</p>
                    </div>
                    
                    <div id="mainContentPriceWrap">
                        <p>${usedBoard.usedPrice}</p>
                    </div>
                </div>

                <div id = "mainContentBtnWrap">
                    <div class = "btnWrap">
                        <input type="checkbox" class="btn-check" id="btn-check-2-outlined" autocomplete="off">
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
                <button type="button" class="btn btn-outline-dark" onclick="location.href='updateForm.used?boardNo=${usedBoard.boardNo}'">수정</button>
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
    <script>
    $(function(){    	
        if("${loginUser.userId}" == ""){
        	$("#btn-check-2-outlined").prop("disabled", true);        	
        }else{
        	aJaxLoadToInterested();
        }
    })
    $(document).ready(function(){
    	$("#btn-check-2-outlined").change(function(){
    		if($("#btn-check-2-outlined").is(":checked")){    			
    			aJaxInsertToInterested();
    		}else{
    			aJaxDeleteToInterested();
    		}
    	})
    })
    function aJaxLoadToInterested(){
        $.ajax({
            url : "aJaxLoadToInterested.used",
            data : {userId : "${loginUser.userId}", usedNo : "${usedBoard.boardNo}"},
            success : function(msg){            	
	           	if(msg == 'Y'){
	           		$("#btn-check-2-outlined").prop("checked", true);
	           	}
            },error : function(){
            	alert("통신실패");
            }
        })
    }
    function aJaxInsertToInterested(){
        $.ajax({
            url : "aJaxInsertToInterested.used",
            data : {userId : "${loginUser.userId}", usedNo : "${usedBoard.boardNo}"},
            success : function(){
            	alert("관심상품에 등록되었습니다.");
            },error : function(){
            	alert("실패 ㅋ");
            }
        })
    }
    function aJaxDeleteToInterested(){
        $.ajax({
            url : "aJaxDeleteToInterested.used",
            data : {userId : "${loginUser.userId}", usedNo : "${usedBoard.boardNo}"},
            success : function(){
            	alert("관심상품 제거");
            },error : function(){
            	alert("실패 ㅋ");
            }
        })
    }
    </script>
    <br style="clear : both;"/>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>