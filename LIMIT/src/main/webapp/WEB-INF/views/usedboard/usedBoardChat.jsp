<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>	
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
        .textWrapLeft > span{
            
            border-radius: 10%;
            padding: 5px;
            display: inline-block; 
            background-color :rgb(26, 25, 25);
             color : white;
        }
        .textWrapRight > span{

            border-radius: 10%;
            padding: 5px;
            display: inline-block; 
            background-color :silver;
             color : black;
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
            <div class="chatListMember">
                <div class="chatListTitle" align ="center">
                    admin 님과의 대화
                </div>             
                <div class="chatListContent">
                    학교교육 및 평생교육을 포함한 교육제도와 그 운영, 교육재정 및 교원의 지위에 관한 기본적인...
                </div>                
            </div>            
        </div>




        <div id="conversation">
            <div id="conversationTitleWrap">
                <div id="conversationTitle" align="center" style="font-size: 25px; color : white; padding-top: 25px;">
                    admin 님과의 대화
                </div>                
            </div>
            <div id="conversationText">
                
                <div class="textWrapLeft" align = "left">
                    <span>
                        test
                    </span>                    
                </div>
                <div class="textWrapRight" align = "right">
                    <span>
                        test
                    </span>
                </div>
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
        $(function(){
            aJaxloadToChatList();
        })
        $(document).on("click", ".chatListMember" , function(){
            //채팅 불러오기 
            toUser = $(this).children().siblings("input").val();
            setInterval(() => aJaxLoadToTextList(toUser), 1000);
            
            $("#conversationTitle").empty();
            $("#conversationTitle").append(toUser+"님과의 대화");
            $("#button-addon2").attr("disabled", false);
        })



        $(document).on("click", "#button-addon2" , function(){
            //채팅 입력 기능 이벤트
            var text = $("#textBox").val();
            aJaxChatInsert(toUser, text);
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
                        + list[1][i] 
                        + '</div></div>'
                    }
                    $("#chatListWrap").empty();
                    $("#chatListWrap").append(result);                    
                    
                },error : function(request,status,error){
                  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                  
                }
                
            })
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
                            result += '<div class="textWrapLeft" align = "left"><span>'
                                + textList[i].text
                                + '</span></div>';
                        }else{
                            result += '<div class="textWrapRight" align = "right"><span>'
                                + textList[i].text
                                + '</span></div>';
                        }
                    }
                    $("#conversationText").append(result);
                },error : function(request,status,error){
                  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
                
            })
        }
        function aJaxChatInsert(toUser, text){
            $.ajax({
                url : "aJaxChatInsert.used",
                data : {userId : "${loginUser.userId}", toUser : toUser, text : text},
                success : function(msg){
                    console.log(msg);
                },error : function(request,status,error){
                  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
                
            })
        }
    </script>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>