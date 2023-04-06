<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="/member/myheader.jsp"%>

<style type=text/css>
.msgbox { height: 40px;width: 100%;position: relative;border: 1px solid;}
.msgtitle { position: absolute;border: 1px solid salmon;height: 40px;width: 50%;margin-left: 150px;}
.msgdate {position: absolute;height: 40px;width: 80px;border: 1px solid #ca9bee;margin-left: 650px;text-align: center;}
.msgchk{position: absolute; height: 40px;width: 80px;border: 1px solid #ca9bee; margin-left: 800px;text-align: center;}
</style>

    <div id="borderlist">
    	<br>
        <h2 class="subjectt" style="width:160px;">받은 메세지</h2>
        <div style="position:relative;">
       <c:forEach items="${list}" var="message">
	        <div style="height:81px;">
	        	<a class="msgbox" href="#">
	           		<div class="msgnick" style="width: 80px; float: left;"><span>${message.TONICK}</span></div>
	            		<div class="msgtitle">${message.MTITLE}</div>
	            			<div class="msgdate">${message.INDATE}</div>
	            				<div class="msgchk">${message.MCHECK}</div>
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
