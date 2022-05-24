<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫딩 기획전</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
    crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="../resources/css/event_css/event_main.css">
</head>
<body>
	<c:import url="/header.do"></c:import>
	 <div class="container event_main_container">
        <h5>기획전</h5>
        <div class="row">
        	<c:forEach var="item" items="${eventMain}">
        		<div class="col-lg-4 col-md-12">
	                <div class="card event_main_card">
	                    <a href="event_view.do?member_idx=${item.member_idx}">
	                        <img src="../resources/image/event/${item.event_thumbnail }" class="card-img-top" alt="...">
	                    </a>
	                    <div class="card-body">
	                        <p class="card-text event_main_card_text">
	                            ${item.event_title}<br>
	                            <span>${item.event_subtitle}</span>
	                        </p>
	                    </div>
	                </div>
	            </div>
        	</c:forEach>
        </div>
     </div>
	<c:import url="/footer.do"></c:import>
</body>
</html>