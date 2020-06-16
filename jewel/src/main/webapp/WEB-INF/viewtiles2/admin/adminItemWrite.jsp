<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
<style type="text/css">

 </style>
</head>

<script type="text/javascript">
function fsubmit(){
	
	 var form = $('#frm')[0];
	 var formData = new FormData(form);
	var inum=$('#ITEM_NUM').val();
	
	/* $('#opt > tbody tr').length */
	var ITEM_NUM=document.getElementById("ITEM_NUM").value;
	var ITEM_TYPE = document.getElementById("ITEM_TYPE").value;
	var ITEM_NAME = document.getElementById("ITEM_NAME").value;
	var ITEM_PRICE = document.getElementById("ITEM_PRICE").value;
	var ITEM_DCP = document.getElementById("ITEM_DCP").value;
	var ITEM_IMAGE1 = document.getElementById("ITEM_IMAGE1").value;
	
	var ITEM_STOCK = document.getElementById("ITEM_STOCK").value;
	
	if(ITEM_NUM==null || ITEM_NUM==''){
		alert("아이템 번호를 입력하세요.");
		return false;
	}
	if(ITEM_TYPE==null || ITEM_TYPE==''){
		alert("카테고리 종류를 입력하세요.");
		return false;
	}
	if(ITEM_NAME==null || ITEM_NAME==''){
		alert("상품 이름을 입력하세요.");
		return false;
	}
	if(ITEM_PRICE==null || ITEM_PRICE==''){
		alert("상품 가격을 입력하세요.");
		return false;
	}
	if(ITEM_DCP==null || ITEM_DCP==''){
		alert("할인율을 입력하세요.");
		return false;
	}
	if(ITEM_IMAGE1==null || ITEM_IMAGE1==''){
		alert("사진1 을 입력하세요.");
		return false;
	}
	
	if(ITEM_STOCK ==null || ITEM_STOCK ==''){
		alert("재고를 입력하세요.");
		return false;
	}
	$.ajax({
	      type : "POST",
	      enctype: 'multipart/form-data',
	      url : '<c:url value="/adminItemWrite"/>',
	      data:formData,
	      processData: false,
         contentType: false,
         async: false,
	      success : function(data){
	    
	      }
	      });
	var count=$('#opt >tbody tr').length
	
	for(var i=0;i<count;i++){
		var OP_TYPE=$('#opt >tbody tr').eq(i).find('#OP_TYPE').val();
		var OP_VALUE=$('#opt >tbody tr').eq(i).find('#OP_VALUE').val();
		var	OP_PRICE=$('#opt >tbody tr').eq(i).find('#OP_PRICE').val();
		
		$.ajax({
		      type : "POST",
		      url : '<c:url value="/insertOption"/>',
		      data : {ITEM_NUM:inum,OP_TYPE:OP_TYPE,OP_VALUE:OP_VALUE,OP_PRICE:OP_PRICE}, 
		      success : function(data){
		    	 
		    	  
		      }
		      })
	}

	alert("등록 완료");
	location.href = "/common/adminItemList";
}

$(document).ready(function(){
	$('#summernote').summernote({
	    height: 300,
	    minHeight: null,
	    maxHeight: null,
	    focus: true,
	    callbacks: {
	      onImageUpload: function(files, editor, welEditable) {
	        for (var i = files.length - 1; i >= 0; i--) {
	          sendFile(files[i], this);
	        }
	      }
	    }
	  });

	$('#ITEM_TYPE').change(function(){
		$.ajax({
		      type : "POST",
		      url : '<c:url value="/selectItemNum"/>',
		      data : "ITEM_TYPE="+$('#ITEM_TYPE').val(), 
		      success : function(data){
		    	  var a=data.ITEM_NUM;
		    	  $('#ITEM_NUM').val(a);
		    	  
		      }
		      })
		
	});

	$('#add_opt').on("click",function(){
		
	 	
		var str = '<tr>	<td><input type="text" id="OP_TYPE" name="OP_TYPE"></td><td>	<input type="text" id="OP_VALUE" name="OP_VALUE"> </td><td>	<input type="text" id="OP_PRICE" name="OP_PRICE"><a href="#" class="btn" id="delete" name="delete">삭제</a></td></tr>';
		 $("#opt > tbody:last").append(str); 
		

	});

	$(document).on("click",'.btn', function(e){
		 
		 e.preventDefault();
		$(this).parent().parent('tr').remove(); 

		});  


	
	
	
	



});
function sendFile(file, el) {
	  var form_data = new FormData();
	  form_data.append('file', file);
	  $.ajax({
	    data: form_data,
	    type: "POST",
	    url: "<c:url value='/adminContentImage'/>",
	    cache: false,
	    contentType: false,
	    enctype: 'multipart/form-data',
	    processData: false,
	    success: function(url) {
	    	url=url.trim();
	    	
	      $(el).summernote('editor.insertImage', "<c:url value='/images/item/"+url+"'/>");
	     
	     
	    }
	  });


	}



