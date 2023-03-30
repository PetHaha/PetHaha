<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

  
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>
    .jbody {min-height: 100vh; background-color:white; margin:0 auto;}
    .input-form {max-width: 680px;margin-top: 80px;padding: 32px;background: #fff;
      -webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)}
      .error_text{color:#dc3545; font-size:80%}
  </style>
<script type="text/javascript" src="/code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="js/jquery-3.6.1.js"></script>  
<script type="text/javascript">

// file upload ajax
$(function(){
	$('#myButton').click( function(){
		var formselect = $("#fileupForm")[0];   
		var formdata = new FormData(formselect); 
		$.ajax({    
			url:"<%=request.getContextPath() %>/fileUp",
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
	            	$("#filename").html("<img src='"+data.FILENAME+"' height='150'/>");
	            }
	        },
	        error: function() {	alert("업로드 실패");}
		});
	});
});

	$( function(){
		$("#userpwdchk").keyup( function(event){
			event.target.value = event.target.value.trim();
			let pass1 = $("#userpwd").val();
			let pass2 = $("#userpwdchk").val();
			if (pass1 != "" || pass2 != ""){
				if (pass1 == pass2){
					$("#error1").html('');
				} else {
					$("#error1").html('비밀번호가 일치하지 않습니다.');
					
				}
			}
		})

		$("#userpwd").keyup( function(event){ 
			event.target.value = event.target.value.trim();
			let pass1 = $("#userpwd").val();
			let pass2 = $("#userpwdchk").val();
			if (pass1 != '' && pass2 != ''){
				if (pass1 == pass2){
					$("#error1").html('');
				} else {
					$("#error1").html('비밀번호가 일치하지 않습니다.');
					
				}
			}
		})	
	})
	
</script>
  
<script type="text/javascript">  
  	function joincheck(){
			if(document.joinform.PWD.value != document.joinform.PWDCHECK.value){
				$('#error1').text('비밀번호를 확인해주세요.');
				return false;
			}else {return true;}
		}	
</script>

<c:if test="${success=='1'}">
	<script type="text/javascript">
		alert('수정이 완료되었습니다.');
		location.href="index";
	</script>
</c:if>


<div class="jbody">
	<div class="container">
	      <div class="input-form-backgroud row">
	        <div class="input-form col-md-12 mx-auto">
	          <h4 class="mb-3" style="text-align:center;">정보수정</h4>
	          <form class="validation-form" novalidate name="joinform" method="post" action="memberUpdate">
	              <div class="mb-3" style="width:610px" >
	                <label for="id">아이디 (수정불가)</label>
	                <input type="text" class="form-control" name="ID" value="${loginUser.ID}" required readonly/>
	              </div>
	            
				<div class="mb-3">
	                <label for="pass">비밀번호</label>
	                <input type="password" class="form-control" name="PWD" value="${loginUser.PWD}" id="userpwd" required/>
	                <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
	              </div>
	              
	              <div class="mb-3">
	                <label for="passcheck">비밀번호 확인</label>
	                <input type="password" class="form-control" name="PWDCHECK"  id="userpwdchk" required/>
	                <div class="invalid-feedback" >비밀번호 확인을 입력해주세요.</div>
	                <p class="error_text" id="error1"></p>
	              </div>
		
	            <div class="mb-3">
	              <label for="nickname">닉네임</label>
	              <input type="text" class="form-control" name="NICK" value="${loginUser.NICK}" required/>
	              <div class="invalid-feedback">닉네임을 입력해주세요.</div>
	            </div>
	
	            <div class="mb-3">
	              <label for="phone">전화번호</label>
	              <input type="text" class="form-control" name="PHONE" value="${loginUser.PHONE}" required/>
	              <div class="invalid-feedback">전화번호를 입력해주세요.</div>
	            </div>
	            
	            <div class="mb-3">
	              <label for="name">이름</label>
	              <input type="text" class="form-control" name="NAME" value="${loginUser.NAME}" required/>
	              <div class="invalid-feedback">이름을 입력해주세요.</div>
	            </div>
	
	            <div class="mb-3">
	              <label for="intro"
	                >소개글<span class="text-muted"
	                  >&nbsp;(필수 아님)</span></label>
	              <textarea class="form-control" name="INTRO" value="${loginUser.INTRO}" style="resize: none; height:100px"></textarea>
	            </div>
	            
			    <label for="img">대표사진(필수 아님)</label><br>
			    <label id="imgtext" style="font-weight:bold; font-size:13px">* 적용한 사진은 프로필 대표사진으로 설정됩니다.</label><br><br>
			    <div style="height:200px; width:100%;"> 
				    <img src="images/profile/${loginUser.MEMIMG}" height="150px" id="OLDIMAGE">      
				       <input type="hidden" name="MEMIMG" id="fileimage">
				                  	
					<div id="filename" style="float:left; margin-right:30px;">
						<c:if test="${not empty NEWMEMIMAGE}">
							<img src="${NEWMEMIMAGE}" height='150'/>
						</c:if>
					</div>
				</div>
				
	            <div class="mb-4"></div>
	            <button style="margin-top:20px; background-color:#ca9bee; font-weight:bold; border:1px solid white" class="btn btn-primary btn-lg btn-block" type="submit" onclick="return joincheck();">수정 완료</button>
	            
	            <div style="position:absolute; bottom:90px;">
    				<form name="fromm" id="fileupForm" method="post" enctype="multipart/form-data">
						<input type="file" name="fileimage"><input type="button" id="myButton" value="추가">
					</form> 
  				</div>
	            
	          </form>
	      </div>
	  </div>
	</div>
  </div>	
  
	
	

  	<br><br><br>
  <script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
  
 


<%@ include file="../footer.jsp"%>