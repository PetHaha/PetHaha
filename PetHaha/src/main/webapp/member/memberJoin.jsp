<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

  
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>
    .jbody {min-height: 100vh; background-color:white;}
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

	function idcheck(){
			
	   if( document.joinform.ID.value=="" ){
	      alert("아이디를 입력하고 중복체크를 진행하세요" );
	      documnet.joinform.ID.focus();
	      return;
	   }
	   var ID = document.joinform.ID.value;
	   var opt = "toolbar=no, menubar=no, resizable=no, width=500, height=250, scrollbars=no";
	   window.open("memberIdCheck?ID=" + ID, "Id check", opt);   
	}
	

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
		
		if(document.joinform.REID.value.length==0){
			$('#iderr').text('아이디 중복확인을 해주세요.');
			return false;
		}else if(document.joinform.REID.value!=document.joinform.ID.value){
			$('#iderr').text('아이디 중복확인을 해주세요.');
			return false;
		}else {
			$('#iderr').text('');
			if(document.joinform.PWD.value != document.joinform.PWDCHECK.value){
				$('#error1').text('비밀번호를 확인해주세요.');
				return false;
			}else {return true;}
		}
	}
</script>
<div class="jbody">
	<div class="container">
	      <div class="input-form-backgroud row">
	        <div class="input-form col-md-12 mx-auto">
	          <h4 class="mb-3" style="margin:0 auto;">회원가입</h4>
	          <form class="validation-form" novalidate name="joinform" method="post" action="memberJoin">
	            <div class="row">
	              <div class="col-md-6 mb-3">
	                <label for="id">아이디 *</label>
	                <input type="text" class="form-control" name="ID" value="" required style="width:350px"/>
	                <div class="invalid-feedback">아이디를 입력해주세요.</div>
	                <input type="hidden" name="REID" value=""/>
	                <p class="error_text" id="iderr"></p>
	              </div>
	              <input type="button" class="btn btn-primary btn-lg btn-block" 
	              style="background-color:#ca9bee; font-weight:bold; border:1px solid white; 
	              width: 200px; height: 60px; margin-top: 10px; margin-left: 100px;" value="중복 확인"  onclick="idcheck()">
	            </div>
	            
				<div class="mb-3">
	                <label for="pass">비밀번호 *</label>
	                <input type="password" class="form-control" name="PWD" value="" id="userpwd" required/>
	                <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
	              </div>
	              
	              <div class="mb-3">
	                <label for="passcheck">비밀번호 확인 *</label>
	                <input type="password" class="form-control" name="PWDCHECK"  id="userpwdchk" value="" required/>
	                <div class="invalid-feedback" >비밀번호 확인을 입력해주세요.</div>
	                <p class="error_text" id="error1"></p>
	              </div>
		
	            <div class="mb-3">
	              <label for="nickname">닉네임 *</label>
	              <input type="text" class="form-control" name="NICK" value="" required/>
	              <div class="invalid-feedback">닉네임을 입력해주세요.</div>
	            </div>
	
	            <div class="mb-3">
	              <label for="phone">전화번호 *</label>
	              <input type="text" class="form-control" name="PHONE" placeholder="010-1234-1234" required/>
	              <div class="invalid-feedback">전화번호를 입력해주세요.</div>
	            </div>
	            
	            <div class="mb-3">
	              <label for="name">이름 *</label>
	              <input type="text" class="form-control" name="NAME" placeholder="홍길동" required/>
	              <div class="invalid-feedback">이름을 입력해주세요.</div>
	            </div>
	
	            <div class="mb-3">
	              <label for="address2"
	                >소개글<span class="text-muted"
	                  >&nbsp;(필수 아님)</span></label>
	              <textarea class="form-control" name="INTRO" placeholder="안녕하세요 반갑습니다" style="resize: none; height:100px"></textarea>
	            </div>          
	            
	            <hr class="mb-4" />
	            <div class="custom-control custom-checkbox">
	              <input type="checkbox" class="custom-control-input" id="aggrement"   required/>
	              <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
	            </div>
	            <div class="mb-4"></div>
	            <button style="background-color:#ca9bee; font-weight:bold; border:1px solid white" class="btn btn-primary btn-lg btn-block" type="submit" onclick="return joincheck();">가입 완료</button>
	          </form>
	        </div>
	      </div>
	  </div>
  </div>
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