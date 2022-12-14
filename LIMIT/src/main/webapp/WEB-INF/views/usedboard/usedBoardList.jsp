<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        #mainCotentForm {
            width: 100%;            
            overflow : auto;
            
        }
        .resellFilter{
     		width : 300px;
     		height : 100%;
     		margin : auto;
        }
        .usedItem{
            width: 24%;
            height: 255px;
            float:left;
            cursor : pointer;
        }
        
        .usedImgWrap{
            width : 165px;
            height : 150px;
            margin: 0 auto;
            border : 3px solid gray;
			border-radius : 10%;
            
            margin-top: 20px;
            
            
        }
        .brandNameWrap{
        	width : 165px;
            height: 35px;
            margin: 0 auto;

            color : black;
            font-weight : bold;
            text-align : left;
        }
        .titleWrap{
            width : 165px;
            height: 25px;
            margin: 0 auto;

            color : black;
            font-weight : middle;            
            font-size : 8px;
        }
        .priceWrap{
            width: 165px;            
            height: 20px;
            margin: 0 auto;           
            font-size : 15px;
            font-weight : bold;
            text-align: right;
            

        }
        img {
        	border-radius : 10%;
        	
        }
    </style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	
	<div id ="usedBoardArea">		
        <div class="container-fluid">
            <div class="row">
              <div class="resellFilter" style ="margin-top : 25px;">              
                  <ul>
                          ???????????? <br><br>
                      <span>
                          <div>
                              <input type="checkbox" name="productTypeName" id="clothes" value="??????">
                              <label for="clothes">??????</label>
                          </div>
                          <div>
                              <input type="checkbox" name="productTypeName" id="shoes" value="??????">
                              <label for="shoes">??????</label>
                          </div>
                          <div>
                              <input type="checkbox" name="productTypeName" id="etc" value="??????">
                              <label for="etc">??????</label>
                          </div>
                      </span>
                  </ul>
                  <ul>
                      ????????? <br><br>
                      <span>
                          <c:forEach var="b" items="${brandList}">
                              <div>
                                  <input type="checkbox" name="brandName" class="${b.commonName}" value="${b.commonName}">
                                  <label for="${b.commonName}">${b.commonName}</label>
                              </div>
                          </c:forEach>
                      </span>
                      </ul>
                  <ul>
                      ????????? <br><br>
                      <span>
                          <c:forEach var="c" items="${collectionList}">
                              <div>
                                  <input type="checkbox" name="collectionName" class="${c.commonName}" value="${c.commonName}">
                                  <label for="${c.commonName}">${c.commonName}</label>
                              </div>
                          </c:forEach>
                      </span>
                      
                      </ul>                                                      
                </div>

                <div id="mainCotentFormWrap" style="width : 75%; margin-top : 70px">
                    <div id ="mainCotentForm">
                    
                    
                    </div>
                    
                    <div id="pagingArea" align="center" style="margin-top : 50px;">
                                    
                    </div>
                    
                    <c:if test="${not empty loginUser }">
                        <button type="button" class="btn btn-outline-dark" onclick="location.href = 'enrollForm.used'" style="float:right">??????</button>			        			
                    </c:if>
                </div>                
            </div>
        </div>
    </div>
    <script>
        var cpage =1;
        var productTypeName = [];
        var brandName = [];        
        var collectionName = [];
        $(function(){            
        	ajaxLoadToUsedBoardPaging();
        })
        $(document).on("change", "input[name=productTypeName]", function(){
            productTypeName = [];
            $("input[name=productTypeName]:checked").each(function(e){
                productTypeName.push($(this).val());
            });
            ajaxLoadToUsedBoardPaging();  
        })
        $(document).on("change", "input[name=brandName]", function(){
            brandName = [];
            $("input[name=brandName]:checked").each(function(e){
                brandName.push($(this).val());
            });            
            ajaxLoadToUsedBoardPaging();
        })
        $(document).on("change", "input[name=collectionName]", function(){
            collectionName = [];
            $("input[name=collectionName]:checked").each(function(e){
                collectionName.push($(this).val());
            });            
            ajaxLoadToUsedBoardPaging();
        })

           
        $(document).on("click", "img", function(){
        	var bno = $(this).parent().siblings("input").val();        	
        	location.href = "detail.used?boardNo="+bno; 
        })
        
        
        
        
        function ajaxLoadToUsedBoardPaging(page){
            if(page){
                cpage = page;
            }        
        	$("#pagingArea").empty();         
        	var result ="";
        	$.ajax({
        			url : "aJaxLoadtoUsedBoardPaging.used",
        			traditional: true,   			
        			data : {cpage : cpage, productTypeName : productTypeName, brandName : brandName, collectionName : collectionName},
        			success : function(pi){
        			
        				if(pi.currentPage == 1){
        					result += '<button class = "btn btn-outline-secondary disabled" onclick="ajaxLoadToUsedBoardPaging(' + (pi.currentPage - 1) + ')" >&lt;</button>'	
        				}
        				else{
        					result += '<button class = "btn btn-outline-secondary" onclick="ajaxLoadToUsedBoardPaging(' + (pi.currentPage - 1) + ')" >&lt;</button>'
        				}
        				
        				
        				for(var i = pi.startPage; i <= pi.endPage; i++){
                           
                            if(i != pi.currentPage){
                                result +=  '<button class ="btn btn-outline-secondary"  onclick="ajaxLoadToUsedBoardPaging(' + i + ')">'+ i +'</button>';
                            }else{
                                result +=  '<button class="btn btn-outline-secondary" disabled>' + i + '</button>'
                            }
                        }
        				if(pi.currentPage < pi.maxPage){
                            result += '<button class = "btn btn-outline-secondary"  onclick="ajaxLoadToUsedBoardPaging(' + (pi.currentPage + 1) +')">&gt;</button>';
                        }
        			
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
                traditional: true,
                data : {cpage : cpage, productTypeName : productTypeName, brandName : brandName, collectionName : collectionName, startRow : startRow, endRow : endRow},
                success : function(list){
                	console.log(list);
                	for(let i in list){
                		console.log(i + '??????');
                		result += '<div class = "usedItem">' + 
                		'<input type="hidden" value ="' + list[i].boardNo + '"/>' +
                		'<div class ="usedImgWrap">' +
                            '<img src="' + list[i].titleImg +'" alt="" width="100%" height="100%">' +
                        '</div>' +
                        '<div class = "brandNameWrap">' +
                        	list[i].brandName + 
                        '</div>' +
                        '<div class = "titleWrap">' +
                            list[i].boardTitle +
                        '</div>' +
                        '<div class ="priceWrap">' +
                            list[i].usedPrice + '???' +
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