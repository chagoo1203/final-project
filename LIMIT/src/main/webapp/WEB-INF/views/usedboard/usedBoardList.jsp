<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
 		<style>
        
        #usedBoardArea{
            width: 1200px;
            overflow : auto;
            margin: 0 auto;
        }
        #productTypeForm{
            height: 35px;          
            width: 224px;     
            margin : 0 auto;
            margin-bottom: 100px;
        }
        #productTypeBrandList{
            list-style-type: none;
            margin : 0px;
            padding : 0px;
            height : 100%;
            
        }
        #productTypeBrandList>li{
            
            float:left;
            width : 50%;
            text-align: center;
            height:100%;
            
        }
        #productTypeBrandList p{
            text-decoration: none;            
            font-size: 13px;
            font-weight: 900;
            width: 100%;
            height: 100%; /*a태그는 이라인 요소이기때문에 100% 가 안먹음*/
            display: block; /*그래서 블록으로 바꿈*/
            line-height: 35px;
            margin : 0px;
            padding: 0px;
            /*화면 통합시 이슈가 발생함*/            
            transform: scale(1);
        }
        #productTypeBrandList p:hover{                                    
            font-size:10px;
            
        }
        #productTypeBrandList>li>ul p{font-size : 10px;}
        #productTypeBrandList>li>ul p:hover{font-size: 13px;}
        #productTypeBrandList>li>ul{
            list-style-type: none; /*불릿 삭제*/
            padding : 0px; /*padding 삭제*/            
            display: none;
            
        }
        
        #productTypeBrandList>li>p:hover+ul{
            
            display: block;
        }
        #productTypeBrandList>li>ul:hover{

            display: block;
        }
        #mainCotentForm {
            width: 100%;
            overflow: auto;
            
        }
        .usedItem{
            width: 24%;
            height: 240px;
            float:left;
            
        }
        .usedImgWrap{
            width : 165px;
            height : 150px;
            margin: 0 auto;
            border-top: 1px solid gray;
            border-left: 1px solid gray;
            border-right: 1px solid gray;
            
            margin-top: 20px;
            
            
        }
        .titleWrap{
            width : 165px;
            height: 25px;
            margin: 0 auto;
            border-left: 1px solid gray;
            border-right: 1px solid gray;
            color : gray;
        }
        .priceWrap{
            width: 165px;            
            height: 20px;
            margin: 0 auto;           
            color : gray;
            text-align: right;
         	border-left: 1px solid gray;
            border-right: 1px solid gray;
            border-bottom: 1px solid gray;
        }
        img {
        	
        	cursor : pointer;
        }
    </style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div id ="usedBoardArea">
        <div id = "productTypeForm">
            <ul id = "productTypeBrandList">
                <li>
                    <p>CATEGORY</p>
                    <ul>
                        <li><p>의류</p></li>
                        <li><p>신발</p></li>
                        <li><p>악세서리</p></li>
                    </ul>
                </li>
                
                <li>                
                    <p>BRAND</p>
                    <ul>
                        <li><p>NIKE</p></li>
                        <li><p>JORDAN</p></li>
                        <li><p>ADIDAS</p></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div id ="mainCotentForm">
            
            
        </div>
        
        <div id="pagingArea">
                          
        </div>
    </div>
    <script>
        var cpage =1;
        var productTypeName = "";
        var brandName = "";        
        var collectionName = "";
        $(function(){
            
        	ajaxLoadToUsedBoardPaging();
        })
        
        $(document).on("click", "img", function(){
        	var bno = $(this).parent().siblings("input").val();
        	
        	location.href = "detail.used?boardNo="+bno; 
        })
        
        
        function ajaxLoadToUsedBoardPaging(){
        	$("#pagingArea").empty();         
        	var result ="";
        	$.ajax({
        			url : "aJaxLoadtoUsedBoardPaging.used",
        			data : {cpage : cpage,productTypeName : productTypeName, brandName : brandName, collectionName : collectionName},
        			success : function(pi){
        				console.dir(pi);
        				console.log(pi.listCount);
        				if(pi.currentPage == 1){
        					result += '<button class = "btn btn-outline-secondary disabled" onclick="aJaxloadToList(' + (pi.currentPage - 1) + ')" >&lt;</button>'	
        				}
        				else{
        					result += '<button class = "btn btn-outline-secondary" onclick="aJaxloadToList(' + (pi.currentPage - 1) + ')" >&lt;</button>'
        				}
        				
        				
        				for(var i = pi.startPage; i <= pi.endPage; i++){
                            console.log(i);
                            if(i != pi.currentPage){
                                result +=  '<button class ="btn btn-outline-secondary"  onclick="aJaxloadToList(' + i + ')">'+ i +'</button>';
                            }else{
                                result +=  '<button class="btn btn-outline-secondary" disabled>' + i + '</button>'
                            }
                        }
        				if(pi.currentPage < pi.maxPage){
                            result += '<button class = "btn btn-outline-secondary"  onclick="aJaxloadToList(' + (recipan[1].currentPage + 1) +')">&gt;</button>';
                        }
        				console.log(result);
        				$("#pagingArea").append(result);
        				ajaxLoadToUsedBoardPage(pi);
        			}
        	})
        }
        
        
        
        
        function ajaxLoadToUsedBoardPage(pi){
            $("#mainCotentForm").empty();
            var result = "";
            var startRow = (pi.currentPage - 1) * pi.boardLimit + 1;
            var endRow = startRow + pi.boardLimit - 1;
            
            $.ajax({
                url : "aJaxLoadtoUsedBoard.used",
                data : {cpage : cpage,productTypeName : productTypeName, brandName : brandName, collectionName : collectionName, startRow : startRow, endRow : endRow},
                success : function(list){
                	console.log(list);
                	for(let i in list){
                		console.log(i + '번쨰');
                		result += '<div class = "usedItem">' + 
                		'<input type="hidden" value ="' + list[i].boardNo + '"/>' +
                		'<div class ="usedImgWrap">' +
                            '<img src="' + list[i].titleImg +'" alt="" width="100%" height="100%">' +
                        '</div>' +
                        '<div class = "titleWrap">' +
                            list[i].boardTitle +
                        '</div>' +
                        '<div class ="priceWrap">' +
                            list[i].usedPrice + 
                        '</div>' +
                    	'</div>';
                	}
                	$("#mainCotentForm").append(result);
                },error : function(){
					console.log("test");
                }
            })
        }
    </script>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>