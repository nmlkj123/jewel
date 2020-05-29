
$(document).ready(function(){
	$('#MEM_NAME').keyup(function(){
		if($(this).val().length==0){
			$('#MEM_NAMEW').text(" 이름 입력");
			$('#MEM_NAMEW').css("color","red");
			$('#MEM_NAMEW').css("font-size","9pt");
			$('#MEM_NAMEW').css("font-weight","bold");		
		}else		
			$('#MEM_NAMEW').text("");		
			
	
	});
	$('#MEM_ID').keyup(function(){
		if($(this).val().length==0){
			$('#MEM_IDW').text(" 아이디 입력");
			$('#MEM_IDW').css("color","red");
			$('#MEM_IDW').css("font-size","9pt");
			$('#MEM_IDW').css("font-weight","bold");		
		}		
			
	
	});
	$('#MEM_PWD').keyup(function(){
		if($(this).val().length==0){
			$('#MEM_PWDW').text(" 비밀번호 입력");
			$('#MEM_PWDW').css("color","red");
			$('#MEM_PWDW').css("font-size","9pt");
			$('#MEM_PWDW').css("font-weight","bold");		
		}else		
			$('#MEM_PWDW').text("");
		if($('#MEM_PWD2').val().length>0){
			 if($(this).val()!=$('#MEM_PWD2').val()){
				 $('#MEM_PWDW2').text(" 비밀번호가 틀립니다");
				 $('#MEM_PWDW2').css("color","red");
				 $('#MEM_PWDW2').css("font-size","9pt");
				 $('#MEM_PWDW2').css("font-weight","bold");
			 }else{
				 $('#MEM_PWDW2').text("");
			 }
		}
	});
	$('#MEM_PWD2').keyup(function(){
		if($('#MEM_PWD').val()==""&&$(this).val().length>0){
			$('#MEM_PWDW2').text(" 비밀번호를 입력해주세요");
			$('#MEM_PWDW2').css("color","red");
			$('#MEM_PWDW2').css("font-size","9pt");
			$('#MEM_PWDW2').css("font-weight","bold");
		}else if($(this).val()!=$('#MEM_PWD').val()){
			$('#MEM_PWDW2').text(" 비밀번호가 틀립니다");
			$('#MEM_PWDW2').css("color","red");
			$('#MEM_PWDW2').css("font-size","9pt");
			$('#MEM_PWDW2').css("font-weight","bold");		
		}else		
			$('#MEM_PWDW2').text("");
	
	});
	
	$('#MEM_PHONE').keyup(function(){
		if($(this).val().length==0){
			$('#MEM_PHONEW').text(" 번호 입력");
			$('#MEM_PHONEW').css("color","red");
			$('#MEM_PHONEW').css("font-size","9pt");
			$('#MEM_PHONEW').css("font-weight","bold");		
		}else		
			$('#MEM_PHONEW').text("");		
			
		if($(this).val().length>0){
			if(!($(this).val().match(/^\d+/))){
				$('#MEM_PHONEW').text(" 숫자만 입력");
				$('#MEM_PHONEW').css("color","red");
				$('#MEM_PHONEW').css("font-size","9pt");
				$('#MEM_PHONEW').css("font-weight","bold");	
			}
		}
	});
	
	
});

function checkId(){
	var id = $('#MEM_ID').val();
    $.ajax({
        url:"<c:url value='/join/checkId'/>",
        type:'post',
        data:{id:id},
        success:function(data){
        	$('#MEM_IDW').text(" 사용중인 아이디");
			$('#MEM_IDW').css("color","red");
			$('#MEM_IDW').css("font-size","9pt");
			$('#MEM_IDW').css("font-weight","bold");
        },
        error:function(){
        	$('#MEM_IDW').text(" 사용가능");
			$('#MEM_IDW').css("color","green");
			$('#MEM_IDW').css("font-size","9pt");
			$('#MEM_IDW').css("font-weight","bold");
        }
    });
}
function checkNick(){
	var nick = $('#MEM_NICK').val();
    $.ajax({
        url:"<c:url value='/join/checkNick'/>",
        type:'post',
        data:{nick:nick},
        success:function(data){
        	$('#MEM_NICKW').text(" 사용중인 닉네임");
			$('#MEM_NICKW').css("color","red");
			$('#MEM_NICKW').css("font-size","9pt");
			$('#MEM_NICKW').css("font-weight","bold");
        },
        error:function(){
        	$('#MEM_NICKW').text(" 사용가능");
			$('#MEM_NICKW').css("color","green");
			$('#MEM_NICKW').css("font-size","9pt");
			$('#MEM_NICKW').css("font-weight","bold");
        }
    });
}