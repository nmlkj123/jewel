<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%@ include file="/WEB-INF/viewtiles2/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script type="text/javascript"src="<c:url value="/resources/js/orderPost.js"/>" ></script>

<script type="text/javascript">
var memId="${MEM_ID}";
if(memId==""){
	var memPWD="${OR_PWD}";
	if(memPWD==""){
		location.href="<c:url value='/item/pwdOrder'/>";
	}
	
}

	

var totalPrice=0;
var totalPoint=0;
var memberPoint=0;
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
$(document).ready(function(){
	
	$.ajax({
		type : "POST",
		url : "<c:url value='/item/getOrderList'/>",
		success : function(data){
				
			if(data.member!=null){
				$("input[name='MEM_NUM']").val(data.member.MEM_NUM);
				$("input[name='OR_NAME']").val(data.member.MEM_NAME);
				$("input[name='OR_PHONE']").val(data.member.MEM_PHONE);
				$("input[name='OR_ADDR1']").val(data.member.MEM_ADDR1);
				$("input[name='OR_ADDR2']").val(data.member.MEM_ADDR2);
				$("input[name='OR_USEP']").val("0");
				$("#USER_POINT").text(data.member.MEM_POINT);
				memberPoint=data.member.MEM_POINT;
			}else{
				$("input[name='OR_USEP']").attr('readonly',true);
				$("input[name='OR_USEP']").val("0");
				$("#USER_POINT").text("0");
			}
			
			var str="";
			$.each(data.list,function(index,items){
				
				totalPrice+=parseInt(items.CART_CNT*items.ITEM_OP_PRICE);
				totalPoint+=parseInt(items.CART_CNT*items.ITEM_OP_PRICE)*0.02;
				str+="<tr class='tr-line'>"+
					"<td class='text-center'>"+
						"<div class='item-img'>"+
							"<img src='<c:url value='/images/item/"+items.ITEM_IMAGE1+"'/>' width='70' height='70' alt=''>"+
						"</div>"+
					"</td>"+
					"<td>"+
					"<form id='items"+index+"'>"+
					"<input type='hidden' name='ITEM_NUM' value='"+items.ITEM_NUM+"'>"+
					"<input type='hidden' name='OR_CNT' value='"+items.CART_CNT+"'>"+
					"<input type='hidden' name='OR_OP' value='"+items.OP_VALUE+"'>"+
					"<input type='hidden' name='OR_OGP' value='"+items.ITEM_PRICE+"'>"+
					"<input type='hidden' name='OR_FP' value='"+parseInt(items.CART_CNT*items.ITEM_OP_PRICE)+"'>"+
					"<input type='hidden' name='OR_DCM' value='"+items.ITEM_FP+"'>"+
					"<input type='hidden' name='PLUS_POINT' value='"+parseInt(items.CART_CNT*items.ITEM_OP_PRICE)*0.02+"'>"+
					"</form>"+
						"<b>"+items.ITEM_NAME+"</b>"+
						"<div class='well well-sm'>"+
							"<ul style='line-height: 20px;'>"+
								"<li>"+items.OP_VALUE+"</li>"+
							"</ul>"+
						"</div></td>"+
					"<td class='text-center'>"+items.CART_CNT+"</td>"+
					"<td class='text-right'>"+numberWithCommas(items.ITEM_OP_PRICE)+"</td>"+
					"<td class='text-center'></td>"+
					"<td class='text-right'><b>"+numberWithCommas(parseInt(items.CART_CNT*items.ITEM_OP_PRICE))+"</b></td>"+
					"<td class='text-right'>"+numberWithCommas(parseInt(items.CART_CNT*items.ITEM_OP_PRICE)*0.02)+"</td>"+
					"<td class='text-center'>선불</td>"+
				"</tr>";
				
				
			})
			
			$("#sod_list tbody").append(str);
			$("#ct_tot_price").text(numberWithCommas(totalPrice)+" 원");
			$("#ct_tot_price2").text(numberWithCommas(totalPrice));
			$("#to_point").text(numberWithCommas(totalPoint)+" 점")
			

		}
	});

	$("input[name='OR_USEP']").keyup(function(){
		var num=$(this).val();
		if(totalPrice<num){
			$(this).val(totalPrice);
			$("#ct_tot_price2").text("0");
			return true;
		}
		if(jQuery.isNumeric(num)==true){
			if(memberPoint<num || memberPoint<0 ){
				$(this).val("0");
				$("#ct_tot_price2").text(totalPrice-0);	
				return true;
			}
			$("#ct_tot_price2").text(totalPrice-num);
		}else{
			$(this).val("0");
			$("#ct_tot_price2").text(totalPrice-0);
			
		}
		
		
	});
});

