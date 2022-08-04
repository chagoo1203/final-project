<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            height: 600px;
            border : 2px solid gray;
        }
        #mainContentWrap{
            width: 1060px;
            height: 400px;
            margin-top: 30px;
            margin-left: 60px;
            float : left;
            border : 1px solid black;
        }
        #imgSliderWrap{
            float:left;
            margin-top: 50px;
            margin-left: 100px;
            height: 300px;
            width : 30%;
            border : 1px solid black;
        }

        .slider{
            width: 100%;
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
            border: 1px solid black;
            float : left;
        }
        #mainContentBtnWrap{
            margin-left: 145px;
            margin-top: 20px;
            width: 350px;
            height: 100px;
            border: 1px solid black;
            float : left;
        }
        #mainContentTitleWrap,#mainContentPriceWrap{
            width: 100%;
            height: 50%;
            float : left;
            box-sizing: border-box;
            border : 1px solid black;
        }
    </style>
</head>
<body>
	<div id = "detailFormWrap">
        <div id="detaiHeaderWrap">
            <div id ="categoryWrap">
                <div class="categoryLogWrap">
                    <p>종류별</p>
                </div>
                <div class="categoryValueWrap">
                    <p>하의</p>
                </div>
            </div>
            <div id ="brandWrap">
                <div class="categoryLogWrap">
                    <p>BRAND</p>
                </div>
                <div class="categoryValueWrap">
                    <p>Nike</p>
                </div>
            </div>
            <div id = "collectionWrap">
                <div class="categoryLogWrap">
                    <p>COLLECTION</p>
                </div>
                <div class="categoryValueWrap">
                    <p>하의</p>
                </div>
            </div>
        </div>


        <div id="detailMainContentWrap">
            <div id="mainContentWrap">
                <div id="imgSliderWrap">
                    <div class="slider">
                        <input type="radio" name="slide" id="slide1" checked>
                        <input type="radio" name="slide" id="slide2">
                        <input type="radio" name="slide" id="slide3">
                        <input type="radio" name="slide" id="slide4">
                        <ul id="imgholder" class="imgs">
                            <li><img src="./test.png"></li>
                            <li><img src="./test.png"></li>
                            <li><img src="./test.png"></li>
                            <li><img src="./test.png"></li>
                        </ul>
                        <div class="bullets">
                            <label for="slide1">&nbsp;</label>
                            <label for="slide2">&nbsp;</label>
                            <label for="slide3">&nbsp;</label>
                            <label for="slide4">&nbsp;</label>
                        </div>
                    </div>
                </div>

                <div id="mainContentTextWrap">
                    <div id="mainContentTitleWrap">

                    </div>
                    
                    <div id="mainContentPriceWrap">

                    </div>
                </div>

                <div id = "mainContentBtnWrap">

                </div>
            </div>
        </div>
    </div>
</body>
</html>