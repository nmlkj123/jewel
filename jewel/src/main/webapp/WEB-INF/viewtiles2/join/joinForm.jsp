<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script type="text/javascript"src="<c:url value="/resources/js/post.js"/>" ></script> 
 <script type="text/javascript"src="<c:url value="/resources/js/joinForm.js"/>" ></script>
<script type="text/javascript">
/* 아이디체크 */
function checkId(){
	var id = $('#MEM_ID').val();
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/join/checkId'/>");
	comAjax.setCallback("fn_checkIdCallback");
	comAjax.addParam("id",id);
	comAjax.ajax();
}

function fn_checkIdCallback(data){
	if(data){
    	$('#MEM_IDW').text(" 사용중인 아이디");
		$('#MEM_IDW').css("color","red");
		$('#MEM_IDW').css("font-size","9pt");
		$('#MEM_IDW').css("font-weight","bold");
		$('#MEM_ID').attr("check", "0");
	}else{
		$('#MEM_IDW').text(" 사용가능");
		$('#MEM_IDW').css("color","green");
		$('#MEM_IDW').css("font-size","9pt");
		$('#MEM_IDW').css("font-weight","bold");
		$('#MEM_ID').attr("check", "1");
    }
}
/* 닉네임체크 */
function checkNick(){
	var nick = $('#MEM_NICK').val();
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/join/checkNick'/>");
	comAjax.setCallback("fn_checkNickCallback");
	comAjax.addParam("nick",nick);
	comAjax.ajax();
}

function fn_checkNickCallback(data){
	if(data){
    	$('#MEM_NICKW').text(" 사용중인 닉네임");
		$('#MEM_NICKW').css("color","red");
		$('#MEM_NICKW').css("font-size","9pt");
		$('#MEM_NICKW').css("font-weight","bold");
		$('#MEM_NICK').attr("check", "0");
    }else{
    	$('#MEM_NICKW').text(" 사용가능");
		$('#MEM_NICKW').css("color","green");
		$('#MEM_NICKW').css("font-size","9pt");
		$('#MEM_NICKW').css("font-weight","bold");
		$('#MEM_NICK').attr("check", "1");
    }
}


$( document ).ready(function() {
	/*
	이메일 인증 버튼 클릭시 발생하는 이벤트
	*/
	$("#emailBtn").on("click", function(){
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if($('#email').val().length==0){
			$('#MEM_EMAILW').text(" 이메일 입력");
			$('#MEM_EMAILW').css("color","red");
			$('#MEM_EMAILW').css("font-size","9pt");
			$('#MEM_EMAILW').css("font-weight","bold");
			$('#email').focus();
			return false;
		}else if(!reg_email.test($('#email').val())){
			$('#MEM_EMAILW').text(" 잘못된 이메일 형식");
			$('#MEM_EMAILW').css("color","red");
			$('#MEM_EMAILW').css("font-size","9pt");
			$('#MEM_EMAILW').css("font-weight","bold");
			$('#email').focus();
			return false;
		}
		
	/* 이메일 중복 체크 후 메일 발송 비동기 처리 */
		
		$.ajax({
			type:"get",
			url : "<c:url value='/join/createEmailCheck'/>",
			data : "userEmail=" + $("#email").val() + "&random=" + $("#random").val(),
			//data: "userEmail="+encodeURIComponent($('#userEmail').val()),
			/* encodeURIComponent
			예를들어, http://a.com?name=egoing&job=programmer 에서 &job=programmer
			중 '&'는 하나의 파라미터가 끝나고 다음 파라미터가 온다는 의미이다.
			그런데 다음과 같이 job의 값에 &가 포함된다면 시스템은 job의 값을 제대로 인식할수 없게 된다. */
			success : function(data){
					alert("이메일을 보냈습니다. 인증번호를 입력해주세요.");
				
			},
			error: function(data){
				alert("에러가 발생했습니다.");
				return false;
			}
		});
	});
	/*
	이메일 인증번호 입력 후 인증 버튼 클릭 이벤트
	*/
	$("#emailAuthBtn").on("click", function(){
		$.ajax({
			type:"get",
			url:"<c:url value='/join/emailAuth'/>",
			data:"authCode=" + $('#emailAuth').val() + "&random=" + $("#random").val(),
			success:function(data){
				if(data=="complete"){
					alert("인증이 완료되었습니다.");
					$('#email').val("${sessionScope.userEmail}");
					$('#email').attr("readonly", true); 
					$('#emailAuth').attr("readonly", true);  
					$('#email').attr("check", "1");
					$('#emailBtn').hide(); 
					$('#emailAuthBtn').hide(); 
				}else if(data == "false"){
					alert("인증번호를 잘못 입력하셨습니다.")
				}
			},
			complete: function(){
				$('#loadingImg').hide();
				   $('#mask').hide();
			},
			error:function(data){
				alert("에러가 발생했습니다.");
			}
		});
	});
});


</script>
<!-- 로딩 css -->
<style>
	#mask {  
	  position:absolute;  
	  left:0;
	  top:0;
	  z-index:100;  
	  background-color:#000;  
	  display:none;  
	}
       #loadingImg {
	  position:absolute;
	  left:45%;
	  top:50%;
	  z-index:120;
	}
