<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 
<fmt:setLocale value="ko_KR"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PetHaha</title>

<link href="css/pethaha.css" rel="stylesheet">
<link href="css/daeui.css" rel="stylesheet">
<script type="text/javascript" src="/code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="js/jquery-3.6.1.js"></script>
<script type="text/javascript" src="js/pethaha.js"></script>

<script type="text/javascript">    
    function checkLogout() {
        if( confirm("로그아웃이 완료되었습니다.") ) {
            location.href = "logout";
        }
    }    
</script>

</head>
<body>
    <div class="headerbox">
      	<div id="mainlogo" onclick="location.href='index'">
        	<img src="images/petlogo.png"/><div id="mainname">펫하하</div>
      	</div>
	    
	        <c:choose>
	          	<c:when test="${empty loginUser}">
	          	<div class="headbuttons">
	            	<input type="button" value="로그인" class="headbutton" onclick="location.href='loginForm'">
	            	<input type="button" value="회원가입" class="headbutton" onclick="location.href='memberJoin'">
	            </div>
	          	</c:when>
	          	<c:otherwise>
	          	<div class="headbuttons2" style="position: absolute; width: 412px;top: 23px;right:30px; height:80px; ">
	          		<div id="welcome" style="width:200px; height:60px;  float:left; color:white; font-weight:bold; line-height:60px;" ><span style="font-size:115%;">'${loginUser.NICK }'</span> 님 반가워요!</div>
 			        <input type="button" value="로그아웃" class="headbutton" onclick="checkLogout();">
		    		<input type="button" value="내 정보" class="headbutton" onclick="location.href='memberUpdateForm'">
		    	</div>
    			</c:otherwise>   
	        </c:choose>
	  	
    </div>
    
    <div class="menubar">
      	<ul style="margin-top:15px;">
		        <li style="text-decoration: none;">베스트</li>
		        <li style="text-decoration: none;">강아지</li>
		        <li style="text-decoration: none;">고양이</li>
		        <li style="text-decoration: none;">정보</li>
      	</ul>
    </div>
 <br>