<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

  
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
  </style>

<div class="jbody">
	<div class="container">
	      <div class="input-form-backgroud row">
	        <div class="input-form col-md-12 mx-auto">
	          <h4 class="mb-3">회원가입</h4>
	          <form class="validation-form" novalidate>
	            <div class="row">
	              <div class="col-md-6 mb-3">
	                <label for="id">아이디 *</label>
	                <input type="text" class="form-control" id="id" value="" required/>
	                <div class="invalid-feedback">아이디를 입력해주세요.</div>
	              </div>
	              <div class="col-md-6 mb-3">
	                <label for="pass">비밀번호 *</label>
	                <input type="text" class="form-control" id="pass" value="" required/>
	                <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
	              </div>
	            </div>
	
	            <div class="mb-3">
	              <label for="nickname">닉네임 *</label>
	              <input type="text" class="form-control" id="nickname" value="" required/>
	              <div class="invalid-feedback">닉네임을 입력해주세요.</div>
	            </div>
	
	            <div class="mb-3">
	              <label for="phone">전화번호 *</label>
	              <input type="text" class="form-control" id="phone" placeholder="010-****-****" required/>
	              <div class="invalid-feedback">전화번호를 입력해주세요.</div>
	            </div>
	
	            <div class="mb-3">
	              <label for="address2"
	                >소개글<span class="text-muted"
	                  >&nbsp;(필수 아님)</span></label>
	              <input type="text" class="form-control" id="address2" placeholder="안녕하세요 반갑습니다"/>
	            </div>          
	            
	            <hr class="mb-4" />
	            <div class="custom-control custom-checkbox">
	              <input type="checkbox" class="custom-control-input" id="aggrement"   required/>
	              <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
	            </div>
	            <div class="mb-4"></div>
	            <button style="background-color:#ca9bee; font-weight:bold; border:1px solid white" class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
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


<%@ include file="footer.jsp"%>