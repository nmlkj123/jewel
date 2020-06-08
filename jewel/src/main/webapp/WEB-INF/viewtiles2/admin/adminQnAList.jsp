<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


</head>
<body>
    <h2>QnA 목록</h2>
    <table class="board_list">
        <colgroup>
            <col width="10%"/>
            <col width="15"/>
            <col width="10%"/>
            <col width="20%"/>
            <col width="25%"/>
            <col width="10"/>
            <col width="10%"/>
            
        </colgroup>
        <thead>
            <tr>
                <th scope="col">QnA번호</th>
                <th scope="col">회원ID</th>
                <th scope="col">질문카테고리</th>
                <th scope="col">질문제목</th>
                
                <th scope="col">질문날짜</th>
                <th scope="col">답변상태</th>
            </tr>
        </thead>
        <tbody>
             <c:choose>
                <c:when test="${fn:length(list) > 0}">
                    <c:forEach items="${list}" var="row">
                        <tr>
                            <td>${row.QNA_NUM}</td>
                            <c:choose>
                            	<c:when test="${row.MEM_ID==null}">
                            		<td>${row.QNA_NAME}</td>
                            	</c:when>
                            	<c:otherwise>
                            	<td>
                                ${row.MEM_ID }
                               
                            	</td>
                            </c:otherwise>
                            </c:choose>
                            
                            
                            <td> ${row.QNA_CATE}</td>
                            <td><a href="adminQnADetail?QNA_NUM=${row.QNA_NUM}">${row.QNA_TITLE}</a></td>
                            
                            <td>${row.QNA_DATE}</td>
                            <td 
                            <c:choose>
								<c:when test="${row.QNA_RSTATE == 'N'}"> 
									style="color:red"
								</c:when>
								<c:otherwise>
									style="color:green"
								</c:otherwise>

							</c:choose>>
							 <c:choose>
								<c:when test="${row.QNA_RSTATE == 'N'}"> 
									미답변
								</c:when>
								<c:otherwise>
									답변함
								</c:otherwise>

							</c:choose>
							</td>
                    </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="4">조회된 결과가 없습니다.</td>
                    </tr>
                </c:otherwise>
            </c:choose> 
            
        </tbody>
    </table>
    <div align="center"class="container pt-5" id="categoryPaging" >
   ${AdminQnaListPaging.pagingHTML}
   
   </div>
    <br/>

     
   
    
</body>
</html>