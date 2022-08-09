<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
      .content {
          background-color:white;
          width:1200px;
          margin:auto;
      }
      .innerOuter {
          border:1px solid lightgray;
          width:800px;
          margin:auto;
          padding:0;
          background-color:white;
      }
      
</style>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>회원가입</h2>
            <br>

            <form action="insert.me" method="post" id="enrollForm" >
                <div class="form-group">
                	<div>*는 필수 사항입니다.</div><br>
                    <label for="userId">* 아이디 : </label>
                    <label for="userId">&nbsp;&nbsp;영문자로 시작하는 영문자 또는 숫자 6~20자를 입력해주세요  </label>
                    <input type="text" class="form-control" id="userId" name="userId"  maxlength="20" onkeyup="idCheck();" required> <br>
					<div id="checkResult" style="font-size : 0.7em; display:none"></div><br>
					
                    <label for="userPwd">* 비밀번호 : </label>
                    <label for="userPwd">&nbsp;&nbsp;8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합해주세요 </label>
                    <input type="password" class="form-control" id="userPwd" name="userPwd"  maxlength="16" onkeyup="pwdInput();" required> <br>
                    <div id="inputPw" style="font-size : 0.7em; display:none"></div>
                    <br>
					
                    <label for="checkPwd">* 비밀번호 확인 : </label>
                    <input type="password" class="form-control" id="checkPwd" maxlength="16" onkeyup="rePwd();" required> <br>
                    <div id="checkPw" style="font-size : 0.7em; display:none"></div>
					<br>

                    <label for="userName">* 이름 : </label>
                    <input type="text" class="form-control" id="userName" name="userName"  maxlength="6" onkeyup="nameCheck();" required> <br>
					<div id="namecheck" style="font-size : 0.7em; display:none"></div>
					<br>
					
                    <label for="email"> * 이메일 : </label>
                    <input type="text" class="form-control" id="email" placeholder="예) khuser01@naver.com " name="email" required> <br>
					<div id="emailcheck" style="font-size : 0.7em; display:none"></div>
					<br>
					
                    <label for="birthDate">* 생일 : </label>
                    <input type="text" class="form-control" id="birthDate" placeholder="YYYY-MM-DD 형식으로 입력해주세요"  maxlength="10" name="birthDate" onkeyup="birthCheck();" required> <br>
                    <div id="birthcheck" style="font-size : 0.7em; display:none"></div>
					<br>

                    <label for="phone"> * 전화번호 : </label>
                    <input type="text" class="form-control" id="phone" placeholder="01X-XXXX-XXXX 형식으로 입력해주세요"  maxlength="13" name="phone" onkeyup="phoneCheck();" required> <br>
                    <div id="phonecheck" style="font-size : 0.7em; display:none"></div>
					<br>
                    
                    <label for="nickName"> * 별명 : </label>
                    <label for="userPwd">&nbsp;&nbsp;한글 2~8자 사이로 입력해주세요 </label>
                    <input type="text" class="form-control" id="nickName" name="nickName"  maxlength="8" onkeyup="nickCheck();" required> <br>
                    <div id="nickCheck" style="font-size : 0.7em; display:none"></div><br>
                    
                    <label for="address"> * 주소 : </label>
                    <input type="text" class="form-control" id="address_kakao" name="address_search" required readonly />
                    <input type="text" class="form-control" name="address_detail"/> <br>
                    <input type="hidden" class="form-control" name="address" value="서울시" required /> <br>
                    
                    
                    <label for="gender"> * 성별 : </label> &nbsp;&nbsp;
                    <input type="text" class="form-control" id="gender" maxlength="1" placeholder=" F / M " name="gender" onkeyup="genderCheck();" required> <br>
                    <div id="genderCheck" style="font-size : 0.7em; display:none"></div><br>
                </div> 
                <br>
                <div class="btns" align="center">
                    <button type="submit" class="btn btn-primary" id="enrollbutton">회원가입</button>
                    <button type="reset" class="btn btn-danger">초기화</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>
    <!-- 주소 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    
		function idCheck(){
			//아이디 중복 체크
				var ok1;
				const $idInput = $('#enrollForm input[name=userId]');
					//console.log($idInput.val());
									
					if($idInput.val().length >= 6){
						$.ajax({
							url : 'idCheck.me',
							data : {checkId:$idInput.val()},
							success : function(result){
								//console.log(result);
								if(result == 'NNNNN'){
									$('#checkResult').show();
									$('#checkResult').css('color', 'orangered').text('이미 중복된 아이디가 존재합니다');
								}else{ //사용가능
									var regExpId = /^[a-z]+[a-z0-9]{5,19}$/g;
	
									if(!regExpId.test($idInput.val())){ //정규식에 맞지 않는 경우
										$('#checkResult').show();
										$('#checkResult').css('color', 'orangered').text('형식을 맞춰주세요');
									}else{
										$('#checkResult').show();
										$('#checkResult').css('color', 'yellowgreen').text('사용가능한 아이디입니다');
										ok1 = result;
									}
								}
							},
							error : function(){
								console.log("아이디 중복쳌 실패");
							}
						});					
					}else{
					    $('#checkResult').hide();
				    }	
					return ok1;
			}
			
			var $pwdInput = $("#enrollForm input[name=userPwd]");// 아무것도 안뜨면 선택자 문제임 아무튼 선택자 문제임
		function pwdInput(){
			var regExpPwd = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
			var ok2
			
			//비밀번호 체크
			
				if($pwdInput.val() != ""){ //빈 문자열이 아니라면
					if(!regExpPwd.test($pwdInput.val())){			
						$('#inputPw').show();
						$('#inputPw').css('color', 'orangered').text('형식을 맞춰주세요');
					}else{
						$('#inputPw').show();
						$('#inputPw').css('color', 'yellowgreen').text('사용가능한 비밀번호입니다');
						ok2 = "Y"
					}
				}else{
					$('#inputPw').hide();
				}
			return ok2;
		}
		
		function rePwd(){
	 		var $rePwd = $("#enrollForm input[id=checkPwd]");
			var regExpPwd = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
			var ok3;

		//비밀번호 확인 체크
		 		if(regExpPwd.test($rePwd.val())){
		 			if($pwdInput.val() != $rePwd.val()){
		 				$('#checkPw').show();
						$('#checkPw').css('color', 'orangered').text('비밀번호가 일치하지 않습니다');
		 			}else{
		 				$('#checkPw').show();
						$('#checkPw').css('color', 'yellowgreen').text('비밀번호가 일치합니다');
						ok3 = "Y";
		 			}
		 		}else{
		 			$('#checkPw').show();
		 			$('#checkPw').css('color', 'black').text('위 비밀번호와 같이 입력해주세요');
		 		}
	 		return ok3;
		}
		
		function nameCheck(){

			//이름 한글만
			var $userName = $("#enrollForm input[name=userName]");
			var regExpName = /^[가-힣]{1,5}$/
			var ok4;
				if(!regExpName.test($userName.val())){
					if($userName.val() == ""){
						$('#namecheck').hide();
					}else{
						$('#namecheck').show();
						$('#namecheck').css('color', 'orangered').text('한글 외에 다른 것을 입력하셨습니다.');
					}
				}else{
					$('#namecheck').show();
					$('#namecheck').css('color', 'yellowgreen').text('확인');
					ok4 = "Y"
				}
			return ok4;
		}
		
		function birthCheck(){
			
			
			//생일
			var $birthDate = $("#enrollForm input[name=birthDate]");
			var regExpBirth = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
			var ok5;
				if(!regExpBirth.test($birthDate.val())){
					if($birthDate.val() == ""){
						$('#birthcheck').hide();
					}else{
						$('#birthcheck').show();
						$('#birthcheck').css('color', 'orangered').text('형식이 잘못되었습니다');
					}
				}else{
					$('#birthcheck').show();
					$('#birthcheck').css('color', 'yellowgreen').text('확인');
					ok5 = "Y"
				}
			return ok5;
		}
			
		function phoneCheck(){
			
			//전화번호
			var $phone = $("#enrollForm input[name=phone]");
			var regExpPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
			var ok6;
				if(!regExpPhone.test($phone.val())){
					//console.log($phone)
					if($phone.val() == ""){
						$('#phonecheck').hide();
					}else{
						$('#phonecheck').show();
						$('#phonecheck').css('color', 'orangered').text('형식이 잘못되었습니다');
					}
				}else{
					$('#phonecheck').show();
					$('#phonecheck').css('color', 'yellowgreen').text('확인');
					ok6 = "Y"
				}
			return ok6;
		}			
		
		function nickCheck(){
			
			
			//닉네임 중복 체크
				const $nickName = $('#enrollForm input[name=nickName]');
				var ok7;	
					if($nickName.val().length >= 2 && $nickName.val().length <= 8){
						$.ajax({
							url : 'nickCheck.me',
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
										ok7 = result1;
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
			return ok7;
		}
		
		function genderCheck(){
			
				//성별
				var $genderCheck = $("#enrollForm input[name=gender]");
				var regExpGender = /^[FM]$/;
				var ok8;
					if(!regExpGender.test($genderCheck.val())){
						if($genderCheck.val() == ""){
							$('#genderCheck').hide();
						}else{
							$('#genderCheck').show();
							$('#genderCheck').css('color', 'orangered').text('대문자 F 또는 M 만 입력 해주세요');
						}
					}else{
						$('#genderCheck').show();
						$('#genderCheck').css('color', 'yellowgreen').text('확인');
						ok8 = "Y"
					}
			return ok8;
		}			
		
		
		// 입력값에 따른 회원가입 요청 버튼 함수
	</script>
	<script>
	  //주소 합친거
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
	</script>
		

	
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>