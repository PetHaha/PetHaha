<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <style type=text/css>
	.up_menubar {width: 930px;height: 50px; margin:0 auto;}
	.up_menubar ul {list-style-type: none;}
	.up_menubar ul li {display: inline;position: relative;cursor: pointer;font-weight: bold;
	text-align: center; text-decoration: none;color: rgb(119, 15, 167);}
	
	.messageb:hover .menubar_drop {display:block;}
	.up_menubar .menubar_drop{position:absolute; display:none; text-align:center; margin-left: 230px; width:400px;padding-top:10px;}
	.up_menubar .menubar_drop a{display:inline-block; width: 110px; color:rgb(119, 15, 167); float:left;}
  </style>

 <div class="up_menubar"> <!-- 내정보 상단 메뉴바 -->
         <ul style="margin-top:2px;">
         	  <li style="text-decoration: none;" onclick="location.href='memberUpdateChkForm'">정보확인 &nbsp; </li>|
              <li style="text-decoration: none;" onclick="location.href='memberUpdateForm'">&nbsp; 정보수정 &nbsp; </li>|
              <li style="text-decoration: none;" onclick="location.href='myBoard?first=y'">&nbsp; 작성한 글 &nbsp; </li>|
              <li style="text-decoration: none;" onclick="location.href='myReply?first=y'">&nbsp; 작성한 댓글 &nbsp; </li>|
              <li class="messageb" style="text-decoration: none;">&nbsp; 메세지
              	<ul class="menubar_drop">
                    <a href='myMsg_S?first=y'>보낸 메세지</a> 
                    <a href="myMsg_R">받은 메세지</a> 
                    <a href="#">메세지 보내기</a>    
                </ul> 
              </li>   
         </ul>
 </div>
