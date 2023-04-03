<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/member/myheader.jsp"%>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>
    .jbody {min-height: 100vh; background-color:white; margin:0 auto;}
    .input-form {max-width: 680px;margin-top: 20px;padding: 32px;background: #fff;
      -webkit-border-radius: 10px;-moz-border-radius: 10px;border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)}
    .error_text{color:#dc3545; font-size:80%}
  </style>

<script type="text/javascript" src="/code.jquery.com/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="js/jquery-3.6.1.js"></script>

<div class="jbody">
   <div class="container">
         <div class="input-form-backgroud row">
           <div class="input-form col-md-12 mx-auto">
             <h4 class="mb-3" style="text-align:center;">정보확인</h4>
             <form class="validation-form" novalidate name="joinform" method="post" action="memberUpdate">
                 <div class="mb-3" style="width:610px" >
                   <label for="id">아이디</label>
                   <input type="text" class="form-control" name="ID" value="${loginUser.ID}" required readonly/>
                 </div>
               
            <div class="mb-3">
                   <label for="pass">비밀번호</label>
                   <input type="password" class="form-control" name="PWD" value="${loginUser.PWD}" id="userpwd" required readonly/>
                 </div>
                 
               <div class="mb-3">
                 <label for="nickname">닉네임</label>
                 <input type="text" class="form-control" name="NICK" value="${loginUser.NICK}" required readonly/>
               </div>
   
               <div class="mb-3">
                 <label for="phone">전화번호</label>
                 <input type="text" class="form-control" name="PHONE" value="${loginUser.PHONE}" required readonly/>
               </div>
               
               <div class="mb-3">
                 <label for="name">이름</label>
                 <input type="text" class="form-control" name="NAME" value="${loginUser.NAME}" required readonly/>
               </div>
   
               <div class="mb-3">
                 <label for="intro"
                   >소개글<span class="text-muted"></span></label>
                 <textarea class="form-control" name="INTRO"  style="resize: none; height:100px" readonly>${loginUser.INTRO}</textarea>
               </div>
               
             <label for="img">대표사진</label><br>
             <div style="height:200px; width:100%;"> 
                <img src="images/profile/${loginUser.MEMIMG}" height="150px" id="OLDIMAGE">                             
            </div>
               </form>            
         </div>
     </div>
   </div>
  </div>   

     <br><br><br>

<%@ include file="../footer.jsp"%>