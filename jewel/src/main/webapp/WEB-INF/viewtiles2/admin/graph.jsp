<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<script type="text/javascript">
var str='default';
function changeDate(val){
	str=val;
}
</script>
</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<body>
<b>일자 선택</b><br>
<input type="text" id="datePicker">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" 
crossorigin="anonymous">
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>
<script type="text/javascript">
$('#datePicker').datepicker({
	format:"yyyy-mm-dd",
	language:"kr",
	todayHighlight:true,
	autoclose: true
	
}).on('change',function(){
	
	changeDate($('#datePicker').val());
	$.ajax({
	      type : "POST",
	      url : '<c:url value="/item/getItemList"/>',
	      data : {pg: "${pg}",type:"${type}",sort:"${sort}"},
	      success : function(data){
	         
	         $.each(data.list,function(index,items){
	                
	            
	         })
	         
	      }
	      
	   });         	
});

</script>

<canvas id="myChart" style="max-width: 600px;"></canvas>



<script>
var chartlabels=[];
var chartDate=[];
var ctx = document.getElementById('myChart');


var myChart = new Chart.Line(ctx, {
	
	data: {
		labels: ['월','화','수','목','금','토','일'],
		datasets: [{		
			label: '매출', 
			data: [12, 19, 3, 5, 2, 3,0],
			borderColor: "rgba(54,162,235,1)",
            backgroundColor: "rgba(54,162,235,0.5)",
            fill: true,
			lineTension: 0,
			
		}]
		
	},
	options:{
		title:{
			display:true,
			text:'일별 매출별 현황'
		},
		scales:{
			yAxes:[{
				ticks:{
					beginAtZero:true
				}
			}]
		}
	}
	});


</script>

</body>
</html>