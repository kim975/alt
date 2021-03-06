<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="/WEB-INF/views/include/header.jsp" %>
<script src="https://kit.fontawesome.com/3929e16ef5.js"></script>

<style>
	
	.inbutton {
    width:100px;
    background-color: #00CC00;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    text-align: center;
    cursor: pointer;
    border-radius:10px 0 10px 0;
}

.intext{
   width:300px; 
   border-style: solid;
   border-width: 0 0 0 8px; 
   padding: 12px; 
   word-break: break-all;
   border-color: LightGreen;
   background-color:rgba(211, 211, 211, 0.2);
}
	
	.chat div{
		margin-bottom: 7px;
		
	}
	
	.h_container{
	    background-color: #cac7c7;
	    border-radius: 20px;
	    box-shadow: 0 2px 8px rgba(0,0,0,.1);
	    display: inline-block;
	    width:35px;
	    height:35px;
	    text-align:center;
	    line-height:45px;
		color: red;
	}
	#heart{
		
	    font-size: 25px;
	}
	#heart:hover{
	    color:red;
	}

	.bigPictureWrapper {
		position: fixed;
		display: none;
		justify-content: center;
		align-items: center;
		top: 0%;
		width: 100%;
		height: 100%;
		background-color: gray;
		z-index: 100;
		background: rgba(255, 255, 255, 0.5);
	}
	
	.bigPicture {
		position: relative;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.bigPicture img {
		width: 700px;
		/* height: 100%; */
		max-width: 100%;
		/* width: auto; */
		overflow: hidden;
	} 
	
	ul {
		width: 100%px;
	} 
	
	ul li {
		width: 100%px;
	} 
	
	.page ul li {list-style-type: none; float: left;}
	
	.page-item.active .page-link {
	    z-index: 3;
	    color: #fff;
	    background-color: green;
	    border-color: green;
	}
	
	.page-link {
	    color: green;
	}
</style>
	
	<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
	  <ol class="breadcrumb" style="padding-left:200px;">
	    <li class="breadcrumb-item"><a href="/">???</a></li>
	    <li class="breadcrumb-item active"><a href="/board/saleBoard">???????????????</a></li>
	  </ol>
	</nav>
	
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.memberVO" var="memberVO"/>
	</sec:authorize>
	
	<section class="d-flex align-items-center justify-content-center">
		<div class="container">
			<div class="basket row">
				<div class="col-md-6">
					<div id="${sale.sno }">
						
						<!-- ????????? ????????? ?????? -->
						
					</div>
				</div>		
				<div class="col-md-6">
					<span style="font-size: 33px;"><c:out value="${sale.stitle }"></c:out></span>
					<button id='doZim' type="button" style="border: 0; outline: 0; color: red; background-color: white;">
						<div class="h_container">
							<i id="heart" class="far fa-heart"></i>
						</div>
					</button>
					<sec:authorize access="isAuthenticated()">
           				<c:if test="${sale.vid==memberVO.vid }">
							<a href="/board/saleModify?sno=${sale.sno }" class="btn btn-success" style="background-color: #009970;">??????</a>
							<a href="/board/saleDelete?sno=${sale.sno }" class="btn btn-danger">??????</a>
						</c:if>
					</sec:authorize>	
					<hr>
					<div class="form-group">
              			<label><b>------ ??????</b></label><br>
              			<span style="font-size: x-large;"><fmt:formatNumber value="${sale.sprice }" pattern="###,###"/> ???</span>
              			<input type="hidden" name='price' value='${sale.sprice }'>
            		</div>      
            		<div class="form-group">
              			<label><b>------ ?????? ??????</b></label><br>
              			<span style="font-size: x-large;"><fmt:formatNumber value="${sale.samount }" pattern="###,###"/> ???</span>
              			<input type="hidden" value='${sale.samount }'>
            		</div>
					<div class="form-group">
					<label><b>------ ?????? ??????</b></label><br>
              			<input style="width: 20%; margin-right: 10px;" class="form-control" type="number" name='amount' value="1" min="0"><br>
              			<sec:authorize access="hasAnyRole('ROLE_CLIENT','ROLE_VENDOR')">
            			<button style="margin-right: 5px;" id='moveBasket' type="button" class="btn btn-outline-success" style="color: #009970;">????????????</button>
						<a href="" class="btn btn-success" style="background-color: #009970;" onclick="javascript:window.open('/chat?vid=${sale.vid}','new','left=50, top=50, width=600, height=800')">???????????? ????????????</a>           				
            			</sec:authorize>
            		</div>
            		<sec:authorize access="isAnonymous()">
            			<p style="color: gray;"><b>* ????????? ?????? ?????? ?????? ????????? ???????????? ????????? ????????? ?????? ????????????.<br>&nbsp;&nbsp;&nbsp;???????????? ????????? ??????????????? ????????? ??????????????????.</b></p>
					</sec:authorize>
					<div class="form-group">
              			<label><b>------ ?????? ??????</b></label>
              			<pre style='white-space: pre-wrap;'> ${sale.sinfo }</pre> 
            		</div>
				</div>		
				<input type="hidden" name='clientId' value='${memberVO.cid }'>
				<input type="hidden" name='sno' value='${sale.sno }'>
			</div><!-- row close -->
		</div> <!-- container close -->
		
	</section>
	
	<hr class="my-hr3">
	
	<section>
		<div class="container" style="align-items: center;">
			<div class="attachImage row" style="width: 780px;">
				
			</div>
		</div>		
	</section>
	
	<%-- <section>
		<div class="container">
			<c:set var="rstar" value="${countRstar }"/>
			<c:out value="${rstar[0].RSTAR}"></c:out>
			<c:forEach var="i" begin="1" end="5" step="1">
				
				 
			</c:forEach>
		</div>
	</section> --%>
	
	<section>
		<div class="container" style="align-items: center;">
			<div style="width: 1100px;">
				<div style="width: 100%;" class="text-right"><div><input type="button" class="replyWrite btn btn-success" style="background-color: #009970;" value="?????? ??????"/></div></div>
				<ul class="chat" style="list-style:none; width: 100%;"><!--  start reply -->
					
	    		</ul><!-- ./ end ul -->		
	    		<div class="panel-footer" id="replyPagingNum">
	    		
	    		</div><!-- /.end panel-footer -->	
			</div>
		</div>		
	</section>
	
	<div class="bigPictureWrapper">
		<div class="bigPicture">
		
		</div>
	</div>
			
	<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
	
	<%-- beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	 		},
	      
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}"; --%>
	
