<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,300,1,0" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>	
		.material-symbols-outlined {
		color : red;
		  font-variation-settings:
		  'FILL' 1,
		  'wght' 300,
		  'GRAD' 0,
		  'opsz' 48		 
		}
        body * {
            
            box-sizing: border-box;

        }
        p {
            margin : 0px;
        }
        #chatWrap{
            width: 1200px;
            height: 600px;
            border-radius: 5%;
            
            margin : 0 auto;
            background-color: rgb(245, 245, 245);
        }

        #logWrap{            
            float: left;
            width: 30%;      
            height: 15%;      
        }     
        #chatListWrap{
            width : 30%;
            height: 80%;
            margin-top: 90px;
            margin-left : -360px;
            float :left;
            overflow: auto;
            
        }
           
        #conversation{
            width : 60%;
            height: 100%;
            float :left;
        }
        .chatListMember{
            width : 100%;
            height: 100px;
            box-sizing: border-box;
            border : 1px solid black;
            cursor: pointer;
        }
        #conversationTitleWrap{
            width: 100%;
            height: 15%;
            background-color: rgb(26, 25, 25);
        }
        #conversationText{
            width: 100%;
            height: 70%;
            background-color: white;
            overflow: auto;
        }
        #conversationInputWrap{
            
            width: 100%;
            height: 15%;
        }
        .chatListTitle{
            width : 100%;
            height: 30%;            
            color: white;
            background-color: black;
        }
        .chatListContent{
            width: 100%;
            height: 70%;
            background-color: silver;
        }
        
        .textWrapLeft, .textWrapRight{
            margin-top: 10px;
            margin-left: 10px;
        }
        .textWrapRight{
            margin-right: 10px;
        }
        .textLeftContent{
            
            border-radius: 10%;
            padding: 5px;
            display: inline-block; 
            background-color :rgb(26, 25, 25);
             color : white;
        }
        .textRightContent{

            border-radius: 10%;
            padding: 5px;
            display: inline-block; 
            background-color :silver;
             color : black;
        }
        .textDate{
        	color : gray;
        	font-size : 13px;
        }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div id="chatWrap">
        <div id="logWrap">
            <p style="font-size: 45px; font-family: cursive; margin-top : 15px" align="center">LIM:IT</p>
        </div>
        <div id="chatListWrap">
         
        </div>




        <div id="conversation">
            <div id="conversationTitleWrap">
                <div id="conversationTitle" align="center" style="font-size: 25px; color : white; padding-top: 25px;">

                </div>                
            </div>
            <div id="conversationText">
                

            </div>
            <div id="conversationInputWrap">
                
                <div class="input-group mb-3" style="height: 100%;">
                    <textarea id="textBox" class="form-control" placeholder="Insert Message" aria-label="Recipient's username" aria-describedby="button-addon2" style="resize: none;"></textarea>
                    <button class="btn btn-outline-secondary" type="button" id="button-addon2" disabled>SEND</button>
                  </div>
            </div>
        </div>
    </div>

    <script>
        var toUser ="";
        var chatListInterval;
        var loadChatTextInterval;
        
        function loadChatTextInterval(){
        	if(aJaxLoadToTextList == true){
        		if(aJaxloadToChatList() == true) return true;
        	}
        }
       
        $(function(){
        	chatListInterval = setInterval(() => aJaxloadToChatList(), 1000);            
        })
        $(document).on("click", ".chatListMember" , function(){
            //채팅 불러오기 
            toUser = $(this).children().siblings("input").val();
                                    
            if(chatListInterval != null){
            	clearInterval(chatListInterval);
            }
            loadChatTextInterval = setInterval(() => loadChatTextInterval(), 1000);

            $("#conversationTitle").empty();
            $("#conversationTitle").append(toUser+"님과의 대화");
            $("#button-addon2").attr("disabled", false);
        })
        
       

        $(document).on("click", "#button-addon2" , function(){
            //채팅 입력 기능 이벤트
            var today = new Date();
			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);	
			var hours = ('0' + today.getHours()).slice(-2); 
			var minutes = ('0' + today.getMinutes()).slice(-2);
			
			var sysdate = year + '-' + month  + '-' + day + '-' + hours  + '-' + minutes;
			
            var text = $("#textBox").val();
            $("#textBox").val("");
            aJaxChatInsert(toUser, text, sysdate);
            $("#button-addon2").attr("disabled", false);
        })
        function aJaxloadToChatList(){
            $.ajax({
                url : "aJaxloadToChatList.used",
                data : {userId : "${loginUser.userId}"},
                success : function(list){
                    var result = "";
                    for(var i = 0; i < list[0].length; i++){
                        result += '<div class="chatListMember">' 
                        + '<input hidden value = "' + list[0][i] + '"/>'
                        + '<div class="chatListTitle" align ="center">'
                        + list[0][i] + '님과의 대화'
                        + '</div>'
                        + '<div class="chatListContent">'
                        + list[1][i];
                        
                        if(list[3][i] == "N" && list[4][i] != "${loginUser.userId}"){
                       		console.log(list[3][i]);
                       		result += '<div class = "chatAlram" style = "float:right"><span class="material-symbols-outlined">notifications</span></div>'
                       	}
                        
                        result += '<div class ="chatListDate" style="margin-top : 20px;text-align : right" >'
                       	+ list[2][i]
                       	+ '</div>'                       	
                        + '</div>'                       	
                        + '</div>'
                    }
                    $("#chatListWrap").empty();
                    $("#chatListWrap").append(result);                    
                    
                },error : function(){
                  
                  
                }
                
            })
            return true;
        }
        function aJaxLoadToTextList(toUser){
            $.ajax({
                url : "aJaxLoadToTextList.used",
                data : {userId : "${loginUser.userId}", toUser : toUser},
                success : function(textList){
                    $("#conversationText").empty();
                    console.log(textList);
                    var result = "";
                    for(var i = 0; i < textList.length; i++){
                        
                        if(textList[i].msgWriter != "${loginUser.userId}"){
                            result += '<div class="textWrapLeft" align = "left">'
                            	+ '<span class ="textLeftContent">'
                                + textList[i].text
                                + '</span>'
                                + '<span class ="textDate" style = "margin-left : 8px;">'
                                + textList[i].date
                                + '</span>'
                                + '</div>';
                        }else{
                            result += '<div class="textWrapRight" align = "right">'
                            	+ '<span class ="textDate" style = "margin-right : 8px;">'
                                + textList[i].date
                                + '</span>'
                           		+ '<span class ="textRightContent">'
                            	+ textList[i].text                                
                            	+ '</span>'                                
                                + '</div>';
                        }
                    }
                    $("#conversationText").append(result);
                },error : function(){
                  
                }
                
            })
            return true;
        }
        function aJaxChatInsert(toUser, text, sysdate){        	
            $.ajax({
                url : "aJaxChatInsert.used",
                data : {userId : "${loginUser.userId}", toUser : toUser, text : text, sysdate : sysdate},
                success : function(msg){
                    
                },error : function(){
                  
                }
                
            })
        }
    </script>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>