function card(){
	var IMP = window.IMP; // 생략가능
	IMP.init('imp52095000'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : 100,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456',
	    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	}, function(rsp) {
	    if ( rsp.success ) {
	       /*  var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num; */

	    	var sdd=(rsp.imp_uid).split('_');
			$("input[name='OR_NUM']").val(sdd[1]);
			orderSucess();
			alert("결제성공!");
			goPost(sdd[1]);
	    } else {
		    
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    
	});

	
}
function orderSucess(){
	var items=$("form[id^='items']").get();
	$.each(items,function(index,item){
		var formOrder=$("#items"+index+",#orderForm").serialize();
		$.ajax({
			type : "POST",
			url : "<c:url value='/item/payment'/>",
			data : formOrder,
			async: false,
			success : function(data){
				
				
			}
		});
	})
	var formOrder=$("#orderForm").serialize();
	$.ajax({
		type : "POST",
		url : "<c:url value='/item/delPoint'/>",
		data : formOrder,
		async: false,
		success : function(data){
			
			
		}
	});
	
}
function orderf(){
	
	if($("input[name='OR_NAME']").val().length==0  ){
		alert("이름입력");
		$("input[name='OR_NAME']").focus();
		return;
	}
	if($("input[name='OR_PHONE']").val().length==0  ){
		alert("전화번호입력");
		$("input[name='OR_PHONE']").focus();
		return;
	}
	if($("input[name='OR_ADDR1']").val().length==0  ){
		alert("주소입력");
		$("input[name='OR_ADDR1']").focus();
		return;
	}
	if($("input[name='OR_ADDR2']").val().length==0  ){
		alert("주소입력");
		$("input[name='OR_ADDR2']").focus();
		return;
	}
	if($("input:radio[name='OR_HOW']").is(":checked")==false){
		alert("결제수단 체크");
		$("input:radio[name='OR_HOW']").focus();
		return;
	}

	card();
		
}

function goPost(sdd) {
var obj1 = sdd;

var form = document.createElement("form");

form.setAttribute("charset", "UTF-8");

form.setAttribute("method", "Post"); // Get 또는 Post 입력

form.setAttribute("action", "<c:url value='/item/orderSuccess'/>");

var hiddenField = document.createElement("input");

hiddenField.setAttribute("type", "hidden");

hiddenField.setAttribute("name", "OR_NUM");

hiddenField.setAttribute("value", obj1);

form.appendChild(hiddenField);

/* var url ="target.jsp"

var title = "testpop"

var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=1240, height=1200, top=0,left=20"

window.open("", title,status); //팝업 창으로 띄우기. 원치 않으면 주석.
 */
 
document.body.appendChild(form);

 
 
form.submit();

}

