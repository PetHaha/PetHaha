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
	            	$("#oldImg").hide();
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
    }else if(confirm("게시글을 수정하시겠습니까?")) return true;
}

function boardcancel(){
	if(confirm("게시글 수정을 취소하시겠습니까?"))history.go(-1);
}
</script>


	<div id="bbwrap">
        <div id="bbsubject">게시글 수정</div>
        <div>
        <form action="boardEdit" method="post" name="writeform">
        	<input type="hidden" name="BNUM" value="${board.BNUM }">
            <input type="text"  id="bbsub" maxlength="15" name="SUBJECT" value="${board.SUBJECT }">
            <br>
            <textarea id="bbcont" maxlength="300" name="CONTENT" >${board.CONTENT}</textarea>
            <br>
             <br>
            <label for="img" id="imnam"> º 이미지 수정</label>
            <br>
            <div style="height:200px; width:100%;"> 
               <input type="hidden" name="BIMG1" id="fileimage">
               <input type="hidden" name="oldImg" value="${board.BIMG1 }">
              <div id="filename" style="float:left; margin:10px;" >
              <c:if test="${!empty board.BIMG1 }">
              	 <img src='images/boardimg/${board.BIMG1}' height='150' id="oldImg"/>
              </c:if>
              </div>
           </div>
            <input id="bbwrite2" type="submit" value="수정" onclick="return boardCheck();">
            <input id="bbcancel" type="button" value="취소" onclick="boardcancel()">
            </form>
        </div>
        
        <div style="position:absolute; bottom:210px; margin-left: 5px;" >
            <form name="fromm" id="boardfileupForm" method="post" enctype="multipart/form-data">
              <input type="file" name="fileimage"><input type="button" id="myButton" value="추가">
           </form> 
        </div>
    </div>

	
<%@ include file="../footer.jsp"%>