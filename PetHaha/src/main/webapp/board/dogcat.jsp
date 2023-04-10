<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<script type="text/javascript">
$(function(){
	var num=0;
	setInterval(function(){
        $('#rb').animate({ left : num * -820 },2000);
            num++;
            if(num==2)num=0;
    }, 4000);
});
</script>


	<div id="pbanner" style="position:relative; height: 120px; width: 820px; margin:0 auto; overflow:hidden;">
		<div id="rb" style="position:absolute; top:0px; left:0px; width: 1640px; height:120px; float:left; "><img src="images/pet1.jpg" style="height: 120px; width: 820px; margin:0 auto;" ><img src="images/pet2.jpg" style="height: 120px; width: 820px; margin:0 auto;" ></div>
	</div>

    <div id="borderlist">
    	<br>
    	<c:choose>
    	<c:when test="${category =='1' }">
        	<h2 class="subjectt">&nbsp;&nbsp;강아지</h2>
        </c:when>
        <c:when test="${category =='2' }">
        	<h2 class="subjectt">&nbsp;&nbsp;고양이</h2>
        </c:when>
        </c:choose>
        <div style="position:relative;">
        <c:forEach items="${list}" var="board">
        <div style="height:81px; 	">
        <a class="items" href="boardView?BNUM=${board.BNUM }">
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
                	
                    <span class="title">
                    <span class="text"> ${board.SUBJECT}</span>
                    </span>
                </div>
                <div class="etc">
                    <div class="as">${board.NICK }</div>
                    <div class="dot">.</div>
                    <div class="as"><fmt:formatDate value="${board.INDATE}" type="date" pattern="yy-MM-dd HH:mm" /></div>
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
       
        <jsp:include page="/board/paging2.jsp">
			<jsp:param name="command" value="dogcat?category=${category}"/>
		</jsp:include>	
	
        <br>
        <form name="frm" method="post" action="dogcat?category=${category}">
	        <table id="" style="float: right; ">
				<tr >
					
					<td style="font-size:15px; width:642; " >
					<input  style="background-color: #dcb1ff; border-radius: 8px; border: 0;  height: 30px; width: 80px; margin-right: 68px; cursor:pointer; color:white; font-weight:bold;" type="button"   value="글쓰기">
	                    <select style="height:30px;background-color: #dcb1ff; border-radius: 8px; border: 0; width: 100px; color:white; font-weight:bold;" name="sc">
	                        <option value="1" >제목</option>
	                        <option value="2">내용</option>
	                        <option value="3">작성자</option>
	                    </select>
	                    <input type="hidden" name="page" value="1">
	                    <input  type="text" name="key" style="background-color: #f5edfc; border-radius: 3px; border: 0;  height: 30px;">
						<input  style="background-color: #dcb1ff; border-radius: 8px; color:white; font-weight:bold; border: 0;  height: 30px; width: 50px; cursor:pointer;" type="submit" name="btn_search" value="검색">
					</td>
				</tr>
			</table>
		</form>
        

    </div>
    <br>
	
<%@ include file="../footer.jsp"%>
