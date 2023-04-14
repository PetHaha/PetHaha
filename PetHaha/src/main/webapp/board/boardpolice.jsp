<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
<form>
    <div class="police">
        <h2 style="text-align: center; color:#dbadff">게시글 신고</h2>
        <table  class="policebox">
            <tr style="border: 1px solid #dbadff;">
                <th style="width:80px;border: 1px solid #dbadff; height: 30px;" >
                    신고 사유
                </th>
                <td style="border:1px solid #dbadff;">
                    <select class="policeselect">
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
                    <textarea class="policetext" maxlength="200"></textarea>
                </td>
            </tr>
            <tr>
                <th style="background-color: white;"></th>
                <td class="policesubmitbox"><input type="submit" value=" 신고하기" class="policesubmit"><input type="button" value="취소" class="policesubmit"></td>
            </tr>
          </table>
    </div>
</form>
</body>
</html>