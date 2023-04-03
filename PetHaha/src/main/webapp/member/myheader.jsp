<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <style type=text/css>
	.up_menubar {width: 930px;height: 50px; margin:0 auto;}
	.up_menubar ul {list-style-type: none;}
	.up_menubar ul li {display: inline;position: relative;cursor: pointer;font-weight: bold;
	text-align: center; text-decoration: none;color: rgb(119, 15, 167);}
  </style>

 <div class="up_menubar"> <!-- 내정보 상단 메뉴바 -->
         <ul style="margin-top:2px;">
         	  <li style="text-decoration: none;" onclick="location.href='memberUpdateChkForm'">정보확인 &nbsp; </li>|
              <li style="text-decoration: none;" onclick="location.href='memberUpdateForm'">&nbsp; 정보수정 &nbsp; </li>|
              <li style="text-decoration: none;" onclick="location.href=''">&nbsp; 작성한 글 &nbsp; </li>|
              <li style="text-decoration: none;" onclick="location.href=''">&nbsp; 메세지</li>         
         </ul>
 </div>
