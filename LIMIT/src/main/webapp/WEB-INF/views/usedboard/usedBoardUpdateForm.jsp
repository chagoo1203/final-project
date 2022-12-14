<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        #enrollFromWrap{
            width: 1200px;
            overflow: auto;
            margin: 0 auto;
        }
        #imgInsertWrap, #categoryWrap, #titleContentPriceWrap{
            border-top: 2px solid gray;
            overflow: auto;
            width: 100%;            
        }
        #textWrap > p{            
            float: left;
            
        }
        #imgWrap > img{
            margin-top: 10px;
            margin-left: 10px;
            margin-right: 10px;
        }
        #categoryRadioWrap > label{
            float:left;
            
        }
        .categoryLogo{
            margin-top : 80px; margin-right: 10px; font-size: 18px;
        }
        optgroup {
            font-size: 5px;
        }
        #categoryDropBoxWrap,#collectionDropBoxWrap{
            margin-top : 85px; width: 45%;  float : left;
        }
        #collectionNameWrap, #brandBoxNameWrap, #categoryBoxNameWrap{
            width: 50%; height : 100%; float : left; border-right: 2px solid gray; text-align: right; margin-right: 10px; font-weight: bold; color : gray;
        }
        #collectionBox, #categoryBox, #brandBox{
            width : 230px; height : 185px; float:left;
        }
        #imgWrap > img{
            border: 1px solid black;
            width : 150px; 
            height : 150px;
        }


    </style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div id = "enrollFromWrap">
        <form method="post" action = "update.used" enctype="multipart/form-data">
        <input type ="text" hidden value ="${usedBoard.boardNo }" name ="boardNo">
        <input type ="text" hidden value ="${loginUser.userId }" name ="boardWriter">
        <p style="font-weight: bold; font-size: 24px; margin : 0px; margin-bottom: 5px;">?????? ??????</p>
        
        <div id = "imgInsertWrap" style="height: 200px;">
            <div id ="textWrap" style="width : 152px; height : 152px; float: left;"><p style="font-weight: bold;">?????? ?????????</p><p style="color : red">*</p><p style="color : gray;" id="photoCount">(0/10)</p></div>
            <div id = "imgWrap" style=" width: 1000px; float:left; margin-top: 20px;">
                <img src="resources/enrollFormImges/pngtree-vector-camera-icon-png-image_1576543.jpg" alt="" id="insertImgForm"/>   
                <input hidden type="file" name="usedImg" id="usedImgInput0"  onchange="loadImg(this, 0);">
                
                <c:set var ="i" value = "0"/>
				<c:forEach var = "img" items = "${usedImgList}">								
					<img class = "usedImges" src="${img.filePath }${img.changeName }" alt="" id="usedImg${i}"/>
					<input type="hidden" name = "fileNo" value = "${img.fileNo }"/>					
					<button class="deleteBtn btn btn-dark" style = "margin-left : -42px; margin-top : 123px;">-</button>
                 	<input hidden type="file" name="usedImg" id="usedImgInput${i+1}" onchange="loadImg(this,${i+1});">
                 	<c:set var="i" value = "${i + 1 }"/>                 	
				</c:forEach>
            </div>
        </div>

        <div id = "categoryWrap" style="margin-top : 10px; height: 250px;">
            <p style="font-weight:bold;">CATEGORY</p>
            <div id ="categoryBox" style="margin-left : 50px;">
                <div id="categoryBoxNameWrap">
                    <p class = "categoryLogo">????????? </p>
                </div>

                <div id="categoryRadioWrap" class ="d-grid gap-2" style="width: 45%; height : 100%; float : left;">
                	<c:set var ="index" value ="0"/>                
                	<c:forEach var ="category" items = "${categoryList }">          	
                		<input type="radio" class="btn-check" name="productTypeName" id="option${index }" autocomplete="off" value="${category.commonName }">
                    	<label class="btn btn-outline-secondary btn-block" for="option${index}" >${category.commonName}</label>
                    	<c:set var ="index" value ="${index + 1 }"/>
                	</c:forEach>                                       
                </div>                
            </div>
            <div id ="brandBox" style="margin-left : 200px;">
                <div id="brandBoxNameWrap">
                    <p class = "categoryLogo" >BRAND</p>
                </div>
                <div id="categoryDropBoxWrap">                	
                   	<select class="selectpicker" name ="brandName" id ="brandSelect">                    	
                        <optgroup label="BRAND">
	                        <c:forEach var ="brand" items = "${brandList}">
	                        	
	                        	<option value = "${brand.commonName }">${brand.commonName}</option>
	                        </c:forEach>                          
                        </optgroup>	                        	                        
                     </select>                     
                </div>
            </div>
            
            
            
            <div id ="collectionBox" style="margin-left : 150px;">
                <div id="collectionNameWrap" >
                    <p class = "categoryLogo" >COLLECTION</p>
                </div>
                <div id="collectionDropBoxWrap">
                    <select class="selectpicker" name="collectionName" id = "collectionSelect">                     	       
                    	<c:forEach var = "collection" items = "${collectionList}">                    		
	                        <option value ="${collection.commonName }">${collection.commonName }</option>	                        
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>
        

        <div id = "titleContentPriceWrap">
            <div id = "titleWrap" style="width : 100%; overflow : auto; ">
                <div style="width: 100px;  font-weight: bold; float : left;" >PRODUCT TITLE</div>
                <div id="titleInputWrap" style=" float: left; width : 1000px; height: 50px; margin-top : 40px">
                    <input class="form-control" type="text" placeholder="INSERT TITLE" name = "boardTitle" value ="${usedBoard.boardTitle }">
                </div>
            </div>
 
            <div id="contentWrap" style="width : 100%; overflow : auto; ">
                <div style="width: 100px;font-weight: bold; float : left;" >PRODUCT CONTENT</div>

                <div class = "form-group" id="contentInputWrap" style=" float: left; width : 1000px; height: 400px; margin-top : 40px">
                    
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="16" style="resize : none;" name ="boardContent">${usedBoard.boardContent }</textarea>
                </div>

            </div>
            
            
            
             <div id="priceWrap" style="width : 100%; overflow : auto; ">
              <div style="width: 100px;font-weight: bold; float : left;" >PRODUCT PRICE</div>

              <div id="priceInputWrap" style=" float: left; width : 1000px; height: 50px; margin-top : 40px">                  
                  <input class="form-control" type="number" placeholder="INSERT PRICE" name = "usedPrice" value = "${usedBoard.usedPrice }">
              </div>
            </div>
        </div>
        <div id="submitWrap" style="margin : auto; width: 100px; height: 100px; margin-top : 25px;" >
            <button type="submit" class="btn btn-secondary">????????????</button>
        </div>
        
        </form>
    </div>
    <script>
    	var usedImgCount = ${fn:length(usedImgList)};
	    $(function(){
			$("input[name = productTypeName]:radio[value='${usedBoard.productTypeName}']").prop('checked',true);
			$("#brandSelect").val("${usedBoard.brandName}");
			$("#collectionSelect").val("${usedBoard.collectionName}");	
			$("#photoCount").text('(' + (usedImgCount) + '/10)')
		})
        
        $(document).on("click","#insertImgForm",function(){            
            var el = "#usedImgInput" + usedImgCount;                                                   
            $(el).click();  
        })
        
        $(document).on("click", ".usedImges", function(){
            $(this).prev().click();

        })
        
        $(document).on("click",".deleteBtn", function(){
            
        	var number = $(this).prev().prev().attr('id').substring(12);            
            if(!$(this).next().next().length || usedImgCount > number) usedImgCount--;
            if(usedImgCount < 0) usedImgCount = 0;

            if($(this).prev().val() > 0){//hidden element??? ?????????
                $(this).prev().remove();                    
            }                        
            $(this).prev().remove();
            $(this).next().remove();
            $(this).remove();
        })
        function loadImg(inputFile, num){
            
            if(inputFile.files.length == 1){ // ????????? ??????
                
                var el = "#usedImg" + num;

                var reader = new FileReader();
                // FileReader??????????????? ????????? ??????????????? ???????????? ??????
                //??????????????? ?????? ????????? ???????????? ????????????
                reader.readAsDataURL(inputFile.files[0]);
                //?????? ????????? ??????????????? ?????? ??? ???????????? ????????? url ??? ????????????.
                //->?????? url??? src???????????? ????????????(attr)                        
                //?????? ????????? ?????????????????? ????????? ??????
                if(num >= usedImgCount){
                    reader.onload = function(e){
                        // e??? target -> e.target -> ???????????? ????????? ??????
                        //e??? target.result??? ??? ????????? url ??? ??????.                                            
                        imgEl = '<img class = "usedImges" src="" alt="" id="usedImg'+ usedImgCount + '"/><button class="deleteBtn btn btn-dark" style = "margin-left : -42px; margin-top : 123px;">-</button>'
                        inputEl = '<input hidden type="file" name="usedImg" id="usedImgInput'+ (usedImgCount+1) +'" onchange="loadImg(this,'+ (usedImgCount+1) +');">';                    

                        $("#imgWrap").append(imgEl);
                        $("#imgWrap").append(inputEl);
                        $(el).attr("src", e.target.result);   
                        $("#photoCount").text('(' + (usedImgCount + 1) + '/10)')
                        usedImgCount++;                    
                    };
                }else{//?????? 
                    console.log("?????? ??????");
                    reader.onload = function(e){
                        $(el).attr("src", e.target.result);                    
                    }
                }
            }else{                     
                if(num > usedImgCount){   
                    $(el).attr("src", null);                               
                }else{
                    $(el).prev().remove();
                    $(el).remove();
                }
            }
            
            
        }
    </script>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>