</script>


<body>
<div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">상품 등록</h3>
              </div>
	<form class="form-horizontal" id="frm" name="frm"  action="<c:url value='/adminItemWrite'/>" method="post" enctype="multipart/form-data">
		<div class="card-body">
		<div class="form-group  row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">카테고리 종류</label>
                    <div class="col-sm-10">
                      <select class="form-control" id="ITEM_TYPE" name="ITEM_TYPE">
						<option value="N">N</option>
						<option value="R">R</option>
						<option value="E">E</option>
						<option value="W">W</option>
						<option value="C">C</option>
					
					</select>
                    </div>
        </div>
		<div class="form-group row">
                    <label for="ITEM_NUM" class="col-sm-2 col-form-label">아이템 번호(자동)</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="ITEM_NUM" name="ITEM_NUM" readonly placeholder="카테고리를 선택하세요">
                    </div>
        </div>
        <div class="form-group row">
                    <label for="ITEM_NAME" class="col-sm-2 col-form-label">이름</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="ITEM_NAME" name="ITEM_NAME"  placeholder="이름">
                    </div>
        </div>
        <div class="form-group row">
                    <label for="ITEM_PRICE" class="col-sm-2 col-form-label">가격</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="ITEM_PRICE" name="ITEM_PRICE"  placeholder="가격">
                    </div>
        </div>	 	 
		<div class="form-group row">
                    <label for="ITEM_DCP" class="col-sm-2 col-form-label">할인율</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="ITEM_DCP" name="ITEM_DCP"  placeholder="할인율">
                    </div>
        </div>
        <div class="form-group row">
                    <label for="ITEM_STOCK" class="col-sm-2 col-form-label">재고</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control"  id="ITEM_STOCK" name="ITEM_STOCK"  placeholder="재고">
                    </div>
        </div>
         <div class="form-group row">
                    <label for="ITEM_IMAGE1" class="col-sm-2 col-form-label">사진1</label>
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" id="ITEM_IMAGE1" name="ITEM_IMAGE1">
                        <label class="custom-file-label" for="ITEM_IMAGE1">Choose file</label>
                      </div>
                      
                    </div>
         </div>
         
         
         			
		<div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">사진 2</label>
                    <textarea class="form-control" rows="10" id="summernote" name="ITEM_IMAGE2"></textarea>
                    
                    
                  </div>
        	
				
		
		</div>	
		</form>
		</div>
		
	
		
		<table id="opt" style="width:95%;">
		<thead>
		<tr>
		<th>옵션 종류</th>
		<th>옵션 값</th>
		<th>옵션 가격</th>
		</tr>
		</thead>
		<tbody>
		<tr>
		<td>
				<input type="text"  id="OP_TYPE" name="OP_TYPE">
		</td>
		<td>
				<input type="text"  id="OP_VALUE" name="OP_VALUE">
		</td>
		<td>
				<input type="text"  id="OP_PRICE" name="OP_PRICE">
		</td>
		
		</tr>
		</tbody>
		</table>
		
		
		<br/>
		<br/>
	<div class="btn-group">
	<input type="button" class="btn btn-success" onclick="location.href='<c:url value="/adminItemList"/>'" value="목록으로">
	<button type="button" class="btn btn-warning" id="add_opt">옵션 추가</button>
	<button type="button" class="btn btn-primary" onclick="fsubmit();">상품 등록</button>
	</div>
	
	
		
			<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- include summernote css/js-->
    
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>	
		
		
		
		
	

		 
	
	
	
	


	
</body>
</html>