<script type="text/javascript" src="/resources/customjs/basket.js"></script>
<script type="text/javascript" src="/resources/customjs/customReply.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">



var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

var _cid = '<c:out value="${memberVO.cid}"></c:out>'; 

$(document).ajaxSend(function(e, xhr, options) {
   xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);   
})
	/* ????????? ????????? ???????????? ????????? ????????? */
	$(document).ready(function() {
		(function() {
			
			var snoStr = '<c:out value="${sale.sno }"/>';
	
			$.getJSON("/board/getThumbList", {snoStr: snoStr}, function(arr) {
	
				var str = "";
				
				$(arr).each(function(i, attach) { 
					
						
					var fileCallPath = encodeURIComponent(attach.stuploadPath + "/" + attach.stuuid + "_" + attach.stfileName);
					
					str = "<div data-path='" + attach.stuploadPath + "' data-uuid='" + attach.stuuid + "' data-filename='" + attach.stfileName + "' data-type='" + attach.stfileType + "'>"
						+  "	<div>"
						+  "		<img  style='width: 100%; height: 100%;' src='/display?fileName=" + fileCallPath + "'>"
						+  "	</div>"
						+  "</div>";
						
					$("#" + attach.sno).prepend(str);
				});
				
			}); //end getJSON
			
		})();
	});
	
	/* ?????? ????????? */
	$(document).ready(function() {
		(function() {
			
			var snoStr = '<c:out value="${sale.sno }"/>';
			
			$.getJSON("/board/getImageList", {sno: snoStr}, function(arr) {
				
				var str = "";
				
				$(arr).each(function(i, attach) { 
						
					var fileCallPath = encodeURIComponent(attach.suploadPath + "/" + attach.suuid + "_" + attach.sfileName);
					
					str = "<div data-path='" + attach.suploadPath + "' data-uuid='" + attach.suuid + "' data-filename='" + attach.sfileName + "' data-type='" + attach.sfileType + "'>"
						+  "	<div>"
						+  "		<img  style='width: 100%; height: 100%;' src='/display?fileName=" + fileCallPath + "'>"
						+  "	</div>"
						+  "</div>";
						
					$(".attachImage").append(str);
				});
				
			}); //end getJSON
		})();
	});
	
	var snoValue = '<c:out value="${sale.sno}"/>';
  	var replyUL = $(".chat");
  
	 
	function showList(page){
		 
		 console.log("show list " + page);
	    
		 replyService.getList({sno:snoValue,page: page|| 1 }, function(replyCnt, list, replyImgVO) {
		     
			 console.log("data.replyImgVO: " + replyImgVO);
	       	 console.log("replyCnt: "+ replyCnt );
	       	 console.log("list: " + list);
	        
	      	 if(page == -1){
	         	pageNum = Math.ceil(replyCnt/10.0);
	       	 	showList(pageNum);
	       	 	return;
	       	 }
		    	
		     var str="";
		     
		     if(list == null || list.length == 0){
		    	 replyUL.html("<li style='text-align: center'>????????? ???????????? ????????????.</li>");
		      	 return;
		     }
		     
		     for (var i = 0, len = list.length || 0; i < len; i++) {
			    str += "<li style='width:100%;' class='left clearfix' data-rno='"+list[i].rno+"'>"
			       	 + "  <div style='width:100%;'>"
			       	 + "    <span class='primary-font'>"+list[i].rwriter+"</span>"
			       	 + "	<div style='color:orange;'>";
			       	 
				for (var j = 0; j < 5; j++) {
					if(j < list[i].rstar) {
						str += "<i class='fas fa-star'></i>";	
					} else {
						str += "<i class='far fa-star'></i>";
					}
				}
			       	 
			    str += " 	</div>"   	 
			    	 + "    <div style='width:100%;' class='header d-flex img" + list[i].rno + "'>"
  			       	 + "    </div>"
  			       	 + "    <pre style='white-space: pre-wrap;'>"+list[i].rcontent+"</pre>";
  			       	 
  			    if (list[i].rwriter == _cid) {
  			    	str += "	<a class='btn btn-success' style='background-color:#009970;' href='/replies/replyModify?sno=${sale.sno}&rno="+ list[i].rno +"'>??????</a>"
  			    		+ "		<a class='btn btn-outline-success' style='color:#009970;' onclick='deleteCheck()' href='/replies/replyDelete?sno=${sale.sno}&rno="+ list[i].rno +"'>??????</a>";
				}   	 
  			       			 
				str += "  </div>"
			       	 + "</li>"
			       	 + "<hr>";
			       	 
		     }
		     
		     replyUL.html(str);
		     
		     if (replyImgVO != null) {
	    	 	for (var i = 0, imgLen = replyImgVO.length || 0; i < imgLen; i++) {
						
					var fileCallPath = encodeURIComponent(replyImgVO[i].ruploadPath + "/s_" + replyImgVO[i].ruuid + "_" + replyImgVO[i].rfileName);
					str =  "<div class='uploadResult'>"					
					 	+  "	<div class='imagePath' data-path='" + replyImgVO[i].ruploadPath + "' data-uuid='" + replyImgVO[i].ruuid + "' data-filename='" + replyImgVO[i].rfileName + "' data-type='" + replyImgVO[i].rfileType + "'>"
						+  "			<img style='width: 90px; height:90px;' src='/display?fileName=" + fileCallPath + "'>"
						+  "	</div>"
						+  "</div>";
						
					$(".img" + replyImgVO[i].rno).append(str);
			 	}	
			 }
		     
		     showReplyPage(replyCnt);
	 
	    });//end function    
	 }//end showList
	
	 function deleteCheck() {
		
		 var message = confirm("?????????????????????????");

			if(message == true){

				return true;
			}else{
				
				event.preventDefault();
				return false;
			}
		 
	}
	 
	 var pageNum = 1;
	   var replyPageFooter = $("#replyPagingNum");
	   var pagingNumCnt = 10; //???????????? ????????? ????????? ??????
	    
	       function showReplyPage(replyCnt){ //?????? ???????????? ?????? ????????? ???????????? replyCnt(????????????)??? ??????
	            
	          //??? ????????? ?????? : ???????????? 10.0??? 10??? ???????????? ????????? ????????? ??????
	            var endNum = Math.ceil(pageNum / (pagingNumCnt * 1.0)) * 10;  
	           //?????? ????????? ?????? : ???????????? -9??? ??????????????? ????????? 10?????? (10-1)??? ???
	          var startNum = endNum - (pagingNumCnt - 1);
	      		
	            var prev = startNum != 1;
	            var next = false;
	      
	            if(endNum * 10 >= replyCnt){ //10??? ???????????? ????????? ?????? ??????
	             endNum = Math.ceil(replyCnt / (pagingNumCnt*1.0)); 
	            //10.0??? ???????????? ????????? ????????? ??????
	            }
	      
	            //next = endNum * 10 < replyCnt;
	           if(endNum * 10 < replyCnt){
	              next = true;
	            }
	      
	            var str = "<div class='page'><ul class='pagination pull-right'  style='display: table; margin-left: auto; margin-right: auto;'>";
	      
	            if(prev){
	              str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>??????</a></li>";
	            }
	      
	            for(var i = startNum ; i <= endNum; i++){
	              //?????????????????? ????????? ??????.
	              
	              var active = pageNum == i? "active":"";
	        
	              str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
	              
	            }
	      
	            if(next){
	              str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>??????</a></li>";
	            }
	      
	            str += "</ul></div>";
	      
	            //console.log(str);
	      
	            replyPageFooter.html(str);
	       }
  
		//????????? ?????? ?????? ??? ????????? ?????? ????????? ???????????????
		//????????? ???????????? ??????
	 	replyPageFooter.on("click","li a", function(e){
		    e.preventDefault();
		    //console.log("page click");
		    
		    var targetPageNum = $(this).attr("href");
		    
		    //console.log("targetPageNum: " + targetPageNum);
		    
		    pageNum = targetPageNum;
		    
		    showList(pageNum);
		});      
	 
	$(document).ready(function() {
		 
		 showList(1);
	});
	
	var basket = $(".basket");
	var price = basket.find("input[name='price']");
	var amount = basket.find("input[name='amount']");
	var sno = basket.find("input[name='sno']");
	var cid = '<c:out value="${memberVO.cid}"></c:out>'
	var vid = '<c:out value="${memberVO.vid}"></c:out>';
	
	$("#moveBasket").on("click",function(e){
		
         if (vid != '') {

             alert("?????? ????????? ?????? ???????????????.");
			 return;
         }
         
         if (cid == '') {

             alert("????????? ??? ????????? ???????????????.");
			 return;
         }
		
		var basketProduct = {
			cid:cid,
			sno: sno.val(),
			bprice:price.val(),
			bamount:amount.val()
		};
	    
		$.ajax({ 
			//????????????
			type: 'post', 
			//???????????? ????????? ?????? URL
			url: '/board/basket', 
			//??????????????? ???????????? ????????? ???????????????
			//data ?????? ???????????? ?????? ???????????? ???????????? consumes ?????? ?????? ?????? ?????????????????? ??????
			data: JSON.stringify(basketProduct), 
			//???????????? ????????? ????????? ??????(MIME ??????)
			contentType: "application/json; charset=utf-8", 
			//xhr(XML Http Request)
			beforeSend: function(xhr){
		    	  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		    },
			success: function(result, status, xhr){ 
				//callback ??????????????? ????????? ????????? ???, ????????? ??????
				alert("??????????????? ??????????????????.");
			}
		})
		
	});
	
	$("#doZim").on("click",function(e){
		
		if (vid != '') {

            alert("?????? ????????? ?????? ???????????????.");
			 return;
        }
        
        if (cid == '') {

            alert("????????? ??? ????????? ???????????????.");
			 return;
        }
		
		
		var zimProduct = {
			cid:cid,
			sno: sno.val()
		};
	    
		$.ajax({ 
			type: 'post',
			async:false,
			url: '/board/doZim', 
			data: JSON.stringify(zimProduct), 
			contentType: "application/json; charset=utf-8",
			dataType:"json",
			beforeSend: function(xhr){
		    	  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		    },
			success: function(result, status, xhr){ 
				if(result == 1) {
					var str = '<i id="heart" class="fas fa-heart"></i>';
					$(".h_container").html(str);
					alert("??? ????????? ?????? ???????????????.");
				} else {
					var str = '<i id="heart" class="far fa-heart"></i>';
					$(".h_container").html(str);
					alert("??? ????????? ?????? ???????????????.");
				}
			}
		})

	});
	
	$(".replyWrite").on('click', function(e){
		
		if (vid != '') {

            alert("?????? ????????? ?????? ???????????????.");
			return;
        }
		
		if (cid == '') {

            alert("????????? ??? ????????? ???????????????.");
			return;
        }
		
		
		
		 location.href="/replies/replyRegister?sno=${sale.sno }";
		
	});

	
	$(document).on('click', '.imagePath', function(e){
		
		console.log("view image");
		
		var liObj = $(this);
		
		var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));
		
			
		showImage(path.replace(new RegExp(/\\/g), "/"));

	});
	
	function showImage(fileCallPath) {
		
		/* alert(fileCallPath); */
		
		$(".bigPictureWrapper").css("display", "flex").show();
		
		$(".bigPicture")
		.html("<img src='/display?fileName=" + fileCallPath + "'>");
		/* .animate({width:'100%', height: '100%'}, 0); */
	}
	
	$(".bigPictureWrapper").on("click", function(e) {
		
		/* $(".bigPicture").animate({width:'0%', height: '0%'}, 0); */
		
		setTimeout(function() {
			
			$(".bigPictureWrapper").hide();
		}, 0);
	})
	
	/* ?????????  */
	$(document).ready(function() {
	    
		var zimProduct = {
			cid:cid,
			sno: sno.val()
		};
		
		$.ajax({ 
			type: 'post',
			async:false,
			url: '/board/checkZim', 
			data: JSON.stringify(zimProduct), 
			contentType: "application/json; charset=utf-8",
			dataType:"json",
			beforeSend: function(xhr){
		    	  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		    },
			success: function(result, status, xhr){ 
				
				
				if(result == 1) {
					var str = '<i id="heart" class="fas fa-heart"></i>';
					$(".h_container").html(str);
				} else {
					var str = '<i id="heart" class="far fa-heart"></i>';
					$(".h_container").html(str);
				}
			},
			error: function() {
				alert("asd");
			}
		})

	});
	
</script>
<%@include file="/WEB-INF/views/include/footer.jsp" %>


