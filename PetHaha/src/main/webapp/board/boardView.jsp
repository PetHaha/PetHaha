<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

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
            <div id="bsubject">${board.SUBJECT }</div>
            <div id="betc">
                <div id="bwrimg"> <img src="images/profile/${writer.MEMIMG }"></div>
                <div class="bas">${board.NICK }</div>
                <div class="bdot">.</div>
                <div class="bas"><fmt:formatDate value="${board.INDATE}" type="date" pattern="yy-MM-dd HH:mm" /></div>
                <div class="bdot">.</div>
                <div class="bas"><img src="images/eye.png" style="height:10px">&nbsp; ${board.VIEWS }</div>
            </div>

        </div>
        <div id="bcontent">
        <c:if test="${!empty board.BIMG1 }">
        	<img src="images/boardimg/${board.BIMG1 }" style="max-width:600px; "><br><br>
        </c:if>
            ${board.CONTENT}

        </div>
        <div id="thumbss" style="position: relative;"> <input type="button" value="추천 ${board.THUMBS }" id="bthumbs"><input type="button" value="신고" id="bpolice"></div>
        <div id="brlist">
            <div class="breplylist">
                <div id="brwrimg"> <img src="images/boardimg/noimg.jpg" alt="시공설치기사 시절 유튜브 뜨길래 오랜만에 봤는데 ㅋㅋ"  ></div>
                <div class="bras">겨울배가맛있단다배가달아</div>
                <div class="brdot">.</div>
                <div class="bras">25초전</div>
                <div class="brdot">.</div>
                <div class="bras"><img src="images/thumb.png" style="height:10px">&nbsp;2</div>
                <div class="brcontent">이거재밌네어쩌구저쩌구저쩌구</div>    
                <div class="brthumbs">추천</div>
                <div class="brpolice">신고</div>
            </div>
            <div class="breplylist">
                <div id="brwrimg"> <img src="images/boardimg/noimg.jpg" alt="시공설치기사 시절 유튜브 뜨길래 오랜만에 봤는데 ㅋㅋ"  ></div>
                <div class="bras">겨울배가맛있단다배가달아</div>
                <div class="brdot">.</div>
                <div class="bras">25초전</div>
                <div class="brdot">.</div>
                <div class="bras"><img src="images/thumb.png" style="height:10px">&nbsp;2</div>
                <div class="brcontent">이거재밌네어쩌구저쩌구저쩌구</div>    
                <div class="brthumbs">추천</div>
                <div class="brpolice">신고</div>
            </div>
            <div class="breplylist">
                <div id="brwrimg"> <img src="images/boardimg/noimg.jpg" alt="시공설치기사 시절 유튜브 뜨길래 오랜만에 봤는데 ㅋㅋ"  ></div>
                <div class="bras">겨울배가맛있단다배가달아</div>
                <div class="brdot">.</div>
                <div class="bras">25초전</div>
                <div class="brdot">.</div>
                <div class="bras"><img src="images/thumb.png" style="height:10px">&nbsp;2</div>
                <div class="brcontent">이거재밌네어쩌구저쩌구저쩌구</div>    
                <div class="brthumbs">추천</div>
                <div class="brpolice">신고</div>
            </div>
            <form action="boardReplyWrite" method="post">
	            <div class="replycon" style="position: relative; margin-top: 5px; margin-bottom:10px;">
	            <input type="hidden" name="RWRITER" value="">
	            <input type="hidden" name="BNUM" value="">
	            <input type="hidden" name="ID" value="">
	            <input type="hidden" name="NICK" value="">
	            <input type="hidden" name="MEMIMG" value="">
	            	<textarea class="replytext" placeholder="댓글을 작성해주세요" maxlength="200" name="RCONTENT"></textarea><input type="submit" value="등록" class="replysubmit">
	            </div>
	        </form>
	        <div>
            
                <div class="bback">다음글</div><div class="bback">목록</div><div class="bback">이전글</div>
            </div>
        </div>
    </div>
    <br>


	
<%@ include file="../footer.jsp"%>