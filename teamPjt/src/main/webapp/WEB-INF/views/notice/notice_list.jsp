<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
    <title>공지사항</title>
    
    <style type="text/css">
	 
	 .mm {
	 list-style: none; /* float: left; */ padding: 6px;
	 display:inline-block;
	 }
	 
	 .nn {
  /* width: 150px;
  margin-left: auto;
  margin-right: auto; */
  text-align:center;
	} 
	</style>
    


</head>
<body>

 <c:import url="/header.do"></c:import>

<div style="text-align: center; border: 1px solid #dddddd">
<br>
	<img src="<%=request.getContextPath()%>/resources/image/111.png" class="img-fluid" alt="공지사항" height="300" width="200">
</div>
<br><br>
	<div class="container">
		
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead class="thead-light">
					<tr class="table-active">
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${list}">
					<tr class="table-active">
						<td scope="row">${item.board_idx}</td>
						<td><a href="notice_view.do?board_idx=${item.board_idx}" class="text-dark">${item.board_title}</a></td>
						<td>펫띵주인</td>
						<td>${item.board_regdate}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- <nav aria-label="...">
				<ul class="pagination justify-content-center">
					<li class="page-item">
						<a class="page-link">Previous</a>
					</li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item active" aria-current="page">
						<a class="page-link" href="#">2</a>
					</li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item">
						<a class="page-link" href="#">Next</a>
					</li>
					</ul>
					<div class="float-md-right">
						<a href="notice_write.do"><input type="button" class="btn btn-primary" value="글작성"></a>
					</div>
			</nav> -->
			<div>
				  <ul class="nn">
				    <c:if test="${pageMaker.prev}">
				    	<li class="mm"><a href="notice_list.do${pageMaker.makeQuery(pageMaker.startPage - 1)}" class="list-group-item list-group-item-action list-group-item-secondary" aria-current="true">이전</a></li>
				    </c:if> 
				
				    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    	<li class="mm">
				    	<a href="notice_list.do${pageMaker.makeQuery(idx)}" class="list-group-item list-group-item-action active" aria-current="true">${idx}</a></li>
				    </c:forEach>
				
				    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				    	<li class="mm"><a href="notice_list.do${pageMaker.makeQuery(pageMaker.endPage + 1)}" class="list-group-item list-group-item-action list-group-item-secondary" aria-current="true">다음</a></li>
				    </c:if> 
				  </ul>
			</div>
			<br><br><br>
			<c:if test="${login.member_level == 2 }"> 
			<div class="float-md-right">
						<a href="notice_write.do"><input type="button" class="btn btn-primary" value="글작성"></a>
					</div>
			 </c:if> 
		</div>
	

 <c:import url="/footer.do"></c:import>
</body>
</html>