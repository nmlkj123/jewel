<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
   <title>상품정보</title>
</head>
<style type="text/css">

dl.MS_mark {
    width: 350px;
}
dl.MS_mark dt.MS_mark_title {
    width: 50px;
    float: left;
    text-align: left;
}
dl.MS_mark dd.MS_mark_icon {
    width: 300px;
    float: left;
    text-align: left;
}

textarea.MS_review_content_box {
width: 400px;
height: 35px;
}

#comment_password {
    position: absolute;
    display: none;
    width: 300px;
    border: 2px solid #757575;
    padding: 7px;
    background: #FFF;
    z-index: 6;
}

div.MS_btn_scrap_tw {
color: #666666;
width: 170px;
border: 1px solid #908E8F;
padding: 10px 8px 8px;
position: absolute;
font-size: 8pt;
margin-top: 10px;
letter-spacing: -1px;
background-color: white;
font-family: dotum;
}

div.MS_btn_scrap_fb {
color: #666666;
width: 170px;
border: 1px solid #908E8F;
padding: 10px 8px 8px;
position: absolute;
font-size: 8pt;
margin-top: 10px;
letter-spacing: -1px;
background-color: white;
font-family: dotum;
}

</style>
<body>

<form>
   <div>
   <div>
      <img src="file:///C:/Users/학생용/Documents/workspace-sts-3.9.12.RELEASE/asdasd/WebContent/img/R_BF_001.jpg" width="300" height="210"/>
   </div>
   <input type="button" value="이전상품">
   <input type="button" value="다음상품">
      <table>
      
         <tr>
            <td colspan="2">꽃길 반지</td>
         </tr>
         
         <tr>
            <td>판매가</td>
            <td>289,300</td>
         </tr>
         
         <tr>
            <td>할인가</td>
            <td>260,400</td>
         </tr>
         
         <tr>
            <td>종료일</td>
            <td>6월11일</td>
         </tr>
         
         <tr>
            <td>적립급</td>
            <td>2%</td>
         </tr>
         
         <tr>
            <td>제품선택</td>
            <td>
            <select>
               <option value="option choice">옵션선택</option>
               <option value="14K">14K</option>
                <option value="18K">18K</option>
             </select>
             </td>
         </tr>

         <tr>
            <td>색상선택</td>
            <td>
            <select>
               <option value="option choice">옵션선택</option>
               <option value="yellow">옐로우골드</option>
                <option value="pink">핑크골드</option>
             </select>
            </td>
         </tr>
         
         <tr>
            <td>이니셜각인</td>
            <td>
            <select>
               <option value="option choice">옵션선택</option>
               <option value="no">각인안함</option>
                <option value="yes">각인함</option>
             </select>
             </td>
         </tr>
         
         <tr>
            <td>이니셜글씨체</td>
            <td>
            <select>
               <option value="option choice">옵션선택</option>
               <option value="cooper">쿠퍼</option>
                <option value="mint">민트</option>
                <option value="gyungsu">궁서</option>
                <option value="sudang">서당</option>
             </select>
             </td>
         </tr>
         
         <tr>
            <td>이니셜내용</td>
            <td>
            <select>
               <option value="option choice">옵션선택</option>
               <option value="content">주문메시지란에 적어주세요.</option>
             </select>
             </td>
         </tr>
         
         <tr>
            <td>선물포장</td>
            <td>
            <select>
               <option value="option choice">옵션선택</option>
               <option value="A">기본포장-A</option>
                <option value="B">쇼핑백-B</option>
             </select>
             </td>
         </tr>
         
         <tr>
            <td colspan="2" align="left" style="border: solid gray 1px;">총 상품 금액 0원</td>
         </tr>
      </table>
      <input type="button" value="찜하기">
      <input type="button" value="장바구니 담기">
      <input type="button" value="바로구매">
   </div>
</form>

</body>
</html>