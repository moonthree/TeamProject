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
    

<title>Insert title here</title>
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
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td scope="row">1</td>
						<td><a href="view.html" class="text-dark">안녕하세요</a></td>
						<td>김삿갓</td>
						<td>2022-04-23</td>
					</tr>
					<tr>
						<td scope="row">2</td>
						<td><a href="view.html" class="text-dark">안녕하세요</a></td>
						<td>김삿갓</td>
						<td>2022-04-23</td>
					</tr>
					<tr>
						<td scope="row">3</td>
						<td><a href="view.html" class="text-dark">안녕하세요</a></td>
						<td>김삿갓</td>
						<td>2022-04-23</td>
					</tr>
					<tr>
						<td scope="row">4</td>
						<td><a href="view.html" class="text-dark">안녕하세요</a></td>
						<td>김삿갓</td>
						<td>2022-04-23</td>
					</tr>
					<tr>
						<td scope="row">5</td>
						<td><a href="view.html" class="text-dark">안녕하세요</a></td>
						<td>김삿갓</td>
						<td>2022-04-23</td>
					</tr>
					<tr>
						<td scope="row">6</td>
						<td><a href="view.html" class="text-dark">안녕하세요</a></td>
						<td>김삿갓</td>
						<td>2022-04-23</td>
					</tr>
					<tr>
						<td scope="row">7</td>
						<td><a href="view.html" class="text-dark">안녕하세요</a></td>
						<td>김삿갓</td>
						<td>2022-04-23</td>
					</tr>
					<tr>
						<td scope="row">8</td>
						<td><a href="view.html" class="text-dark">안녕하세요</a></td>
						<td>김삿갓</td>
						<td>2022-04-23</td>
					</tr>
					<tr>
						<td scope="row">9</td>
						<td><a href="view.html" class="text-dark">안녕하세요</a></td>
						<td>김삿갓</td>
						<td>2022-04-23</td>
					</tr>
					<tr>
						<td scope="row">10</td>
						<td><a href="view.html" class="text-dark">안녕하세요</a></td>
						<td>김삿갓</td>
						<td>2022-04-23</td>
					</tr>
					
				</tbody>
			</table>
			<nav aria-label="...">
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
			</nav>
			
			
		</div>
	

 <c:import url="/footer.do"></c:import>
</body>
</html>