</script>
</head>
<body>
<div class="container">

		<div class="card-header">
			<i class="fa fa-shopping-cart fa-lg"></i> 주문하실 상품을 확인해 주세요.
		</div>

		<div class="table-responsive order-item">
			<table id="sod_list"  class="div-table table bg-white bsk-tbl">
				<tbody >
					<tr class="tr-head border-black">
						<th scope="col"><span>이미지</span></th>
						<th scope="col"><span>상품명</span></th>
						<th scope="col"><span>총수량</span></th>
						<th scope="col"><span>판매가</span></th>
						<th scope="col"><span>쿠폰</span></th>
						<th scope="col"><span>소계</span></th>
						<th scope="col"><span>포인트</span></th>
						<th scope="col"><span class="last">배송비</span></th>
					</tr>
					
					
				</tbody>
			</table>
		</div>


		<!-- 주문상품 합계 시작 { -->
		<div class="card card-body bg-light">
			<div class="row ">
				
				<div class="col-sm-6">배송비</div>
				<div class="col-sm-6 text-right">
					<strong>0 원</strong>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-6 red">
					<b>주문금액</b>
				</div>
				<div class="col-sm-6 text-right red">
					<strong style="color: red;" id="ct_tot_price"></strong>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-6">포인트</div>
				<div class="col-sm-6 text-right">
					<strong id="to_point"></strong>
				</div>
			</div>
		</div>
		

		<!-- 받으시는 분 입력 시작 { -->
		<form id="orderForm">
		<input type="hidden" name="MEM_NUM" >
		<input type="hidden" name="OR_NUM" >
		<input type="hidden" name="OR_PWD" value="${OR_PWD}">
		<section id="sod_frm_taker">
			<div class="card panel-default">
				<div class="card-header">
					<strong><i class="fa fa-truck fa-lg"></i> 받으시는 분</strong>
				</div>
				<div class="card-body">

					<div class="form-group">
						<label class="col-sm-2 control-label"><b>배송지선택</b></label>
						<div class="col-sm-10 radio-line">
							<label> <input type="checkbox" name="ad_sel_addr"
								value="same" id="ad_sel_addr_same"> 주문자와 동일
							</label>
						</div>
					</div>

					<div class=" has-feedback">
						<label class="col-sm-2 control-label" for="od_b_name"><b>이름</b></label>
						<div class="input-group col-sm-3 ">
							<input type="text" name="OR_NAME" id="od_b_name" required
								class="form-control input-sm" maxlength="20">
 							<div class="input-group-append">
							<span class="fa fa-check fa-lg mt-2 ml-1 form-control-feedback"></span>
							</div>
						</div>
					</div>
					<div class="form-group has-feedback">
						<label class="col-sm-2 control-label" for="od_b_tel"><b>핸드폰</b></label>
						<div class="input-group col-sm-3">
							<input type="text" name="OR_PHONE" id="od_b_tel" required
								class="form-control input-control-sm" maxlength="20">
								<div class="input-group-append">
								 <span class="fa fa-phone fa-lg mt-2 ml-1 form-control-feedback"></span>
								</div>
						</div>
					</div>

					<div class="form-group has-feedback">
						<label class="col-sm-3 control-label"><b>주소</b></label>
						<div class="col-sm-8">
							<label for="od_b_zip" class="sound_only">우편번호</label> <label> <input
								type="text" name="OR_ADDR1" id="sample6_postcode" required
								class="form-control input-sm" size="6" maxlength="6" readonly >
							</label> <label>
								<button type="button" class="btn btn-dark btn-sm"
									style="margin-top: 0px;"
									onclick="sample6_execDaumPostcode()">주소
									검색</button>
							</label>

							<div class="addr-line">
								<label class="sound_only" for="od_b_addr2">상세주소</label> <input
									type="text" name="OR_ADDR2" id="sample6_address"
									class="form-control input-control-sm" size="50" placeholder="상세주소">
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label" for="od_memo"><b>배송요청사항</b></label>
						<div class="col-sm-8">
							<textarea name="OR_RE" rows=3 id="od_memo"
								class="form-control input-sm"></textarea>
						</div>
					</div>

				</div>
			</div>
		</section>

		<!-- } 받으시는 분 입력 끝 -->

		<div class="card-header " id="sod_frm_pt_alert">
			<i class="fa fa-bell fa-lg"></i> <strong>무통장입금</strong> 이외의 결제 수단으로
			결제하시는 경우 포인트를 적립해드리지 않습니다.
			
		</div>
		
		<section id="sod_frm_pay" class="order-payment">
	<div class="card card-default">
		<div class="card-header"><strong><i class="fa fa-check fa-lg"></i> 결제정보</strong></div>
		<div class="card-body">
									<div class="form-group">
				<label class="col-sm-2 control-label"><b>총주문금액</b></label>
				<label class="col-sm-2 control-label">
					<b><span style="color: red;" id="ct_tot_price2"></span></b>원
				</label>
			</div>
			<div class="form-group input-group ">
				<label class="col-sm-2 control-label"><b>포인트사용</b></label>
				
				<div class="input-group  col-sm-2">
					<input class=" form-control input-sm p-0" type="text" name="OR_USEP" > 원 
				</div>
				
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"><b>사용가능포인트</b></label>
				<label class="col-sm-2 control-label">
					<span id="USER_POINT"></span>원
				</label>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"><b>추가배송비</b></label>
				<label class="col-sm-2 control-label">
					<span id="od_send_cost2">0</span>원
				</label>
				<div class="col-sm-7">
					<label class="control-label text-muted font-12">지역에 따라 추가되는 도선료 등의 배송비입니다.</label>
				</div>
			</div>

							<div class="form-group">
					<label class="col-sm-2 control-label"><b>결제방법</b></label>
					<div class="col-sm-10 radio-line">
						<label><input type="radio" id="OR_HOW" name="OR_HOW" value="신용카드"> 신용카드</label>							
						
					</div>
				</div>

				
					</div>
				</div>
			</section>
			</form>
			<div id="display_pay_button" class="text-center btn_confirm">
			    <input type="button" value="주문하기" onclick="orderf();" class=" btn btn-dark">
			     <input type="button" value="취소" onclick="forderform_check(this.form);" class=" btn btn-primary">

			</div>
			
</div>
</body>
</html>