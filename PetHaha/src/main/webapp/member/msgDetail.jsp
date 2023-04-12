<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="/member/myheader.jsp"%>
 
<script type="text/javascript">
function detailDelete(msnum){
	var bool = confirm('정말로 삭제하시겠습니까?');
	if (bool) return true;
	else return false;
}
</script>

<style type="text/css">
.msg_detail {position:relative; width: 700px; overflow: hidden; margin:50px auto;}
.detail_index { text-align: left; font-size: 26px;font-weight: bold; color:rgb(119, 15, 167);}
.detail_title {margin: 30px; font-weight: bold; font-size: 19px; background-color: rgb(240, 238, 238);}
.detail_content {margin: 30px; margin-top:20px; font-weight: bold; font-size: 16px; height:200px; line-height: 170%; background-color:rgb(240, 238, 238);}
#detail_btn1{margin-left: 200px;}
#detail_btn .detail_btn1 {width: 100px; height: 40px; border-radius: 20px; text-decoration: none; font-weight: bold; font-size: 100%; background-color: #ca9bee; line-height: 40px; color:#fff; border: 1px solid white; text-align: center;}
#detail_btn .detail_btn1:hover {background-color: white; color: rgb(119, 15, 167); cursor: pointer; border:2px solid rgb(119, 15, 167);}
#detail_btn {margin-left: 200px;}
.de_reply{position:absolute;margin-left:450px; font-weight:bold; height:40px; width:100px; color: white; background-color: #ca9bee; cursor: pointer; font-size:15px; border-radius:20px; border:none;}
.de_reply:hover{color: rgb(119, 15, 167); cursor: pointer; border:2px solid rgb(119, 15, 167);}

</style>

<div class="msg_detail">
<c:choose>
	<c:when test='${message.NICK==loginUser.NICK}'>
		<div class="detail_index">보낸 메세지</div>	
	</c:when>
	<c:otherwise>
		<div class="detail_index">받은 메세지 <input class="de_reply" type="button" value="답장 보내기" onclick="location.href='msgWriteForm?TONICK=${message.TONICK}'" ></div>
	</c:otherwise>
</c:choose>	 	
	<div style="border-top: 2px solid rgb(119, 15, 167); margin-top:15px;"></div>
	  
	<table class="msg_detail_table"><br>
		<div class="detail_nick" style="font-weight:bold; margin-left:30px;">보낸사람: ${message.NICK} &nbsp;<span style="font-size:14px; font-weight:500;"><fmt:formatDate value="${message.INDATE}" type="date" pattern="yy-MM-dd HH:mm" /></span></div>
		<div class="detail_title">${message.MTITLE}</div> 
		<div class="detail_content">${message.MCONTENT}</div>
	</table>
	<form action="msgDetail">
		<input type="hidden" value="${message.MSNUM}" name="MSNUM">
		<div id="detail_btn" style="margin:0 auto; width: 210px;">
		<c:choose>
			<c:when test='${message.NICK==loginUser.NICK}'>
				<input style="margin:auto; background-color:#ca9bee;" class="detail_btn1" type="button" value="목록" onclick="location.href='myMsg_S'">
			</c:when>
			<c:otherwise>
				<input style="margin:auto; background-color:#ca9bee;" class="detail_btn1" type="button" value="목록" onclick="location.href='myMsg_R'">
			</c:otherwise>
		</c:choose>
			<input style="margin:auto; background-color:#ca9bee;" class="detail_btn1" type="submit" value="삭제" onclick="return detailDelete()">
		</div> 
	</form>
</div>
<br><br><br><br><br><br><br><br><br><br>
<%@ include file="../footer.jsp"%>