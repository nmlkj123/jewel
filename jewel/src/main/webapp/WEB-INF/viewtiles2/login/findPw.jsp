<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css"/>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
$( document ).ready(function() {
	/*
	이메일 인증 버튼 클릭시 발생하는 이벤트
	*/
	$("#emailSend").on("click", function(){
		var email = $("#email1").val()+"@"+$("#email2").val();
		$("#MEM_EMAIL").val(email);
	/* 이메일 중복 체크 후 메일 발송 비동기 처리 */

		$.ajax({
			type:"GET",
			url : "<c:url value='/login/findPwConfirm'/>",
			data : "MEM_ID=" + $("#MEM_ID").val() + "&MEM_EMAIL=" +$("#MEM_EMAIL").val(),
			success : function(data){
					if(data){
						alert("입력하신 메일로 임시비밀번호를 전송 했습니다.");
					}else{
						alert("실패: 아이디와 이메일을 확인 해주세요!.");
					}
				
			},
			error: function(data){
				alert("에러가 발생했습니다.");
				return false;
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

<script type="text/javascript">
$(document).ready(function(){
		$("#email").change(function(){
			$("#email2").val($(this).val());
		});
	});

/* 
다음
취소
닫기
 */
</script>
</head>
<!-- 로딩마스크 -->
<div id = "mask">

</div>
<body>

<div class="container findpw" style="display: block">
<form class="mb-3" action="<c:url value='/login/findPwConfirm'/>" method="post" id="frm">
	<h1 class="mb-5">비밀번호 찾기</h1>
	<input type="text" id="MEM_ID" name="MEM_ID" placeholder="아이디"><br>
	<input type="hidden" id="MEM_EMAIL" name="MEM_EMAIL">
	<input type="text" id="email1"  placeholder="이메일">
	@
	<input type="text" id="email2"  value="">
	<select id="email">
	<option>직접입력</option>
	<option>naver.com</option>
	<option>hanmail.net</option>
	<option>gmail.com</option>
	<option>nate.com</option>
	</select>
	<br>
</form>
	<a href="#" class="btn" id="emailSend">찾기</a>
	<a href="#" class="btn" onclick="close();">취소</a>
</div>

</body>
</html>