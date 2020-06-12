<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>reviewDetail</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ui.css'/>" /> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
	<form id="frm" method="post" action="<c:url value='/review/insertComment'/>">
        <table class="board_view">
            <colgroup>
                <col width="15%">
                <col width="85%">
            </colgroup>
            <tbody>
                <tr>
                    <th>댓글</th>
                    <td>
                        ${fn:length(comment) }
                    </td>
                </tr>
                <c:if test="${fn:length(comment)>0 }">
                    <c:forEach items="${comment }" var="com">
                        <tr>
                            <td style="background:#f7f7f7;color:#3b3a3a;" >
                                <p style="font-size: 8px;" >${com.CO_DATE }</p>
                            </td>
                            <td>
                             <input type="hidden" value="${com.CO_NUM }" id="com_CO_NUM">
                                <input type="hidden" value="${com.RE_NUM }" id="com_RE_NUM">
                                <div id="com_Div"><input type="hidden" value ="${com.CO_CONTENT}" id="com_CON">${com.CO_CONTENT }</div>
                                <div align="right">
                                    <a href="#this" name="com_Del" class="btn1">삭제</a>
                                    <a href="#this" name="com_Mod" class="btn1">수정</a>
                                </div>                            
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                <tr>
                    <td colspan="2">
                        <div>
                            Admin
 
 
                            <textarea  rows="5" cols="130" name="CO_CONTENT" ></textarea>
                            <p align="right" ><input type="submit"  id="com_write" class="btn1"value="등록"></a></p>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
     
    <a href="#this" id="update" class="btn">수정하기</a>
    <a href="#this" id="list" class="btn">목록</a>
     
    <script type="text/javascript">
        $(document).ready(function(){
            $("#update").on("click",function(e){
                e.preventDefault();
                fn_openBoardUpdate();
            })
            $("#list").on("click",function(e){
                e.preventDefault();
                fn_openBoardList();
            })
           
            $("#com_write").on("click",function(e){
                e.preventDefault();
                fn_writeComment();
            })
            $("a[name=com_Del]").on("click",function(e){
                e.preventDefault();
                fn_deleteComment($(this));
            })
            $("a[name=com_Mod]").on("click",function(e){
                e.preventDefault();
                fn_commentModify($(this));
            })
             
        })
         
     
 
        function fn_writeComment(){
            var comSubmit = new ComSubmit("frm");
            comSubmit.addParam("RE_NUM",${map.RE_NUM})
            comSubmit.addParam("CO_NUM",${map.CO_NUM})
            comSubmit.setUrl("<c:url value='/review/insertComment'/>");
            comSubmit.submit();
        }
 
        function fn_deleteComment(obj){
            var comSubmit = new ComSubmit();
            comSubmit.addParam("CO_NUM",${map.CO_NUM})
            comSubmit.addParam("COM_CO_NUM",obj.parent().parent().find("#com_CO_NUM").val());
            comSubmit.setUrl("<c:url value='/sample/deleteComment'/>");
            comSubmit.submit();
        }
 
        function fn_commentModify(obj){
            var con = obj.parent().parent().find("#com_Div").find("#com_CON").val();
            var str = "<textarea  rows='5' cols='100' name='COM_CONTENTS_UPD'>"+con+"</textarea><p align='right' ><a href=''#this' name='com_Upd' class='btn'>등록</a></p><hr/>";
            var div = obj.parent().parent().find("#com_Div");
 
            div.empty();
            div.append(str)
             
            $("a[name=com_Upd]").on("click",function(e){
                e.preventDefault();
                fn_updateComment($(this));
            })
        }
 
        function fn_updateComment(obj){
            var comSubmit = new ComSubmit("frm");
            comSubmit.addParam("CO_NUM",${map.CO_NUM})
            comSubmit.addParam("CO_NUM",obj.parent().parent().parent().find("#com_CO_NUM").val());
            comSubmit.setUrl("<c:url value='/review/updateComment'/>");
            comSubmit.submit();
        }
</script>
</body>
</html>
