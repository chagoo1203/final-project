<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타일 입력폼</title>
    <style>
        div{
            box-sizing: border-box;
        }
        a{
            text-decoration: none;
            color: black;
        }
        li{
            list-style: none;
            float: left;
         }
        #wrap{
        	
            margin: auto;
            width: 1200px;
            height: 1200px;
        }
        #insert_area{
            width: 60%;
            margin: auto;
            height: 1200px;
        }
        #pictures >img{
            margin-left: 60px;
            width: 600px;
            height: 600px;
        }
        #insert_area > button{
            margin: 5px;
            margin-left: 100px;
        }
        .product_name{
            font-size: small;
        }
        #product_list_area{
            width: 600px;
            height: 400px;
        }
        .product > picture > img{
            width: 120px;
            height: 120px;
        }
        .product_info{
            width: 150px;
        }
        .submit{
            width: 500px;

        }
        #inp1,#inp2,#inp3,#inp4
        {
            
        }

        </style>
</head>
<body>
	   <jsp:include page="../common/menubar.jsp" />
	   <div style="width:1200px; height:100px"></div>

	  <div id="wrap">
        <form action="insertStyle.bo" method="post" enctype="multipart/form-data">
			<input type="hidden" name="styleWriter" value="${ loginUser.userId }">
            
            <div id="insert_area">
                
                <div id="pictures">
                    <img  id="contentImg" width="200" height="150">
                </div>
            
                <script>
                	function loadImg(inputFile, num){
	        		if(inputFile.files.length == 1){ // 파일이 있는지 확인
						
						// 선택된 파일을 읽여들여서 그 영역에 맞는 미리보기

						// 파일을 읽어들일 FileReader 객체 생성
						var reader = new FileReader();

						// FileReader객체로부터 파일을 읽어들이는 메소드를 호출
						// 어느 파일을 읽을 것인지 인자 값으로 전달해줌
						reader.readAsDataURL(inputFile.files[0]);
						// 해달 파일을 읽어들이는 순간 그 파일만의 고유한 긴 url이 부여됨
						// => 해당 url을 src속성으로 부여할 것 (attr)

						// 파일 읽기가 완료되었을 때 실행할 함수를 정의
						reader.onload = function(e){
							// e의 target => e.target => 이벤트 적용된 것

							// e의 target.result에 각 파일의 url이 담김

							// 영역에 맞춰서 이미지 미리보기
							$("#contentImg").attr("src", e.target.result);
						}
					}
	        	}
                </script>
    
       

                <button id="btn1" type="button" onclick="fileupload1()">썸네일</button>
                <button id="btn2" type="button"  onclick="fileupload2()">사진1</button>
                <button id="btn3" type="button"  onclick="fileupload3()">사진2</button>
                <button id="btn4" type="button"  onclick="fileupload4()">사진3</button>

                <input id="inp1"   type="file" name="styleImg" required accept="image/*" onchange="loadImg(this,1);"/>
                <input id="inp2"   type="file" name="styleImg"> 
                <input id="inp3"   type="file" name="styleImg">
                <input id="inp4"   type="file" name="styleImg">
                <br><br><br><br>

                <script>
                    $(function(){
                        
                        
                    })
                    
                    function fileupload1(){
                        var inp1 = document.getElementById("inp1");
                        inp1.click();
                    }

                    function fileupload2(){
                        var inp2 = document.getElementById("inp2");
                        inp2.click();
                    }

                    function fileupload3(){
                        var inp3 = document.getElementById("inp3");
                        inp3.click();
                    }

                    function fileupload4(){
                        var inp4 = document.getElementById("inp4");
                        inp4.click();
                    }
                </script>

















                <textarea name="styleContent" id="" cols="70" rows="10" style="resize: none; margin-left:75px ;"
                placeholder="해시태그또는 내용을 입력해주세요" required></textarea>
                <br><br><br><br>
                
                

                <div id="product_tag_area">
                    <p>상품태그 N개</p>
                    <input type="text" name="styleTag" id="" placeholder="상품검색"> <button>검색</button>
                </div>
                
                <br><br><br><br><br><br><br><br>
                
                <div id="product_list_area">
                    <!-- 
                    <ul class="produt_list">
                        <li class="product_items">
                            <a href="">
                                <div class="product">
                                    <picture>
                                        <img src="https://kream-phinf.pstatic.net/MjAyMTA3MjZfMTUz/MDAxNjI3MjYzNjE1Mzgw.BSpjIuYP9gjkLxRg5GdHOPeIzqLX4M2YKcySSYOaIhUg.HGv-zJfu6o8YCtSajmbV2_CGQLISs68WaYx-88HueOEg.JPEG/p_3039e3527f9c4a1d82d0ccce125b12a2.jpg?type=s_webp" alt="">
                                    </picture>
                                </div>
                                <div class="product_info">
                                    <p class="product_name">IAB Studio Pigment T-Shirt Oatmel</p>
                                    <div class="amount">
                                        113,000 원
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <div class="product">
                                    <picture>
                                        <img src="https://kream-phinf.pstatic.net/MjAyMTA3MjZfMTUz/MDAxNjI3MjYzNjE1Mzgw.BSpjIuYP9gjkLxRg5GdHOPeIzqLX4M2YKcySSYOaIhUg.HGv-zJfu6o8YCtSajmbV2_CGQLISs68WaYx-88HueOEg.JPEG/p_3039e3527f9c4a1d82d0ccce125b12a2.jpg?type=s_webp" alt="">
                                    </picture>
                                </div>
                                <div class="product_info">
                                    <p class="product_name">IAB Studio Pigment T-Shirt Oatmeal</p>
                                    <div class="amount">
                                        113,000 원
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                     -->
                <div class="submit">
                    <button type="submit" style="margin-left: 250px;">작성</button>
                    <button type="reset">되돌리기</button>
                </div>

            </div>
            
        </form>
	<jsp:include page="../common/footer.jsp" />
    </div>
	
	
	
	
	
	
	
	
</body>
</html>