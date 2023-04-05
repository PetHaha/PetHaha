<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="/member/myheader.jsp"%>

    <div id="borderlist">
    	<br>
        <h2 class="subjectt">보낸 메세지</h2>
        <div style="position:relative;">
        <c:forEach items="${list}" var="board">
        <div style="height:81px; flaot:left;">
        <a class="items" href="#">
           <div class=""></div>
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
