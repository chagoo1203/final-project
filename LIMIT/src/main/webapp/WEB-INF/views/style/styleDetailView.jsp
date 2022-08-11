<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타일 상세보기</title>
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
    </style>
</head>
<body>
  <jsp:include page="../common/menubar.jsp" />
	 <div id="wrap">

     <div id="style_detail">
        <div id="userInfo"><p style="font-size: large; text-align:center;">${ s.styleWriter }</p>
        		<c:if test="${ loginUser.userId eq s.styleWriter }">
        			<a href="delete.st?sno=${ s.styleNo }">삭제</a>
        			<a href="updateForm.st?sno=${ s.styleNo }">수정</a>
        		</c:if>
        </div>
        <div id="pictures">
   

	            <c:forEach var="att" items="${ attlist }">
					<img src="${ att.filePath }" style="width:400px">       
	            </c:forEach>

        </div>
        <div id="hash_tag">
            <p style="font-size: 19px;">${ s.styleContent }</p>
        </div>
        <div id="product_tag">
            <ul>
                <li>
                    <a href="">
                        <p class="product_name">Nike Air Force 1 '07 Low White </p>    
                        <p class="price_box">132000원</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <p class="product_name">Jordan 1 Retro Low OG Black and Dark Powder Blue </p>    
                        <p class="price_box">132000원</p>
                    </a>
                </li>
            </ul>
        </div>
        <div id="likes">
        	<table>
        		<tr>
	        	<c:if test="${ ! empty loginUser }">
		            <form action="stLike.bo">
		      
		    	   		<button>좋아요</button>
		              	<input type="hidden" name="styleNo" value="${ s.styleNo }">
		          	  	<input type="hidden" name="userId" value="${ loginUser.userId }">
		           
		           </form>
	           </c:if>
	
	             <button style="margin:5px"  onclick="getURL();">공유하기</button>
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
    						  + "<th>" + list[i].replyWriter +"</th>"
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