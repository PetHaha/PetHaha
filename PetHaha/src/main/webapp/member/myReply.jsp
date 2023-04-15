<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="/member/myheader.jsp"%>

<script type="text/javascript">
function replydelete(rnum,bnum,best){
	if (confirm("댓글을 삭제하시겠습니까?")) {
		    location.href = "replydelete?RNUM="+rnum+"&BNUM="+bnum+"&best="+best;
	}
}
</script>

  <div id="borderlist">
  	<br>
  	 <h2 class="subjectt" style="width:140px;">작성한 댓글</h2>
     <div style="position:relative;">
        <div  style="min-height:50px;">
        	<c:forEach items="${list}" var="reply">
            <div class="breplylist">
                <div id="brwrimg"> <img src="images/profile/${reply.MEMIMG }" alt="${reply.INTRO }"  ></div>
                <div class="bras">${reply.NICK }</div>
                <div class="brdot">.</div>
                <div class="bras"><fmt:formatDate value="${reply.INDATE}" type="date" pattern="yy-MM-dd HH:mm" /></div>
                <div class="brdot">.</div>
                <div class="bras"><img src="images/thumb.png" style="height:10px">&nbsp;${ reply.RTHUMBS}</div>
                <div class="brcontent">${reply.RCONTENT }</div> 
                <c:if test="${loginUser.ID ==reply.ID }">
                	<div class="brdelete" style="right:0px;" onclick="replydelete('${reply.RNUM}','${board.BNUM }','${best}');">삭제 </div>
                </c:if>   
            </div>
            </c:forEach>
         </div>
     </div>     
        <jsp:include page="/board/paging.jsp">
			<jsp:param name="command" value="index"/>
		</jsp:include>	
         
  	 
   </div>
        
















<%@ include file="../footer.jsp"%>
