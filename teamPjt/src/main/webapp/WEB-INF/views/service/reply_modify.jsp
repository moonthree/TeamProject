<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="container">
	<br><h3 style="display:inline;">댓글 수정</h3><br><br>
	<div class="outer">
		 <form action="reply_modify.do" method="post">
   <%--  <input type="hidden" name="sboard_idx" value="${vo.sboard_idx}">
    <input type="hidden" name="reply_idx" value="${vo.reply_idx}"> --%>
     <input type="hidden" name="sboard_idx" value="${vo.sboard_idx}"/>
    	<input type="hidden" name="reply_idx"  value="${vo.reply_idx}"/>
         <textarea id="reply_modify" name="reply_content" rows="6" cols="148" placeholder="댓글을 입력하세요."></textarea>
         <br><br>
         <div class="float-md-right">
         <button class="btn btn-outline-success" type="submit" >댓글 수정</button>
         </div>
    </form>
	</div>
	</div>
</body>
</html>