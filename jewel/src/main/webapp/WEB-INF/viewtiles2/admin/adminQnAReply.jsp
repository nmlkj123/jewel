<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


</head>
<body>
    <h2>QnA 상세</h2>
    <form id="frm" name="frm" action="<c:url value='/adminQnAReply'/>" method="post">
    <input type="hidden" name="QNA_NUM" value="${map.QNA_NUM}">
    <table class="board_list">
    
       <tbody>
        
            <tr>
                <th scope="col">QnA번호</th>
                <td>${map.QNA_NUM}</td>
                <th scope="col">질문카테고리</th>
                <td> ${map.QNA_CATE}</td>
            </tr>
            <tr>
            	<c:choose>
                	<c:when test="${map.MEM_ID==null}">
                		<th scope="col">질문자 이름</th>
                     	<td>${map.QNA_NAME}</td>
                	</c:when>
                	<c:otherwise>
                	<th scope="col">회원ID</th>
                	<td>${map.MEM_ID }</td>
                </c:otherwise>
                </c:choose>
                
                <th scope="col">질문날짜</th>
                <td>${map.QNA_DATE}</td>
             </tr>
             <tr>
             	 <th scope="col">질문제목</th>
             	 <td>${map.QNA_TITLE}</td>
             </tr>   
             <tr>
             	<th scope="col">질문내용</th>
             	<td>${map.QNA_CONTENT}</td>
             </tr>   
             
             <tr>
             	<th scope="col">답변</th>
             </tr>  
             
             	<c:choose>
                	<c:when test="${map.QNA_RSTATE =='Y'}">
                	<tr>
                		<th scope="col">답변 제목</th>
                		<td><input type="text"  name="QNA_RTITLE" value="${map.QNA_RTITLE}"></input></td>
               			
                	</tr>
                	<tr>
                		<th>답변 내용</th>
                		<td><textarea name="QNA_RCONTENT" rows="15" cols="40"> ${map.QNA_RCONTENT}</textarea></td>
                	</tr>
                	
                	</c:when>
                	<c:otherwise>
                	<tr>
                		<th scope="col">답변 제목</th>
                		<td><input type="text"  name="QNA_RTITLE"></input></td>
               			
                	</tr>
                	<tr>
                		<th>답변 내용</th>
                		<td><textarea name="QNA_RCONTENT" rows="15" cols="30"></textarea></td>
                	</tr>
                	
                	</c:otherwise>
                </c:choose>
             
                
            
       
        
             
            
        </tbody>
        
    </table>
    <div id="PAGE_NAVI"></div>
    <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
    
    <input type="button" onclick="location.href='adminQnAList'" value="목록으로">
    <input type="submit"
    <c:choose>
    	<c:when test="${map.QNA_RSTATE =='Y'}">
    		 value="수정하기"
    		
    	</c:when>
        <c:otherwise>
       		 value="답변 달기"
        </c:otherwise>
    </c:choose>>
    </form>
</body>
</html>