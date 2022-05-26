<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<meta name="viewport" content="width=device-width",initial-scale="1">
<title>공지사항</title>


</head>
<body>
<div style="text-align: center; border: 1px solid #dddddd">
<br>
	<img src="<%=request.getContextPath()%>/resources/image/공지사항.png" class="img-fluid" alt="공지사항" height="300" width="200">
</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="container">
		<div class="row">
		
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">  
				<thead>
					<!-- <tr class="table-active">
						<th colspan="3" style="background-color: #eeeeee; text-align: center;"></th>
						
					</tr> -->
				</thead>
				
				<tbody>
					<tr class="table-active">
						<td style="width:20%;">제목</td>
						<td colspan="2">${vo.board_title}</td>
					</tr>
					<tr class="table-active">
						<td>작성자</td>
						<td colspan="2">펫띵주인</td>
					</tr>
					<tr class="table-active">
						<td>작성일자</td>
						<td colspan="2">${vo.board_regdate}</td>
					</tr>
					<%-- <tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align:left;">${vo.board_content}</td>
						<td colspan="2" style="min-height: 200px; text-align:left;">
							<div>
							${vo.board_content}
							</div>
						</td>
					</tr> --%>
				</tbody>
			</table>
		</div>
		<br><br><br>
		<div style="min-height: 200px; text-align:left;">
							<div>
							${vo.board_content}
							</div>
			</div>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  
	<div class="container">
	<div class="float-right" style="min-height: 200px">
			<a href="notice_list.do" class="btn btn-primary">목록</a>
			<c:if test="${login.member_level eq 2}">
			<a href="notice_modify.do?board_idx=${vo.board_idx}" class="btn btn-primary">수정</a>
			<button onclick="document.delfrm.submit();" class="btn btn-primary">삭제</button>
			<form action="notice_delete.do" method="post" name="delfrm">
				<input type="hidden" name="board_idx" value="${vo.board_idx}">
			</form>
			</c:if>
			</div>
			</div>
	 		
	 
</body>
</html>