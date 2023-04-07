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
.detail_index { text-align: left; font-size: 26px;font-weight: bold; color:rgb(119, 15, 167)}
.detail_title {margin: 30px; font-weight: bold; font-size: 120%; border:1px solid red;}
.detail_content {margin: 30px; margin-top:20px; font-weight: bold; font-size: 100%; height:200px; line-height: 170%; border:1px solid yellow;}
#detail_btn1{margin-left: 200px;}
#detail_btn .detail_btn1 {width: 100px; height: 40px; border-radius: 20px; text-decoration: none; font-weight: bold; font-size: 100%; background-color: #ca9bee; line-height: 40px; color:#fff; border: 1px solid white; text-align: center;}
#detail_btn .detail_btn1:hover {background-color: white; color: #859bd6; cursor: pointer; border:2px solid #859bd6;}
#detail_btn {margin-left: 200px;}
.de_reply{position:absolute;margin-left:450px; font-weight:bold; height:40px; width:100px; color: white; background-color: #ca9bee; cursor: pointer; font-size:15px; border-radius:20px; border:none;}

</style>

<div class="msg_detail">
	<div class="detail_index">보낸 메세지 <input class="de_reply" type="button" value="답장 보내기" ></div> 	
	<div style="border-top: 2px solid rgb(119, 15, 167); margin-top:15px;"></div>
	  
	<table class="msg_detail_table"><br>
		<div class="detail_nick">보낸사람: ${message.NICK} &nbsp;<span style="font-size:15px;"><fmt:formatDate value="${message.INDATE}" type="date" pattern="yy-MM-dd HH:mm" /></span></div>
		<div class="detail_title">${message.MTITLE}</div> 
		<div class="detail_content">${message.MCONTENT}</div>
	</table>
	<form action="msgDetail">
		<input type="hidden" value="${message.MSNUM}" name="MSNUM">
		<div id="detail_btn" style="margin:0 auto; width: 210px;">
			<input style="margin:auto; background-color:#ca9bee;" class="detail_btn1" type="button" value="목록" onclick="location.href='adminList?table=q'">
			<input style="margin:auto; background-color:#ca9bee;" class="detail_btn1" type="submit" value="삭제" onclick="return detailDelete()">
		</div>
	</form>
</div>
<br><br><br><br><br><br><br><br><br><br>
<%@ include file="../footer.jsp"%>