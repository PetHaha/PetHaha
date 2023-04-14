<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<script type="text/javascript">
	function replycheck(){
	
	   if( document.replyform.RCONTENT.value==""){
	      alert("댓글을 작성해주세요" );
	      document.replyform.RCONTENT.focus();
	      return false;
	   }else return true;
	}

	function replydelete(rnum,bnum,best){
		if (confirm("댓글을 삭제하시겠습니까?")) {
			    location.href = "replydelete?RNUM="+rnum+"&BNUM="+bnum+"&best="+best;
		}
	}

</script>

    <div id="bwrap">
    <c:choose>
    	<c:when test="${best =='1' }">
			 <div id="bwhere" onclick="location.href='index'">베스트 &gt;</div>   	
    	</c:when>
    	<c:when test="${board.CATEGORY =='1'}">
        	<div id="bwhere" onclick="location.href='dogcat?category=1'">강아지게시판 &gt;</div>
        </c:when>
        <c:when test="${board.CATEGORY=='2' }">
        	<div id="bwhere" onclick="location.href='dogcat?category=2'">고양이게시판 &gt;</div>
        </c:when>
    </c:choose>
        <div id="bitems">
            <div id="bsubject">${board.SUBJECT }
           		 	<c:if test="${board.REPLYCNT != '0' }">
                    	<span style=" font-weight:bold;color:#7DD4FF; font-size:15px;">&nbsp;${board.REPLYCNT }</span>
                    </c:if>
            </div>
            <div id="betc">
                <div id="bwrimg"> <img src="images/profile/${writer.MEMIMG }"></div>
                <div class="bas">${board.NICK }</div>
                <div class="bdot">.</div>
                <div class="bas"><fmt:formatDate value="${board.INDATE}" type="date" pattern="yy-MM-dd HH:mm" /></div>
                <div class="bdot">.</div>
                <div class="bas"><img src="images/eye.png" style="height:10px">&nbsp; ${board.VIEWS }</div>
                <div class="bdot">.</div>
                <div class="bas"><img src="images/thumb.png" style="height:9px"> ${board.THUMBS}</div>
            </div>

        </div>
        <div id="bcontent" style="min-height:130px;">
        <c:if test="${!empty board.BIMG1 }">
        	<img src="images/boardimg/${board.BIMG1 }" style="max-width:600px; "><br><br>
        </c:if>
            ${board.CONTENT}

        </div>
        <c:choose>
        <c:when test="${empty loginUser }">
        	<div id="thumbss" style="position: relative;"> <input type="button" value="추천 ${board.THUMBS }" id="bthumbs" onclick="alert('로그인을 해야 추천할 수 있습니다.')"><input type="button" value="신고" id="bpolice"></div>
        </c:when>
        <c:when test="${!empty LikeOX }">
        	<div id="thumbss" style="position: relative;"> <input type="button" value="추천 완료!" id="bthumbs" ><input type="button" value="신고" id="bpolice"></div>
        </c:when>
        <c:otherwise>
        	<div id="thumbss" style="position: relative;"> <input type="button" value="추천 ${board.THUMBS }" id="bthumbs" onclick="location.href='BThumbsUp?ID=${loginUser.ID}&NICK=${loginUser.NICK }&BNUM=${board.BNUM }&best=${best}'"><input type="button" value="신고" id="bpolice"></div>       	
        </c:otherwise>
        </c:choose>
        
        <div id="brlist">
        <div  style="min-height:50px;">
        	<c:forEach items="${reply}" var="reply">
            <c:choose>
            <c:when test="${reply.ID==board.ID }">
            <div class="breplylist" style="background:#FFE7E7">
                <div id="brwrimg"> <img src="images/profile/${reply.MEMIMG }" alt="${reply.INTRO }"  ></div>
                <div class="bras">${reply.NICK }</div>
                <div class="brdot">.</div>
                <div class="bras"><fmt:formatDate value="${reply.INDATE}" type="date" pattern="yy-MM-dd HH:mm" /></div>
                <div class="brdot">.</div>
                <div class="bras"><img src="images/thumb.png" style="height:10px">&nbsp;${ reply.RTHUMBS}</div>
                <div class="brcontent">${reply.RCONTENT }</div> 
                <c:if test="${loginUser.ID ==reply.ID }">
                	<div class="brdelete" onclick="replydelete('${reply.RNUM}','${board.BNUM }','${best }');">삭제 </div>
                </c:if>   
                <div class="brthumbs">추천 </div>
                <div class="brpolice">신고</div>
            </div>
            </c:when>
            <c:otherwise>
            <div class="breplylist">
                <div id="brwrimg"> <img src="images/profile/${reply.MEMIMG }" alt="${reply.INTRO }"  ></div>
                <div class="bras">${reply.NICK }</div>
                <div class="brdot">.</div>
                <div class="bras"><fmt:formatDate value="${reply.INDATE}" type="date" pattern="yy-MM-dd HH:mm" /></div>
                <div class="brdot">.</div>
                <div class="bras"><img src="images/thumb.png" style="height:10px">&nbsp;${ reply.RTHUMBS}</div>
                <div class="brcontent">${reply.RCONTENT }</div> 
                <c:if test="${loginUser.ID ==reply.ID }">
                	<div class="brdelete" onclick="replydelete('${reply.RNUM}','${board.BNUM }','${best }');">삭제 </div>
                </c:if>   
                <div class="brthumbs">추천 </div>
                <div class="brpolice">신고</div>
            </div>
            </c:otherwise>
            </c:choose>
            </c:forEach>
            
            <c:if test="${!empty loginUser }">
	            <form action="boardReplyWrite" method="post" name="replyform">
		            <div class="replycon" style="position: relative; margin-top: 5px; margin-bottom:10px;">
		            <input type="hidden" name="RWRITER" value="${writer.NICK }">
		            <input type="hidden" name="BNUM" value="${board.BNUM }">
		            <input type="hidden" name="ID" value="${loginUser.ID }">
		            <input type="hidden" name="NICK" value="${loginUser.NICK }">
		            <input type="hidden" name="best" value="${best}">
		            	<textarea class="replytext" placeholder="댓글을 작성해주세요" maxlength="200" name="RCONTENT"></textarea><input type="submit" value="등록" class="replysubmit" onclick="return replycheck()">
		            </div>
		        </form>
	        </c:if>
	        </div>
	        <div>
            
                <div class="bback">다음글</div><div class="bback">목록</div><div class="bback">이전글</div>
            </div>
        </div>
    </div>
    <br>


	
<%@ include file="../footer.jsp"%>