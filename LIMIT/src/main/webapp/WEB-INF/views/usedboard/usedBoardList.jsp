<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 		<style>
        
        #usedBoardArea{
            width: 1200px;
            height: 1200px;
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
            border : 1px solid violet;
        }
        .usedImgWrap{
            width : 165px;
            height : 150px;
            margin: 0 auto;
            border : 1px solid violet;
            margin-top: 20px;
        }
        .titleWrap{
            width : 165px;
            height: 25px;
            margin: 0 auto;
            border : 1px solid violet;
        }
        .titleWrap{
            width: 165px;            
            height: 25px;
            margin: 0 auto;           
            color : gray;

            border : 1px solid violet;             
        }
        .priceWrap{
            width: 165px;            
            height: 20px;
            margin: 0 auto;           
            color : gray;
            text-align: right;
            border : 1px solid violet;
        }
    </style>
</head>
<body>
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
            
            <div class = "usedItem">
                <div class ="usedImgWrap">
                    <img src="./test.png" alt="" width="100%" height="100%">
                </div>
                <div class = "titleWrap">
                    NikeAirForceOne
                </div>
                <div class ="priceWrap">
                    98,00000
                </div>
            </div>
            <div class = "usedItem">
                <div class ="usedImgWrap">
                    <img src="./test.png" alt="" width="100%" height="100%">
                </div>
                <div class = "titleWrap">
                    NikeAirForceOne
                </div>
                <div class ="priceWrap">
                    98,00000
                </div>
            </div>
            <div class = "usedItem">
                <div class ="usedImgWrap">
                    <img src="./test.png" alt="" width="100%" height="100%">
                </div>
                <div class = "titleWrap">
                    NikeAirForceOne
                </div>
                <div class ="priceWrap">
                    98,00000
                </div>
            </div>
            <div class = "usedItem">
                <div class ="usedImgWrap">
                    <img src="./test.png" alt="" width="100%" height="100%">
                </div>
                <div class = "titleWrap">
                    NikeAirForceOne
                </div>
                <div class ="priceWrap">
                    98,00000
                </div>
            </div>
            <div class = "usedItem">
                <div class ="usedImgWrap">
                    <img src="./test.png" alt="" width="100%" height="100%">
                </div>
                <div class = "titleWrap">
                    NikeAirForceOne
                </div>
                <div class ="priceWrap">
                    98,00000
                </div>
            </div>
            <div class = "usedItem">
                <div class ="usedImgWrap">
                    <img src="./test.png" alt="" width="100%" height="100%">
                </div>
                <div class = "titleWrap">
                    NikeAirForceOne
                </div>
                <div class ="priceWrap">
                    98,00000
                </div>
            </div>


        </div>
    </div>
</body>
</html>