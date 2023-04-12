<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="/member/myheader.jsp"%>

<script type="text/javascript">
	function cancelMsg(){
        if( confirm("작성을 취소하시겠습니까?") ) {
            location.href = "msgWrite";
        }
	}
	
</script>

<style type="text/css">
.msg_detail {position:relative; width: 700px; overflow: hidden; margin:50px auto;}
.detail_index { text-align: left; font-size: 26px;font-weight: bold; color:rgb(119, 15, 167);}
.detail_title {position:absolute; margin: 30px; font-size: 19px; background-color: rgb(240, 238, 238); margin-top:10px; color:gray;}
.detail_content {margin: 30px; margin-top:20px; font-size: 16px; height:200px; line-height: 170%; background-color:rgb(240, 238, 238); color:gray;}
#detail_btn1{margin-left: 200px;}
#detail_btn .detail_btn1 {width: 100px; height: 40px; border-radius: 20px; text-decoration: none; font-weight: bold; font-size: 100%; background-color: #ca9bee; line-height: 40px; color:#fff; border: 1px solid white; text-align: center;}
#detail_btn .detail_btn1:hover {background-color: white; color: rgb(119, 15, 167); cursor: pointer; border:2px solid rgb(119, 15, 167);}
#detail_btn {margin-left: 200px;}
</style>

<div class="msg_detail">
	<div class="detail_index">메세지 보내기</div>		
	<div style="border-top: 2px solid rgb(119, 15, 167); margin-top:15px;"></div>
	  
	<table class="msg_detail_table"><br>
		<div class="write_box" style="position:relative; width:600px;">
			<input type="text" style="border:none;" class="detail_title" name="MTITLE" value="${message.MTITLE}" placeholder="제목을 입력해주세요."/><br><br>
			<textarea name="MCONTENT" value="${message.MCONTENT}" style="height:160px; width: 600px; resize:none; border:none" class="detail_content" placeholder="내용을 입력해주세요.&#10;*욕설 및 비방이 담긴 메세지는 관리자에 의해 삭제될 수 있습니다."></textarea>
		</div>
	</table><br>
	<form action="msgWrite">
		<input type="hidden" value="${message.MSNUM}" name="MSNUM">
		<input type="hidden" value="${message.TONICK}" name="TONICK">
		<div id="detail_btn" style="margin:0 auto; width: 210px;">
			<input style="margin:auto; background-color:#ca9bee;" class="detail_btn1" type="submit" value="전송">		
			<input style="margin:auto; background-color:#ca9bee;" class="detail_btn1" type="submit" value="취소" onclick="return cancelMsg()">
		</div> 
	</form>
</div>
<br><br><br><br><br><br><br><br><br><br>
<%@ include file="../footer.jsp"%>