<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script type="text/javascript">

$(function(){
	$('#myButton').click( function(){
		var formselect = $("#boardfileupForm")[0];   
		var formdata = new FormData(formselect); 
		$.ajax({    
			url:"<%=request.getContextPath() %>/boardImgfileUp",
			type:"POST",
			enctype:"multipart/form-data",
			async: false,
			data: formdata,
	    	timeout: 10000,
	    	contentType : false,
	        processData : false,
	        success : function(data){
	            if(data.STATUS == 1){  	
	            	$("#fileimage").val(data.FILENAME);
	            	$("#filename").html("<img src='images/boardimg/"+data.FILENAME+"' height='150'/>");
	            }
	        },
	        error: function() {	alert("업로드 실패");}
		});
	});
});

function boardCheck(){
	
		if( document.writeform.SUBJECT.value==""){
	      alert("제목을 입력하세요" );
	      document.writeform.SUBJECT.focus();
	      return false;
	    }else if( document.writeform.CONTENT.value==""){
	      alert("내용을 입력하세요" );
	      document.writeform.CONTENT.focus();
	      return false;
	    }else return true;
	}

</script>


	<div id="bbwrap">
        <div id="bbsubject">게시글 쓰기</div>
        <c:choose>
        	<c:when test="${category=='1' }">
        		<div id="bbwhere"> &lt;강아지게시판 &gt;</div>
        	</c:when>
        	<c:otherwise>
        		<div id="bbwhere"> &lt;고양이게시판 &gt;</div>
        	</c:otherwise>
        </c:choose>
        <div>
        <form action="boardWrite" method="post" name="writeform">
        	<input type="hidden" name="CATEGORY" value="${category }">
        	<input type="hidden" name="NICK" value="${loginUser.NICK}">
        	<input type="hidden" name="ID" value="${loginUser.ID }">
            <input type="text" placeholder="제목을 입력하세요. (15글자 이내)" id="bbsub" maxlength="15" name="SUBJECT" >
            <br>
            <textarea id="bbcont" placeholder="내용을 입력하세요." maxlength="300" name="CONTENT"></textarea>
            <br>
             <br>
            <label for="img" id="imnam"> º 이미지 등록</label>
            <br>
            <div style="height:200px; width:100%;"> 
               <input type="hidden" name="BIMG1" id="fileimage">
              <div id="filename" style="float:left; margin:10px;" >
              </div>
           </div>
            <input id="bbwrite" type="submit" value="등록" onclick="return boardCheck();">
            </form>
        </div>
        
        <div style="position:absolute; bottom:210px; margin-left: 5px;" >
            <form name="fromm" id="boardfileupForm" method="post" enctype="multipart/form-data">
              <input type="file" name="fileimage"><input type="button" id="myButton" value="추가">
           </form> 
        </div>
    </div>

	
<%@ include file="../footer.jsp"%>