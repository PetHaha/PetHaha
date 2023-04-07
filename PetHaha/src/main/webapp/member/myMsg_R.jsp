<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="/member/myheader.jsp"%>

<style type=text/css>
.msgbox { height: 40px;width: 100%;position: relative;}
.msgnick{position:absolute; width:130px; line-height:40px; text-align:center; font-weight:bold;}
.msgtitle { position: absolute;height: 40px;width: 50%; margin-left: 150px;   text-align: left;padding-left: 10px; line-height: 40px;}
.msgdate {position: absolute;height: 40px;width: 130px;margin-left: 650px;text-align: center; line-height: 40px;}
.msgchk img{position: absolute; height: 30px;width: 30px;margin-left: 800px;text-align: center; line-height: 40px;}
</style>

    <div id="borderlist">
    	<br>
        <h2 class="subjectt" style="width:160px;">받은 메세지</h2>
        <div style="position:relative;">
       <c:forEach items="${list}" var="message">
	        <div style="height:42px;">
	        	<a class="msgbox" href="msgDetail?MSNUM=${message.MSNUM}" style="color:black">
	           		<div class="msgnick">From. <span>${message.NICK}</span></div>
	            		<div class="msgtitle">${message.MTITLE}</div>
	            			<div class="msgdate"><fmt:formatDate value="${message.INDATE}" type="date" pattern="yy-MM-dd HH:mm" /></div> 
	            				<c:choose>
	            				<c:when test='${message.MCHECK=="0"}'>
	            					<div class="msgchk"><img src="images/unopened.png"></div>
	            				</c:when>
	            				<c:when test='${message.MCHECK=="1"}'>
	            					<div class="msgchk"><img src="images/opened.png"></div>
	            				</c:when>
            				</c:choose>
	       		 </a>
	        </div>
    	</c:forEach>
        </div>
       
        <jsp:include page="/board/paging.jsp">
			<jsp:param name="command" value="index"/>
		</jsp:include>	
	
        <br>
        <form name="frm" method="post" action="index">
        <input type="hidden" name="category" value="0">
	        
		</form>
        

    </div>
    <br>
	
<%@ include file="../footer.jsp"%>
