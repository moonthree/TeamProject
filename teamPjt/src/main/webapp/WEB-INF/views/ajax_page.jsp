<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <section id="card-list" class="card-list">
	                <div class="container">
	                    <div class="row fundingRow card-list-container thumbnails">
	                    	<c:forEach var="item" items="${searchList}">
	                    		<div class="col-md-4 col-sm-12 item">
					        		<div class="card">
					                    <a href="funding/view.do?funding_idx=${item.funding_idx} ">
					                    	<img src="resources/image/funding_main/${item.funding_thumbnail}" class="card-img-top img2" alt="...">
					                    </a>
					                    <div class="card-body">
						                    <a href="view.do?funding_idx=${item.funding_idx} ">
						                        <h5 class="card-title">${item.funding_title}</h5>
						                    </a>
					                        <p class="card-text">
					                        	<c:if test="${item.funding_category eq 0}">
					                        		강아지
					                        	</c:if>
					                        	<c:if test="${item.funding_category eq 1}">
					                        		고양이
					                        	</c:if>
					                        	<c:if test="${item.funding_category eq 2}">
					                        		기타
					                        	</c:if>
					                        	| ${item.memberVO.member_business_name }
					                        </p>
					                        <p>${item.funding_idx}(idx 테스트) | ${item.funding_views }(조회수 테스트) </p>
					                        <div class="progress">
					                            <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: ${item.funding_current_price/item.funding_target_price*100}%"
					                                aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
					                        </div>
					                        <p class="card-text cardtext2">
					                            <span class="fundingProgress">${Math.round(item.funding_current_price/item.funding_target_price*100)}%</span>
					                            <span> <fmt:formatNumber value="${item.funding_current_price}" type="number" />원</span>
					                            
					                            
					                            <!-- 남은 날짜 계산 -->
					                            <c:set var="now" value="<%=new java.util.Date()%>"/>
					                            <c:set var="now2"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
			
					                            <fmt:parseDate var="now3" value="${now2 }" pattern="yyyy-MM-dd"/>
					                            <fmt:parseDate var="end" value="${item.funding_end_date }" pattern="yyyy-MM-dd"/>
					                            <fmt:parseNumber var="endDate" value="${end.time / (1000*60*60*24)}" integerOnly="true" />
					                            <fmt:parseNumber var="nowDate" value="${now3.time / (1000*60*60*24)}" integerOnly="true" />
					                            <!-- 남은 날짜 계산 끝 -->
					                            <span class="remainDay">${endDate - nowDate}일 남음</span>
					                        </p>
					                    </div>
					                </div>
					            </div>
	                    	</c:forEach>
	                    </div>
	                </div>
	            </section>