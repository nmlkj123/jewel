
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
	$('#email').keyup(function(){
		if($(this).val().length==0){
			$('#MEM_EMAILW').text(" 이메일 입력");
			$('#MEM_EMAILW').css("color","red");
			$('#MEM_EMAILW').css("font-size","9pt");
			$('#MEM_EMAILW').css("font-weight","bold");		
		}else		
			$('#MEM_EMAILW').text("");		
			
	
	});
	$('#sample6_postcode,#sample6_address').keyup(function(){
		if($(this).val().length==0){
			$('#MEM_ADDRW1').text(" 주소 입력");
			$('#MEM_ADDRW1').css("color","red");
			$('#MEM_ADDRW1').css("font-size","9pt");
			$('#MEM_ADDRW1').css("font-weight","bold");		
		}else		
			$('#MEM_ADDRW1').text("");		
			
	
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
		}else{	
			$('#MEM_PHONEW').text("");		
			$('#MEM_PHONE').attr("check", "1");
		}	
		if($(this).val().length>0){
			if(!($(this).val().match(/^[0-9]*$/))){
				$('#MEM_PHONE').attr("check", "0");
				$('#MEM_PHONEW').text(" 숫자만 입력");
				$('#MEM_PHONEW').css("color","red");
				$('#MEM_PHONEW').css("font-size","9pt");
				$('#MEM_PHONEW').css("font-weight","bold");	
			}
		}
	});
	
	
});


function submit_ck(){
	if($('#MEM_NAME').val().length==0){
		$('#MEM_NAMEW').text(" 이름 입력");
		$('#MEM_NAMEW').css("color","red");
		$('#MEM_NAMEW').css("font-size","9pt");
		$('#MEM_NAMEW').css("font-weight","bold");
		$('#MEM_NAME').focus();
	}else if($('#MEM_ID').val().length==0){
		$('#MEM_IDW').text(" 아이디 입력");
		$('#MEM_IDW').css("color","red");
		$('#MEM_IDW').css("font-size","9pt");
		$('#MEM_IDW').css("font-weight","bold");;
		$('#MEM_ID').focus();
	}else if($('#MEM_PWD').val().length==0){
		$('#MEM_PWDW').text(" 비밀번호 입력");
		$('#MEM_PWDW').css("color","red");
		$('#MEM_PWDW').css("font-size","9pt");
		$('#MEM_PWDW').css("font-weight","bold");;
		$('#MEM_PWD').focus();
	}else if($('#MEM_PWD2').val().length==0){
		$('#MEM_PWDW2').text(" 비밀번호확인 입력");
		$('#MEM_PWDW2').css("color","red");
		$('#MEM_PWDW2').css("font-size","9pt");
		$('#MEM_PWDW2').css("font-weight","bold");;
		$('#MEM_PWD2').focus();
	}else if($('#MEM_NICK').val().length==0){
		$('#MEM_NICKW').text(" 닉네임 입력");
		$('#MEM_NICKW').css("color","red");
		$('#MEM_NICKW').css("font-size","9pt");
		$('#MEM_NICKW').css("font-weight","bold");;
		$('#MEM_NICK').focus();
	}else if($('#email').val().length==0){
		$('#MEM_EMAILW').text(" 이메일 입력");
		$('#MEM_EMAILW').css("color","red");
		$('#MEM_EMAILW').css("font-size","9pt");
		$('#MEM_EMAILW').css("font-weight","bold");;
		$('#email').focus();
	}else if($('#MEM_PHONE').val().length==0){
		$('#MEM_PHONEW').text(" 번호 입력");
		$('#MEM_PHONEW').css("color","red");
		$('#MEM_PHONEW').css("font-size","9pt");
		$('#MEM_PHONEW').css("font-weight","bold");;
		$('#MEM_PHONE').focus();
	}else if($('#sample6_postcode').val().length==0 ||$('#sample6_address').val().length==0 ){
		$('#MEM_ADDRW1').text(" 주소 입력");
		$('#MEM_ADDRW1').css("color","red");
		$('#MEM_ADDRW1').css("font-size","9pt");
		$('#MEM_ADDRW1').css("font-weight","bold");;
		$('#MEM_ADDR1').focus();
	}else if($('#MEM_PWD2').val()!=$('#MEM_PWD').val()){
		$('#MEM_PWDW2').focus();
	}else if($('#MEM_ID').attr("check")=="0"){
		$('#MEM_ID').focus();
	}else if($('#MEM_NICK').attr("check")=="0"){
		$('#MEM_NICK').focus();
	}else if($('#email').attr("check")=="0"){
		$('#email').focus();
	}else if($('#MEM_PHONE').attr("check")=="0"){
		$('#MEM_PHONE').focus();
	}else{
		$('#writeForm').submit();
		alert("가입완료!");
	}
	
}