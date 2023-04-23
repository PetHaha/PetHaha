<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <style type="text/css">
        .police th{background-color: #dbadff; color: white;}
        .police{width: 400px; height: 380px;}
        .policebox{width: 400px; height: 300px;}
        .policeselect{width: 310px; height:28px ;border: 0; font-weight: bold;}
        textarea:focus {outline: none;}
        select:focus{outline: none;}
        .policetext{width: 300px;height: 190px; padding: 5px; resize: none; border: 0;padding-top: 15px;}
        .policesubmitbox{text-align: right;}
        .policesubmit{height: 30px; color:white; margin: 3px;background-color: #dbadff; border: 0; border-radius: 7px;}
    </style>
    
    <script type="text/javascript">
	function reportcheck(){
	
	   if( document.reportform.RCONTENT.value==""){
	      alert("신고 상세 사유를 적어주세요" );
	      document.reportform.RCONTENT.focus();
	      return false;
	   }else return true;
	}

	function reportclose(){
		if (confirm("신고를 취소하시겠습니까.")) {
			   window.close();
		}
	}

</script>
</head>
<body>
<c:if test="${result =='1' }">
	<script type="text/javascript">
	opener.location.reload();
	window.close();
	</script>
</c:if>
<form  action="boardReport" method="post"  name="reportform">
    <div class="police">
        <h2 style="text-align: center; color:#dbadff">게시글 신고</h2>
        <table  class="policebox">
            <tr style="border: 1px solid #dbadff;">
                <th style="width:80px;border: 1px solid #dbadff; height: 30px;" >
                    신고 사유
                </th>
                <td style="border:1px solid #dbadff;">
                    <select class="policeselect" name="RCATEGORY">
                        <option value="1">게시판 주제에 맞지 않는 내용</option>
                        <option value="2">선정적인 자료</option>
                        <option value="3">정치/선동 자료</option>
                        <option value="4">중복 글</option>      
                    </select>
                </td>
            </tr>
            <tr>
                <th style="width:80px;border: 1px solid #dbadff; height: 200px;">
                    상세 내용
                </th>
                <td style="border:1px solid #dbadff;">
                    <textarea class="policetext" maxlength="200" name="RCONTENT"></textarea>
                </td>
            </tr>
            <tr>
                <th style="background-color: white;">
                <input type="hidden" name="NICK" value="${NICK }">
                <input type="hidden" name="ID" value="${ID }">
                <input type="hidden" name="BNUM" value="${BNUM }">
                </th>
                
                <td class="policesubmitbox"><input type="submit" value=" 신고하기" class="policesubmit" onclick="return reportcheck();"><input type="button" value="취소" class="policesubmit" onclick="reportclose();"></td>
            </tr>
          </table>
    </div>
</form>
</body>
</html>