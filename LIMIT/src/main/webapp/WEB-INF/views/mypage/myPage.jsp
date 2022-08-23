<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style>
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
        .mypageMenu {
	float: left;
    width: 500px;
	font-size: 20px;
	margin-left: 20%;
	margin-top: 100px;
	margin:left;
}

    </style>
</head>
<body>
    
	<jsp:include page="../common/menubar.jsp" />
	
	<div class="mypageMenu">
		<p class="title"></p>
		<a href="myPageBuy.me">구매 상품</a> <br>
		<a href="myPageSell.me">판매 상품</a> <br>
		<a href="myPageInte.me?userId=${loginUser.userId}">관심 상품</a>
	</div>
	
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>마이페이지</h2>
            <br>
​
            <form action="update.me" method="post" id="mypageForm">
                <div class="form-group">
                    <label for="userId"> 아이디 : </label>
                    <input type="text" class="form-control" id="userId" value="${loginUser.userId }" name="userId" readonly> <br>
​
                    <label for="userName"> 이름 : </label>
                    <input type="text" class="form-control" id="userName" value="${loginUser.userName}" name="userName" readonly> <br>
                    
                     <label for=nickName"> &nbsp; 별명 : </label>
                    <input type="text" class="form-control" id="nickName" value="${loginUser.nickName}" name="nickName" onkeyup="renickCheck();"> <br>
                    <div id="checkResult" style="font-size:0.7em; display:none"></div>
                    <br>

                                              새로 사용할 비밀번호 입력                                                         		
             		<input type="password" class="form-control" id="userPwd" value="${loginUser.userPwd}" name="userPwd" placeholder="새로 비밀번호를 입력해 주세요"><br>
                    
                     <label for="birthDate"> &nbsp; 생일 : </label>
                    <input type="text" class="form-control" id="birthDate" value="${loginUser.birthDate}" name="birthDate" readonly> <br>
                    
                    <label for="email"> &nbsp; Email : </label>
                    <input type="text" class="form-control" id="email" value="${loginUser.email }" name="email"> <br>


                    <label for="phone"> &nbsp; Phone : </label>
                    <input type="tel" class="form-control" id="phone" value="${loginUser.phone }" name="phone"> <br>
                    
                    <label for="addresss"> &nbsp; 현재주소 : </label>
                    <input type="text" class="form-control" id="addresss" value="${loginUser.address}"  readonly> <br>
                    
                    <label for="address"> * 주소변경하기 : </label>
		            <input type="text" class="form-control" id="address_kakao" name="address_search" required readonly />
		            <input type="text" class="form-control" id="address_detail" name="address_detail"/> <br>
		            <input type="button" onclick="addrSuccess()" value="주소확인" required/> &nbsp;&nbsp;* 주소를 입력하고 버튼을 꼭 눌러주세요!!<br>
		            <input type="hidden" class="form-control" id="address" name="address" value="" required /> <br>
                    
                    
                    <label for=""> &nbsp; 성별 : </label> &nbsp;&nbsp;
                    <input type="radio" id="Male" value="M" name="gender" checked onclick="return(false);">
                    <label for="Male">남자</label> &nbsp;&nbsp;
                    
                    
                    <input type="radio" id="Female" value="F" name="gender" onclick="return(false);">
                    <label for="Female">여자</label> &nbsp;&nbsp;
                	
                </div> 
                
                <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                
                
                <script>
                window.onload = function(){
        		    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        		        //카카오 지도 발생
        		        new daum.Postcode({
        		            oncomplete: function(data) { //선택시 입력값 세팅
        		                document.getElementById("address_kakao").value = data.address; // 주소 넣기
        		                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
        		            }
        		        }).open();
        		    });
        		}
                	
                	
                	 function addrSuccess(){
               		  
               		  var addr1 = document.getElementById("address_kakao");
               		  var addr2 = document.getElementById("address_detail");
               		  var addr3 = addr1.value + " " + addr2.value;
               		  
               		  $('input[id=address]').attr('value',addr3);
               		  console.log(addr3);
               		  
               	  }
                	 $(function(){
                     	if("${loginUser.gender }" != "" ){
                     			$('input[value="${loginUser.gender}"]').attr("checked",true);
                     		
                     		}
                     	})
                
                	
        
        const $nickName = $('#mypageForm input[name=nickName]');
		
		if($nickName.val().length >= 2 && $nickName.val().length <= 8){
			$.ajax({
				url : 'renickCheck.me',
				data : {checkNick:$nickName.val()},
				success : function(result1){
					//console.log(result);
					if(result1 == 'NNNNN'){
						$('#nickCheck').show();
						$('#nickCheck').css('color', 'orangered').text('이미 중복된 닉네임이 존재합니다');
						
					}else{ //사용가능
						var regExpNick = /^[가-힣]{2,8}$/
						
						if(!regExpNick.test($nickName.val())){ //정규식에 맞지 않는 경우
							$('#nickCheck').show();
							$('#nickCheck').css('color', 'orangered').text('한글만 입력해주세요');
							
						}else{
							$('#nickCheck').show();
							$('#nickCheck').css('color', 'yellowgreen').text('사용가능한 닉네임입니다');
						
						}
					}
				},
				error : function(){
					console.log("닉네임 중복쳌 실패");
				
				}
			});
		}else{
			$('#nickCheck').show();
			$('#nickCheck').css('color', 'orangered').text('2이상 8이하여야 합니다');
			
		}

                </script>
                <br>
                <div class="btns" align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
                </div>
            </form>
        </div>
        <br><br>
        
    </div>
​
    <!-- 회원탈퇴 버튼 클릭 시 보여질 Modal -->
    <div class="modal fade" id="deleteForm">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
​
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">회원탈퇴</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
​
                <form action="delete.me" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div align="center">
                            탈퇴 후 복구가 불가능합니다. <br>
                            정말로 탈퇴 하시겠습니까? <br>
                        </div>
                        <br>
                            <label for="userPwd" class="mr-sm-2">Password : </label>
                            <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="userPwd" name="userPwd"> <br>
                            <input type="hidden" name="userId" value="${ loginUser.userId }" />
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="submit" class="btn btn-danger">탈퇴하기</button>
                    </div>
              
              </form>

                </div>
                </div>
            </div>

        

        


  <jsp:include page="../common/footer.jsp" />
​
</body>
</html>
