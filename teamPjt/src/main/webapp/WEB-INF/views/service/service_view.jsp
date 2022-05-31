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
        <link rel="stylesheet" type="text/css" href="../resources/css/user_css/user.css">
<link rel="stylesheet" type="text/css" href="../resources/css/user_css/user.css">
<meta charset="UTF-8">
<title>고객센터</title>
<style>
	 dd{}
	
</style>
</head>
<body>

<c:import url="/header.do"></c:import>

<div style="text-align: center; border: 1px solid #dddddd">
<br>
	<a href="/test/index.do">
	<img src="<%=request.getContextPath()%>/resources/image/111.png" class="img-fluid" alt="고객센터" height="300" width="200">
	</a>
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
						<td colspan="2">${vo.sboard_title}</td>
					</tr>
					<tr class="table-active">
						<td>작성자</td>
						<td colspan="2">${vo.member_name}</td>
					</tr>
					<tr class="table-active">
						<td>작성일자</td>
						<fmt:parseDate var="RegDate" value="${vo.sboard_regdate }" pattern="yyyy-MM-dd"/>
                        <fmt:formatDate var="RegDate2" value="${RegDate }" pattern="yyyy-MM-dd"/>
						<td colspan="2">${RegDate2}</td>
					</tr>
					 
				</tbody>
			</table>
		</div>
		<br><br><br>
		<div style="min-height: 200px; text-align:left;">
							<div>
							${vo.sboard_content}
							</div>
			</div>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<c:if test="${login.member_level >= 0 }"> 
	<div class="container">
	<div class="float-right" style="min-height: 200px">
			<a href="service_list.do" class="btn btn-primary">목록</a>
			
			<c:if test="${login.member_idx eq vo.member_idx}">
			<a href="service_modify.do?sboard_idx=${vo.sboard_idx}" class="btn btn-primary">수정</a>
			<button class="btn btn-primary" id="popup_open_btn">삭제</button>
			<div id="my_modal">
            삭제하시겠습니까?<br>
            <div class="container">
            <button onclick="document.delfrm.submit();" class="btn btn-primary">네</button>
			<form action="service_delete.do" method="post" name="delfrm">
				<input type="hidden" name="sboard_idx" value="${vo.sboard_idx}">
			</form>
            <a href="service_view.do?sboard_idx=${vo.sboard_idx}"><input type="button" class="btn btn-primary" value="아니요"></a>
            </div>
            <a class="modal_close_btn" style="cursor:pointer;">X</a>
        </div>
			
			
			
			
			
			
			
			
			
			
			
			<%-- <button onclick="document.delfrm.submit();" class="btn btn-primary">삭제</button>
			<form action="service_delete.do" method="post" name="delfrm">
				<input type="hidden" name="sboard_idx" value="${vo.sboard_idx}">
			</form> --%>
			</c:if>
			</div>
			</div>
	</c:if>		
	<br><br><br><br><br><br><br>
	
	
			
			
               
   
	<%-- <button onclick="document.delfrm.submit();" class="btn btn-primary">삭제</button>
	<form action="reply_delete.do" method="post" name="delfrm">
	</form>
	<a href="reply_modify.do?reply_idx=${vo.reply_idx}" class="btn btn-primary">수정</a> --%>
	
	
	
	
	
	<div class="container">
			 <div class="outer">
		 <form action="<%=request.getContextPath() %>/reply/reply_write.do" method="post">
    <input type="hidden" name="sboard_idx" value="${vo.sboard_idx}">
    <c:if test="${login.member_level >= 0}">
         <textarea id="reply_content" name="reply_content" rows="6" cols="148" placeholder="댓글을 입력하세요."></textarea>
         <br><br>
         
         <div class="float-md-right">
         <button class="btn btn-outline-success" type="submit" name="reply_content">댓글 등록</button>
         </div>
         </c:if>
    </form>
	</div>
	
		
		<br><br>
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead class="thead-light">
					<tr class="table-active">
						
						<th scope="col">작성자</th>
						<th scope="col">내용</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="voa" items="${list}">
					<tr class="table-active">
						<td>${voa.member_name}</td>
						<td>${voa.reply_content}</td>
						<td>${voa.reply_regdate}  
							<c:if test="${login.member_idx eq voa.member_idx || login.member_level eq 2}">
							<a href="javascript:joinMember(${voa.reply_idx})" class="btn btn-primary">수정</a>
							<form action="reply_delete.do" method="post">
								<input type="hidden" name="reply_idx" value="${voa.reply_idx}">
								<input type="hidden" name="sboard_idx" value="${vo.sboard_idx}">
								<button type="submit" class="btn btn-primary">삭제</button>
							</form>
							</c:if>
						</td>
					</tr>
					
					</c:forEach>
				</tbody>
			</table>
			
			<br><br><br>
			<div class="float-md-right">
						<a href="service_list.do"><input type="button" class="btn btn-primary" value="목록"></a>
					</div>
	</div>
	<c:import url="/footer.do"></c:import>
</body>
<script>
	function joinMember(idx) {
		
		/* console.log(${sboard_idx}); */
		var request = '<%=request.getContextPath()%>';
		//console.log(request);
		
		window.open(request+"/reply/reply_modify.do?sboard_idx="+${sboard_idx}+"&reply_idx="+idx, "_parent","member", "width=500px","height=20px")
	}
</script>
<script src="../resources/js/user/user.js"></script>
</html>
					
						
							
						
					
					
								
			