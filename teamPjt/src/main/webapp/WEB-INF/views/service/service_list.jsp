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
    <title>고객센터</title>
    
    <style type="text/css">
			li {list-style: none; display: inline-block; padding: 6px;}
	 .nn {
  text-align:center;
	} 
	</style>
    


</head>
<body>

 <c:import url="/header.do"></c:import>

<div style="text-align: center; border: 1px solid #dddddd">
<br>
	<img src="<%=request.getContextPath()%>/resources/image/고객센터.png" class="img-fluid" alt="고객센터" height="300" width="200">
</div>
<br><br>
	<div class="container">
		
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead class="thead-light">
					<tr class="table-active">
						
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${list}">
					<tr class="table-active">
						
						<td><a href="service_view.do?sboard_idx=${item.sboard_idx}" class="text-dark">${item.sboard_title}</a></td>
						<td>${item.member_name}</td>
						<td>${item.sboard_regdate}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div>
				  <ul class="nn">
				    <c:if test="${pageMaker.prev}">
				    	<li><a href="service_list.do${pageMaker.makeQuery(pageMaker.startPage - 1)}" class="list-group-item list-group-item-action list-group-item-secondary" aria-current="true">이전</a></li>
				    </c:if> 
				
				    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    	<li>
				    	<a href="service_list.do${pageMaker.makeQuery(idx)}" class="list-group-item list-group-item-action active" aria-current="true">${idx}</a></li>
				    </c:forEach>
				
				    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				    	<li><a href="service_list.do${pageMaker.makeQuery(pageMaker.endPage + 1)}" class="list-group-item list-group-item-action list-group-item-secondary" aria-current="true">다음</a></li>
				    </c:if> 
				  </ul>
			</div>
			<br><br><br>
			<c:if test="${login.member_level >= 0 }">
			<div class="float-md-right">
						<a href="service_write.do"><input type="button" class="btn btn-primary" value="글작성"></a>
					</div>
		 </c:if> 
		</div>
	

 <c:import url="/footer.do"></c:import>
</body>
</html>