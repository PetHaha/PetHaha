<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="css/pethaha.css" rel="stylesheet"> 
<script src="script/pethaha.js"></script>
</head>
<body>
<div id="idcheck_box">
	<div id="idcheck_text">
		<form method="post" name="idCheckForm" action="memberIdCheck" >
			<h1 id="idcheckline">아이디 중복 확인</h1>
            아이디 : <input type="text" name="ID" value="${ID}" style="font-size: 17px;">
            <input type="submit" value="검색" class="submit" id="idcheckbutton1"><label for="idcheckbutton1" id="idcheckbutton1_1"></label><br><br><br>
			<c:if test="${result == 1}">
				<script type="text/javascript">
	                    opener.document.joinform.ID.value="";
	                    opener.document.joinform.REID.value="";
				</script>
	                ${ID}(은)는 이미 사용중인 아이디입니다.
			</c:if>
            <c:if test="${result == -1}">
                ${ID}(은)는 사용 가능한 ID입니다.    
                <input type="button" value="사용" class="cancel" id="idcheckbutton2" onclick="idok('${ID}');">
            </c:if>
		</form>
	</div>
</div>

	<script type="text/javascript">
		function idok( ID ){
		   opener.joinform.ID.value = ID;
		   opener.joinform.REID.value = ID;
		   self.close();
		}
	</script>
</body>
</html>