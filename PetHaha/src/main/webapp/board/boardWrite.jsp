<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
	<div id="bbwrap">
        <div id="bbsubject">게시글 쓰기</div>
        <div id="bbwhere">고양이게시판 &gt;</div>
        <div>
            <input type="text" placeholder="제목을 입력하세요. (30글자 이내)" id="bbsub" maxlength="30">
            <br>
            <textarea id="bbcont" placeholder="내용을 입력하세요. (1000글자 이내)" maxlength="1000"></textarea>
            <label for="img" id="imnam"> º 이미지 등록</label>
            <br>
            <br>
            <div style="height:200px; width:100%;"> 
               
              <div id="filename" style="float:left; margin-right:30px;">
                    <img src="thumb.png" height='150'/>
              </div>
           </div>
            <input id="bbwrite" type="submit" value="등록">
        </div>
        <div style="position:absolute; bottom:-30px; margin-left: 5px;" >
            <form name="fromm" id="fileupForm" method="post" enctype="multipart/form-data">
              <input type="file" name="fileimage"><input type="button" id="myButton" value="추가">
           </form> 
        </div>
    </div>

	
<%@ include file="../footer.jsp"%>