<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫딩 기획전 상세</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
    crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="../resources/css/event_css/event_view.css">
<link rel="stylesheet" type="text/css" href="../resources/css/store_css/store_main.css">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
</head>
<body>
	<c:import url="/header.do"></c:import>
	<div class="event_view_headImg">
        <img src="../resources/image/event/${read.event_thumbnail }">
    </div>
    <div class="container event_view_container">
    	<div class="event_view_header">
            <h5>${read.event_title } <span>| ${read.event_subtitle }</span></h5>
            <p><span style="font-weight:bold; font-size:20px;">${eventView.size() }</span> 개의 상품</p>
        </div>
        <div class="row storeRow">
        	<c:forEach var="item" items="${eventView}" varStatus="status">
       			<div class="col-md-3 col-sm-12">
	                <div class="card">
	                    <div class="card-img">
	                        <a href="../store/store_view_event.do?store_idx=${item.store_idx}&store_funding=${item.store_funding}&event=${read.event_price}">
	                            <img src="../resources/upload/store/${item.store_thumbnail}" class="card-img-top img2" alt="...">
	                        </a>
	                    </div>
	                    <div class="card-body store_title">
	                        <a href="../store/store_view_event.do?store_idx=${item.store_idx}&store_funding=${item.store_funding}&event=${read.event_price}">
	                            <div class="card-title">${item.store_title}</div>
	                        </a>
	                        
	                        <P class="card-price"><span class='card-price-event'><fmt:formatNumber value="${item.store_price }" type="number" />원</span>
	                        	<br><span style="color:#fa6462">${read.event_price}%&nbsp;</span><span><fmt:formatNumber value="${item.store_price - item.store_price* read.event_price/100 }" maxFractionDigits="0" type="number" />원</span>
	                        </p>
	                        
	                        <input type="number" id="idx${status.index}" value="${item.store_idx}" style="display:none;">
	                        <!--별점-->
	                        <div>
	                            <svg style="display:none;">
	                                <defs>
	                                    <symbol id="fivestars">
	                                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="20" fill="currentColor" class="bi bi-star"
	                                            viewBox="0 0 24 27">
	                                            <path
	                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
	                                                fill="white" fill-rule="evenodd" />
	                                        </svg>
	                                        <svg xmlns="http://www.w3.org/2000/svg" width="52" height="20" fill="currentColor" class="bi bi-star"
	                                            viewBox="0 0 24 27">
	                                            <path
	                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
	                                                fill="white" fill-rule="evenodd"/>
	                                        </svg>
	                                        <svg xmlns="http://www.w3.org/2000/svg" width="86" height="20" fill="currentColor" class="bi bi-star"
	                                            viewBox="0 0 24 27">
	                                            <path
	                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
	                                                fill="white" fill-rule="evenodd"/>
	                                        </svg>
	                                        <svg xmlns="http://www.w3.org/2000/svg" width="118" height="20" fill="currentColor" class="bi bi-star"
	                                            viewBox="0 0 24 27">
	                                            <path
	                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
	                                                fill="white" fill-rule="evenodd"/>
	                                        </svg>
	                                        <svg xmlns="http://www.w3.org/2000/svg" width="150" height="20" fill="currentColor" class="bi bi-star"
	                                            viewBox="0 0 24 27">
	                                            <path
	                                                d="M12 .587l3.668 7.568 8.332 1.151-6.064 5.828 1.48 8.279-7.416-3.967-7.417 3.967 1.481-8.279-6.064-5.828 8.332-1.151z M0 0 h24 v24 h-24 v-24"
	                                                fill="white" fill-rule="evenodd"/>
	                                        </svg>
	                                    </symbol>
	                                </defs>
	                            </svg>
	                            <div class="rating">
	                                <progress id="rating-bg${status.index }" class="rating-bg" value="${item.avg_star }" max="5"></progress>
	                                <svg>
	                                    <use xlink:href="#fivestars" />
	                                </svg>
	                            </div>
	                            <div class="starNumSearch">
	                            	<c:if test="${item.avg_star > 0}">
	                            		<span class="starAverage">${item.avg_star }</span>
	                            	</c:if>
	                                <c:if test="${item.avg_star eq null}">
	                            		<span class="starAverage">0</span>
	                            	</c:if>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
       		</c:forEach>
        </div>
    </div>
    
	<c:import url="/footer.do"></c:import>
	
	<script src="../resources/js/event/event_view.js"></script>
</body>
</html>