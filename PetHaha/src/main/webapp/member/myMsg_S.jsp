<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="/member/myheader.jsp"%>

    <div id="borderlist">
    	<br>
        <h2 class="subjectt">보낸 메세지</h2>
        <div style="position:relative;">
        <c:forEach items="${list}" var="board">
        <div style="height:81px; flaot:left;	">
        <a class="items" href="#">
            <div class="images">
            <c:choose>
	            <c:when test="${empty board.BIMG1 }">
	                <img src="images/boardimg/noimg.jpg" alt="${board.SUBJECT }"  >
	            </c:when>
	            <c:otherwise>
	            	<img src="images/boardimg/${board.BIMG1}" alt="${board.SUBJECT }"  >
	            </c:otherwise> 
            </c:choose>   
            </div>
            <div class="info" >
                <div class="titleContainer">
                	<c:choose>
                		<c:when test="${board.CATEGORY=='1' }">
                    		<span class="category">강아지</span>
                    	</c:when>
                    	<c:otherwise>
                    		<span class="category">고양이</span>
                    	</c:otherwise>
                    </c:choose>
                    <span class="title">
                    <span class="text"> ${board.SUBJECT}</span>
                    </span>
                </div>
                <div class="etc">
                    <div class="as">${board.NICK }</div>
                    <div class="dot">.</div>
                    <div class="as">${board.INDATE }</div>
                    <div class="dot">.</div>
                    <div class="as"><img src="images/eye.png" style="height:10px"> ${board.VIEWS }</div>
                    <div class="dot">.</div>
                    <div class="as"><img src="images/thumb.png" style="height:9px"> ${board.THUMBS}</div>
                </div>
            </div>
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
