<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>
    .jbody {height: 460px; background-color:white;}
    .input-form {max-width: 680px;margin-top: 80px;padding: 32px;background: #fff;
      -webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)}
  </style>

<div class="jbody">
	<div class="container">
	      <div class="input-form-backgroud row">
	        <div class="input-form col-md-12 mx-auto" >
	          <h4 class="mb-3">로그인</h4>
	          <form class="validation-form" novalidate>
	           
	              <div class="mb-3">
	                <label for="id">아이디</label>
	                <input type="text" class="form-control" id="id" value="" required/>
	                <div class="invalid-feedback">아이디를 입력해주세요.</div>
	              </div>
	              <div class="mb-3">
	                <label for="pass">비밀번호</label>
	                <input type="text" class="form-control" id="pass" value="" required/>
	                <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
	              </div>
	            
	            <button style="background-color:#ca9bee; font-weight:bold; border:1px solid white" class="btn btn-primary btn-lg btn-block" type="submit">로그인</button>
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