</style>
<!-- 로딩 검은색 스크립트 -->
<script>
function wrapWindowByMask(){
	//화면의 높이와 너비를 구한다.
	var maskHeight = $(document).height();  
	var maskWidth = $(window).width();  
	
	//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	$('#mask').css({'width':maskWidth,'height':maskHeight});  
	
	//애니메이션 효과 - 일단 1초동안 까맣게 됐다가 80% 불투명도로 간다.
	//$('#mask').fadeIn(1000);      
	$('#mask').fadeTo("slow",0.6);    
}
/*화면정가운데오는 이미지  */
function beforeSend() {
        var width = 0;
        var height = 0;
        var left = 0;
        var top = 0;



        width = 50;
        height = 50;
        top = ( $(window).height() - height ) / 2 + $(window).scrollTop();
        left = ( $(window).width() - width ) / 2 + $(window).scrollLeft();

        if($("#loadingImg").length != 0) {
               $("#loadingImg").css({
                      "top": top+"px",
                      "left": left+"px"
               });
               $("#loadingImg").show();
        }
        else {
               $('body').append('<div id="loadingImg" style="position:absolute; top:' + top + 'px; left:' + left + 'px; width:' + width + 'px; height:' + height + 'px; z-index:9999; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; "><img src="<c:url value='/resources/icon-img/ajax-loader.gif'/>"></div>');
        }

 }
jQuery(function($) {
	
	/* 로딩 리사이즈 */
	$(window).resize(function(){
		var left = ( $(window).width() - 50 ) / 2 + $(window).scrollLeft();
        var top = ( $(window).height() - 50 ) / 2 + $(window).scrollTop();
		var maskHeight = $(document).height();  
		var maskWidth = $(window).width(); 
		$('#mask').css({'width':maskWidth,'height':maskHeight});
		$("#loadingImg").css({
            "top": top+"px",
            "left": left+"px"
     	});
	 });

	$(document).ajaxStart(function(){
		   beforeSend();
		   wrapWindowByMask();
		})
		.ajaxStop(function(){
		   $('#loadingImg').hide();
		   $('#mask').hide();
		});
});

</script>
    
</head>
<!-- 로딩마스크 -->
<div id = "mask">

</div>


<body>

<div class="container">
<h4 class="mb-3 p-3">회원가입</h4>
   <form id="writeForm" class="form-horizontal" method="POST" action="<c:url value='/join/memberVerify'/>">
         
          
         <!-- 이름 -->
         <div class="col-md-6 mb-3">
            <label>이름</label>
               <input type="text" class="form-control" id="MEM_NAME" name="MEM_NAME" required>
               <label id="MEM_NAMEW"></label>
         </div>
         
         <!-- 아이디 -->
         <div class="col-md-6 mb-3">
            <label for="ex3">아이디</label>
               <input type="text" class="form-control" check="0" id="MEM_ID" name="MEM_ID" oninput="checkId()" required>
               <label id="MEM_IDW"></label>
         </div>

         <!-- 비밀번호 -->
         <div class="col-md-6 mb-3">
            <label for="MEM_PWD">비밀번호</label>
               <input type="password" class="form-control" id="MEM_PWD" name="MEM_PWD" required>
               <label id="MEM_PWDW"></label>
         </div>
         
         <!-- 비밀번호 확인 -->
         <div class="col-md-6 mb-3">
            <label for="pw2_check">비밀번호 확인</label>
               <input type="password" class="form-control" id="MEM_PWD2"  required>
               <label id="MEM_PWDW2"></label>
         </div>
           
         <!-- 닉네임 -->
         <div class="col-md-6 mb-3">
               <label for="MEM_NICK">닉네임</label>
                  <input type="text" class="form-control" check="0" id="MEM_NICK" name="MEM_NICK" required="required" oninput="checkNick()"/>  
                  <label id="MEM_NICKW"></label>    
           </div>
         
         <!-- 이메일 -->
		<div class="col-md-6 mb-3 input-group" >
        <input type="text" class="form-control" check="0" id="email" name="MEM_EMAIL" placeholder="이메일을 입력하세요" class="form-control" />
		<button type="button" class="btn btn-info" id="emailBtn">인증메일 발송</button>
		<label id="MEM_EMAILW"></label> 
		</div>
		<div class="col-md-6 mb-3 input-group">
		<input type="text" class="form-control" id="emailAuth" placeholder="인증번호 입력" class="form-control" />
		<button type="button" class="btn btn-info" id="emailAuthBtn">이메일 인증</button>
		</div>
		<input type="hidden" path="random" id="random" value="${random }" />
         <!-- 휴대전화 -->
         <div class="col-md-6 mb-3">
            <label for="MEM_PHONE">휴대전화 ('-' 없이 번호만 입력해주세요)</label>
            <input type="text" class="form-control"  check="0" id="MEM_PHONE" name="MEM_PHONE" required>
            <label id="MEM_PHONEW"></label>
         </div>
         
         <div class="col-md-4 mb-4 input-group">
            <input type="text" class="form-control" id="sample6_postcode" name="MEM_ADDR1" placeholder="우편번호" readonly>
			<input type="button"class="btn btn-outline-success my-2 my-sm-0" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
			<label id="MEM_ADDRW1"></label><br>
		</div>
		<div class="col-md-6 mb-6">
			<input type="text"  class="form-control" id="sample6_address" name="MEM_ADDR2" placeholder="주소"><br>
         </div>

         <div class="col-md-6 mb-6">
            <input type="reset" value="취소하기">
               
            &emsp;&emsp;
            <button id="reg_submit" onclick="submit_ck(); return false;">
               <i aria-hidden="true"></i>가입하기
            </button>
         </div>
      </form>
</div>
</body>
</html>