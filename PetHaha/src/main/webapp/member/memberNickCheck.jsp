<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="css/pethaha.css" rel="stylesheet"> 

</head>
<body>
<div id="idcheck_box">
	<div id="idcheck_text">
		<form method="post" name="idCheckForm" action="memberNickCheck" >
			<h1 id="idcheckline">닉네임 중복 확인</h1>
            아이디 : <input type="text" name="NICK" value="${NICK}" style="font-size: 17px;">
            <input type="submit" value="검색" class="submit" id="idcheckbutton1"><label for="idcheckbutton1" id="idcheckbutton1_1"></label><br><br><br>
			<c:if test="${result == 1}">
				<script type="text/javascript">
	                    opener.document.joinform.NICK.value="";
	                    opener.document.joinform.RENICK.value="";
				</script>
	                ${NICK}(은)는 이미 사용중인 닉네임입니다.
			</c:if>
            <c:if test="${result == -1}">
                	${NICK}(은)는 사용 가능한 닉네임입니다.    
                <input type="button" value="사용" class="cancel" id="idcheckbutton2" onclick="nickok('${NICK}');">
            </c:if>
		</form>
	</div>
</div>

	<script type="text/javascript">
		function nickok( NICK ){
		   opener.joinform.NICK.value = NICK;
		   opener.joinform.RENICK.value = NICK;
		   self.close();
		}
	</script>
</body>
</html>