<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        #imgInsertWrap, #categoryWrap, #titleContextWrap{
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
        #categoryDropBoxWrap,#categoryDropBoxWrap{
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
        <form action="">
        <p style="font-weight: bold; font-size: 24px; margin : 0px; margin-bottom: 5px;">필수 입력</p>
        
        <div id = "imgInsertWrap" style="height: 200px;">
            <div id ="textWrap" style="width : 152px; height : 152px; float: left;"><p style="font-weight: bold;">상품 이미지</p><p style="color : red">*</p><p style="color : gray;" id="photoCount">(0/10)</p></div>
            <div id = "imgWrap" style=" width: 1000px; float:left; margin-top: 20px;">
                <img src="pngtree-vector-camera-icon-png-image_1576543.jpg" alt="" id="insertImgForm"/>   
                <input hidden type="file" name="usedImg" id="usedImgInput0"  onchange="loadImg(this);">

            </div>
        </div>

        <div id = "categoryWrap" style="margin-top : 10px; height: 250px;">
            <p style="font-weight:bold;">CATEGORY</p>
            <div id ="categoryBox" style="margin-left : 50px;">
                <div id="categoryBoxNameWrap">
                    <p class = "categoryLogo">종류별 </p>
                </div>

                <div id="categoryRadioWrap" class ="d-grid gap-2" style="width: 45%; height : 100%; float : left;">
                    <input type="radio" class="btn-check" name="productTypeName" id="option1" autocomplete="off" style="padding: 100px;">
                    <label class="btn btn-outline-secondary btn-block" for="option1" >의류</label>

                    <input type="radio" class="btn-check" name="productTypeName" id="option2" autocomplete="off">
                    <label class="btn btn-outline-secondary" for="option2">신발</label>

                    <input type="radio" class="btn-check" name="productTypeName" id="option3" autocomplete="off">
                    <label class="btn btn-outline-secondary" for="option3">악세사리</label>

                    <input type="radio" class="btn-check" name="productTypeName" id="option4" autocomplete="off">
                    <label class="btn btn-outline-secondary" for="option4">기타</label>
                </div>                
            </div>
            <div id ="brandBox" style="margin-left : 200px;">
                <div id="brandBoxNameWrap">
                    <p class = "categoryLogo" >BRAND</p>
                </div>
                <div id="categoryDropBoxWrap">
                    <select class="selectpicker" name ="brandName">
                        <optgroup label="A">
                          <option>Adidas</option>                          
                        </optgroup>
                        <optgroup label="N">
                          <option>Nike</option>                          
                        </optgroup>
                      </select>
                </div>
            </div>
            <div id ="collectionBox" style="margin-left : 150px;">
                <div id="collectionNameWrap" >
                    <p class = "categoryLogo" >COLLECTION</p>
                </div>
                <div id="categoryDropBoxWrap">
                    <select class="selectpicker" name="collectionName">
                        <option>Mustard</option>
                        <option>Ketchup</option>
                        <option>Relish</option>
                    </select>
                </div>
            </div>
        </div>
        

        <div id = "titleContextWrap">
            <div id = "titleWrap" style="width : 100%; overflow : auto; ">
                <div style="width: 100px;  font-weight: bold; float : left;" >PRODUCT TITLE</div>
                <div id="titleWrap" style=" float: left; width : 1000px; height: 50px; margin-top : 40px">
                    <input class="form-control" type="text" placeholder="INSERT TITLE" name = "boardTitle">
                </div>
            </div>
 
            <div id="contentWrap" style="width : 100%; overflow : auto; ">
                <div style="width: 100px;font-weight: bold; float : left;" >PRODUCT CONTENT</div>

                <div class = "form-group" id="titleWrap" style=" float: left; width : 1000px; height: 400px; margin-top : 40px">
                    
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="16" style="resize : none;" name ="boardContent"></textarea>
                </div>

            </div>
            
        </div>
        <div id="submitWrap" style="margin : auto; width: 100px; height: 100px; margin-top : 25px;" >
            <button type="submit" class="btn btn-secondary">작성완료</button>
        </div>
        
        </form>
    </div>
    <script>
        var usedImgCount = 0;
        $(document).on("click","#insertImgForm",function(){
            
            var el = "#usedImgInput" + usedImgCount;                           
            console.log(el);
            $(document).ready();
            $(el).click();  

        })
        
        
        function loadImg(inputFile){
            
            if(inputFile.files.length == 1){ // 파일이 있냐
                var el = "#usedImg" + usedImgCount;
                var reader = new FileReader();
                // FileReader객체로부터 파일을 읽어들이는 메소드를 호출
                //인자값으로 어느 파일을 읽을건지 전달해줌
                reader.readAsDataURL(inputFile.files[0]);
                //해당 파일을 읽어들이는 순간 그 파일만의 고유한 url 이 부여된다.
                //->해당 url을 src속성으로 부여할것(attr)                        
                //파일 읽기가 완료되었을때 실행할 함수
                reader.onload = function(e){
                    // e의 target -> e.target -> 이벤트를 발생한 요소
                    //e의 target.result에 각 파일의 url 이 담김.
                    //각 영역에 맞춰 이미지 미리보기
                    console.log(el);
                    imgEl = '<img src="" alt="" id="usedImg'+ usedImgCount + '"/>'
                    inputEl = '<input hidden type="file" name="usedImg" id="usedImgInput'+ (usedImgCount+1) +'" onchange="loadImg(this);">';                    
                    $("#imgWrap").append(imgEl);
                    $("#imgWrap").append(inputEl);
                    $(el).attr("src", e.target.result);   
                    $("#photoCount").text('(' + (usedImgCount + 1) + '/10)')
                    usedImgCount++;
                    
                };
            }else{                        
                    $(el).attr("src", null);                               
            }
            
            
        }
    </script>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>