<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타일 상세보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <style>
        div{

            box-sizing: border-box;
        }

        #wrap{
        
            margin: auto;
            width: 1200px;

        }

        #style_detail{
            width: 60%;
            margin: auto;

        }
        
        #pictures >img{
            margin-left: 150px;
            width: auto;
            height: 300px;
        }
        
        a{
            text-decoration: none;
            color: black;
        }
        
        li{
            list-style: none;
          }
          
          
			          * {box-sizing: border-box}
			body {font-family: Verdana, sans-serif; margin:0}
			.mySlides {display: none}
			img {vertical-align: middle;
				
				 
				}
			
			/* Slideshow container */
			.slideshow-container {
			  max-width: 1000px;
			  position: relative;
			  margin: auto;
			}
			
			/* Next & previous buttons */
			.prev, .next {
			  cursor: pointer;
			  position: absolute;
			  top: 50%;
			  width: auto;
			  padding: 16px;
			  margin-top: -22px;
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
			
			@keyframes fade {
			  from {opacity: .4} 
			  to {opacity: 1}
			}
			
			/* On smaller screens, decrease text size */
			@media only screen and (max-width: 300px) {
			  .prev, .next,.text {font-size: 11px}
			}
			          
       
          
    </style>
</head>
<body>
  <jsp:include page="../common/menubar.jsp" />
	 <div id="wrap">

     <div id="style_detail">
        <div id="userInfo">
        		<c:if test="${ loginUser.userId eq s.styleWriter }">
        			<button  class="btn-check" name="options-outlined" id="danger-outlined" autocomplete="off">삭제</button>
					<label id="deleteStyle" class="btn btn-outline-danger" for="danger-outlined">삭제</label>
        			<button class="btn-check" id="btn-check-outlined" autocomplete="off" >수정</button>
        			<label  id="updateStyle" class="btn btn-outline-primary" for="btn-check-outlined">수정</label><br>
        		</c:if>
        		
        		
       <script>
       		$(function(){
       		
       			$("#updateStyle").click(function(){
       				
       				location.href = "updateForm.st?sno=${ s.styleNo }";
       		
       			})
       			
       			
       			$("#deleteStyle").click(function(){
       				
       				location.href =  href="delete.st?sno=${ s.styleNo }";
       		
       			})
       			
       			
       		})
       		
       
       </script>
        		
        		
        		
			
		
        		
        		
        		
        		
       	<p style="margin-left:600px">♥ ${ like }개  조회수 ${ s.count }</p>
        </div>
        <div id="pictures" style="width:750px; height:600px">
   				<div class="slideshow-container" style="width:100%; height:100%">

						<c:forEach var="att" items="${ attlist }">
						 	<c:set var = "i" value = "1"/>
								<div class="mySlides faded" style="width:100%; height:100%" >
								 	<div class="numbertext">${i} /  ${fn:length(attlist)}</div>
									<img src="${ att.filePath }" style="width:100%; height:100%">      				
								</div>
							<c:set var = "i" value = "${i + 1}"/>  
				        </c:forEach>
				       
						
					
						
						<a class="prev" onclick="plusSlides(-1)">❮</a>
						<a class="next" onclick="plusSlides(1)">❯</a>
						
						</div>
						<br>
						
						<div style="text-align:center">
							<c:set var = "i" value = "1"/>
								<c:forEach var="d" items="${attlist }">
									<span class="dot" onclick="currentSlide(${i})"></span> 
									<c:set var = "i" value = "${i + 1}"/>  
								</c:forEach>
						</div>
						
						<script>
						let slideIndex = 1;
						showSlides(slideIndex);
						
						function plusSlides(n) {
						  showSlides(slideIndex += n);
						}
						
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
			
	          

        </div>
        
        <br><br><br><br><br>
        <p style="font-size: large;">닉네임 : ${ s.nickname }</p>	
        <div id="hash_tag">
          	<hr>
            <p style="font-size: 19px;">${ s.styleContent }</p>
        </div>
         <br style="clear : both;"/>
           <br><br><br><br><br>
      	<hr>
        <div id="product_tag">
        	<p>태그 상품  ${ plist.size() }개</p>
            <ul>
            	<c:forEach var="p" items="${ plist }">
	                <li>
	                    <a href="">
	                        <p class="product_name">${ p.productName }</p>    
	                        <p class="price_box"></p>
	                    </a>
	                </li>
	            </c:forEach>
        </div>
        <div id="likes">
        	<table>
        		<tr>
	        	<c:if test="${ ! empty loginUser }">
		            <form action="stLike.bo">
		      
		    	   		<button class="btn-check" name="options-outlined" id="danger-outlined" autocomplete="off">좋아요</button>
						<label class="btn btn-outline-danger" for="danger-outlined">좋아요</label>
		              	<input type="hidden" name="styleNo" value="${ s.styleNo }">
		          	  	<input type="hidden" name="userId" value="${ loginUser.userId }">
		           
		           </form>
	           </c:if>
	
	             <button style="margin:5px"  onclick="getURL();"  class="btn-check" name="options-outlined" id="success-outlined" autocomplete="off" checked></button>
	             <label class="btn btn-outline-success" for="success-outlined">공유하기</label>
        		</tr>
        	</table>
        
        	
        	<script>
                        function getURL() {
                           
                            var url = '';    // <a>태그에서 호출한 함수인 clip 생성
                            var textarea = document.createElement("textarea");  
                            //url 변수 생성 후, textarea라는 변수에 textarea의 요소를 생성
                            
                            document.body.appendChild(textarea); //</body> 바로 위에 textarea를 추가(임시 공간이라 위치는 상관 없음)
                            url = window.document.location.href;  //url에는 현재 주소값을 넣어줌
                            textarea.value = url;  // textarea 값에 url를 넣어줌
                            textarea.select();  //textarea를 설정
                            document.execCommand("copy");   // 복사
                            document.body.removeChild(textarea); //extarea 요소를 없애줌
                            
                            alert("URL이 복사되었습니다.")  // 알림창

                        }
                    </script>

        </div>
            <br clear="both">
        <div id="reply_box">
          <table id="replyArea" class="table" align="center" style="width:900px">
                <thead>
                
                	<c:choose>
                	
                		<c:when test="${ empty loginUser }">
		                    <tr>
		                        <th colspan="2">
		                            <textarea class="form-control" readonly  cols="55" rows="2" style="resize:none; width:100%;">로그인 후 이용 가능합니다.</textarea>
		                        </th>
		                        <th style="vertical-align:middle"><button class="btn btn-secondary disabled">등록하기</button></th>
		                    </tr>
                    	</c:when>
                    	
                    	
                    	
                    	
                    	
                    	<c:otherwise>
                    		<tr>
		                        <th colspan="2">
		                            <textarea class="form-control"  id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
		                        </th>
		                        <th style="vertical-align:middle"><button class="btn btn-secondary" onclick="addReply();">등록하기</button></th>
		                    </tr>
                    	</c:otherwise>	
                    	
                	</c:choose>
                	
                	
                	
                	
                    <tr>
                        <td colspan="3">댓글(<span id="rcount">0</span>)</td>
                    </tr>
                </thead>
                <tbody>
             
                </tbody>
            </table>
			
			
			<script>
    	$(function(){
    		// 댓글조회하는 기능을 호출
    		selectReplyList();
    	})
    	
    	function addReply(){
    		console.log(112);
    		if($('#content').val().trim() != ""){
			
    			$.ajax({
    				url:"rinsert.bo",
    				data:{
    					refSno: ${s.styleNo},
    					replyContent: $('#content').val(),
    					replyWriter: "${loginUser.userId}"
    				},success:function(status){
    					if(status == "success"){
    						selectReplyList();
    						$("#content").val("");
    					}
    				}, error:function(){
    					console.log("댓글 작성 실패");
    				}
    			})
    		}
    		else{
    			alert("댓글을 작성 하세요")	
    		}
    		
    	}
    	
    	
    	function selectReplyList(){
    		
    		$.ajax({
    			url: "rlist.bo", // 전체조회가 아님! 게시글에 딸린 댓글만 조회해야한다. (현재 게시글 번호만 넘겨야 한다)
    			data: {sno:${s.styleNo}},
    			success:function(list){
    				let value = "";
    				
    				for(let i in list){
    					value += "<tr>"
    						  + "<th>" + list[i].nickname +"</th>"
    						  + "<td>" + list[i].replyContent +"</td>"
    						  + "<td>" + list[i].replyDate +"</td>"
    						  + "</tr>"
    				}
    				
    				$("#replyArea tbody").html(value);
    				$("#rcount").text(list.length);
    				
    			}, error:function(){
    				console.log("실패~")
    			}
    			
    		})
    		
    	}
    </script>
			
        </div>
        






     </div>
    


    </div>
    <br clear="both">
    <jsp:include page="../common/footer.jsp" />
</body>
</html>