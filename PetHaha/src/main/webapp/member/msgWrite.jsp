<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="/member/myheader.jsp"%>

<script type="text/javascript">
	function cancelMsg(){
        if( confirm("작성을 취소하시겠습니까?") ) {
            location.href = "msgWrite";
        }
	}
	
	function okMsg(){	
	   if( document.msgWrite.MTITLE.value==""){
	      alert("제목을 작성해주세요." );
	      return false;
	   }
	   if( document.msgWrite.MCONTENT.value==""){
		   alert("내용을 입력해주세요.");
		   return false;
	   }else return true;
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
.toNick{margin-top:17px; margin-left:30px; font-weight:bold;}
.toNick2{margin-top:17px; background-color: rgb(240, 238, 238); color: gray; height:24px;}
</style>

<form action="msgWrite" method="post" name="msgWrite">
<div class="msg_detail">
	<div class="detail_index">메세지 보내기</div>		
	<div style="border-top: 2px solid rgb(119, 15, 167); margin-top:15px;"></div>
	<div class="toNick">받는사람: <input type="text" style="border:none;" class="toNick2" name="TONICK" value="${TONICK}" placeholder="닉네임을 입력해주세요."/></div> <div style="font-weight:bold; color:gray;">${message}</div>
	<!-- 나중에 닉네임 중복이라던지, 고르게 설정하기 -->
	  
	<table class="msg_detail_table"><br>
		<div class="write_box" style="position:relative; width:600px;">
			<input type="text" style="border:none;" class="detail_title" name="MTITLE" value="${MTITLE}" placeholder="제목을 입력해주세요."/><br><br>
			<textarea name="MCONTENT" value="${MCONTENT}" style="height:160px; width: 600px; resize:none; border:none" class="detail_content" placeholder="내용을 입력해주세요.&#10;*욕설 및 비방이 담긴 메세지는 관리자에 의해 삭제될 수 있습니다."></textarea>
		</div>
	</table><br>
		<input type="hidden" value="${loginUser.ID}" name="ID">
		<input type="hidden" value="${loginUser.NICK}" name="NICK">
		<div id="detail_btn" style="margin:0 auto; width: 210px;">
			<input style="margin:auto; background-color:#ca9bee;" class="detail_btn1" type="submit" value="전송" onclick="return okMsg()" >		
			<input style="margin:auto; background-color:#ca9bee;" class="detail_btn1" type="button" value="취소" onclick="return cancelMsg()">
		</div> 
	</form>
</div>
<br><br><br><br><br><br><br><br><br><br>
<%@ include file="../footer.jsp"%>